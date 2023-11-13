import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers_platform_interface/audioplayers_platform_interface.dart'
as audioPI;
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart ';
import 'package:path/path.dart' as path;
import 'package:pointycastle/asn1.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:talk_of_the_town/Utilities/secure_storage_manager.dart';
import 'package:flutter_archive/flutter_archive.dart' as fa;
import 'package:pointycastle/export.dart' as pointy;

class Bundle extends StatefulWidget {
  const Bundle({super.key});

  @override
  State<Bundle> createState() => _BundleState();
}

class _BundleState extends State<Bundle> {
  final recorder = FlutterSoundRecorder();
  final audioPlayer = AudioPlayer();

  bool isRecorderReady = false;

  String audioPath = "";
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String uploadId = "";

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: "audio");
  }

  Future stop() async {
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    final audioFile = File(path!);

    print("Recorded audio: $audioFile");
    audioPath = audioFile.path;
    Source source = DeviceFileSource(audioPath);
    await audioPlayer.setSource(source);
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw "Microphone permission not granted";
    }

    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  @override
  void initState() {
    super.initState();

    initRecorder();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == audioPI.PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() => duration = newDuration);
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() => position = newPosition);
    });
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    audioPlayer.dispose();

    super.dispose();
  }

  String formatTime(Duration duration) {
    return "${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(
        60).toString().padLeft(2, "0")}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bundle"),
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<RecordingDisposition>(
                stream: recorder.onProgress,
                builder: (context, snapshot) {
                  final duration = snapshot.hasData
                      ? snapshot.data!.duration
                      : Duration.zero;

                  String nDigits(int numDigits, int num) =>
                      num.toString().padLeft(numDigits, "0");
                  final minutes = nDigits(1, duration.inMinutes.remainder(60));
                  final seconds = nDigits(2, duration.inSeconds.remainder(60));
                  return Text(
                    "$minutes:$seconds",
                    style: const TextStyle(fontSize: 80),
                  );
                }),
            const SizedBox(height: 32),
            ElevatedButton(
              child: Icon(
                recorder.isRecording ? Icons.stop : Icons.mic,
                size: 80,
              ),
              onPressed: () async {
                if (recorder.isRecording) {
                  await stop();
                } else {
                  await record();
                }
                setState(() {});
              },
            ),
            SizedBox(height: 32),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (val) async {
                final position = Duration(milliseconds: val.toInt() * 1000);
                await audioPlayer.seek(position);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatTime(position),
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    formatTime(duration - position),
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            CircleAvatar(
              radius: 35,
              child: IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 50,
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                  } else {
                    await audioPlayer.resume();
                  }
                },
              ),
            ),
            SizedBox(height: 32),
            OutlinedButton(
              child: Text("Bundle"),
              onPressed: () async {
                // STEP 1: Create directory to be zipped
                Map<String, dynamic> zipPrep = await getToBeZipped(
                    "manualTask"); //TODO: figure out the actual session id
                Directory toBeZipped = zipPrep["toBeZipped"];
                String tempPath = zipPrep["tempPath"];

                // STEP 2: add files to zip folder
                addAudioToZip(toBeZipped, audioPath);

                // STEP 3: Zip the folder
                String? zipTarget = await zipIt(toBeZipped, tempPath);
                print(zipTarget);

                // STEP 4: Get zip content
                Map<String, dynamic> encryptionResult =
                await encryptZip(zipTarget!);
                int numBytes = encryptionResult["numBytes"];
                List<int> contentBytes = encryptionResult["contentBytes"];
                String contentMd5 = encryptionResult["md5Content"];

                // STEP 5: Request upload
                String filename = path.basename(zipTarget);
                print("filename = $filename");
                print("numBytes = $numBytes");
                print("contentMd5 = $contentMd5");

                Map<String, dynamic>? requestResult =
                await requestUpload(filename, numBytes, contentMd5);
                uploadId = requestResult!["uploadId"];
                String uploadUrl = requestResult!["uploadUrl"];

                // STEP 6: Do Upload
                // await uploadContent(
                //     uploadUrl, filename, numBytes, contentMd5, zipTarget);

                await sonOfUploadContent(
                    uploadUrl, filename, contentBytes, contentMd5, zipTarget);

                // STEP 7: Trigger Synapse Migration
                await uploadComplete(uploadId);
              },
            ),
            OutlinedButton(
              child: Text("Validate Upload"),
              onPressed: () async {
                await validateUpload(uploadId);
              },
            )
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getToBeZipped(String sessionId) async {
    Directory tempDirParent = await getTemporaryDirectory();
    String tempPath = "${path.join(tempDirParent.path, sessionId)}";
    Directory toBeZipped = await Directory(tempPath).create();

    return {"toBeZipped": toBeZipped, "tempPath": tempPath};
  }

  void addAudioToZip(Directory toBeZipped, String audioPath) {
    File audioFile = File(audioPath);
    String audioFilename = path.basename(audioPath);
    try {
      audioFile.copySync("${toBeZipped.path}/$audioFilename");
    } catch (e) {
      print("Error adding recording file to zip folder. Details: $e");
    }
  }

  void addDataToZip(Directory toBeZipped,
      String id, String taskGuid, String sessionInstanceGuid, audioPath,
      DateTime startDate, DateTime endDate, String deviceTypeId, String dataGroups,
      String appVersion, String deviceInfo, String participantIds, String participantAgeMonths,
      String taskPayload, String extraData) {
    final data = {
      "_id": id,
      "taskGuid": taskGuid,
      "sessionInstanceGuid": sessionInstanceGuid,
      "recordingPath": audioPath,
      "startDate": startDate.toIso8601String(),
      "endDate": endDate.toIso8601String(),
      "deviceTypeIdentifier": deviceTypeId,
      "dataGroups": dataGroups,
      "appVersion": appVersion,
      "deviceInfo": deviceInfo,
      "participantIds": participantIds,
      "participantAgeMonths": participantAgeMonths,
      "taskPayload": taskPayload,
      "extraData": extraData
    };

    String dataJsonString = json.encode(data);

    File dataFile = File('${toBeZipped.path}/data.json');
    dataFile.writeAsString(jsonEncode(dataJsonString));
  }

  void addInfoToZip(Directory toBeZipped, String appVersion, String phoneInfo) {
    List<File> files = toBeZipped.listSync(recursive: true, followLinks: false)
        .whereType<File>()
        .toList();
    Archive archive = Archive();

    for (var file in files) {
      String relativePath = path.relative(file.path, from: toBeZipped.path);
      archive.addFile(
          ArchiveFile(relativePath, file.lengthSync(), file.readAsBytesSync()));
    }

    // Create the info.json content
    Map<String, dynamic> infoJson = {
      "files": files.map((file) =>
      {
        "filename": path.basename(file.path),
        "timestamp": file.lastModifiedSync().toUtc().toIso8601String(),
      }).toList(),
      "createdOn": DateTime.now().toUtc().toIso8601String(),
      "dataFilename": "data.json",
      "format": "v1_legacy",
      "item": "Voice Activity",
      "schemaRevision": 1,
      "appVersion": appVersion,
      "phoneInfo": phoneInfo,
    };

    // Convert the info.json content to a JSON string
    String infoJsonString = json.encode(infoJson);

    File infoFile = File('${toBeZipped.path}/info.json');
    infoFile.writeAsString(jsonEncode(infoJsonString));
  }

  Future<String?> zipIt(Directory toBeZipped, String tempPath) async {
    String zipTarget = "$tempPath.zip";
    print("temp path: $tempPath");
    try {
      await fa.ZipFile.createFromDirectory(
          sourceDir: toBeZipped, zipFile: File(zipTarget));
      return zipTarget;
    } catch (e) {
      print("Error zipping file. Details: $e");
    }
  }

  Future<Map<String, dynamic>> encryptZip(String contentPath) async {
    //get content of zip file
    File content = File(contentPath);
    String filename = path.basename(contentPath);
    List<int> contentBytes = await content.readAsBytes();
    String base64Content = base64Encode(contentBytes);

    // encrypt content
    String publicPem = await rootBundle.loadString('assets/public_key.pem');
    RSAPublicKey publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;
    Encrypter encrypter = Encrypter(RSA(publicKey: publicKey));
    Uint8List encryptedContent = encrypter.encrypt(base64Content).bytes;

    //
    // //do md5 hash of that content
    Digest digest = md5.convert(encryptedContent);
    // Digest digest = md5.convert(contentBytes);
    String md5Content = base64Encode(digest.bytes);

    // return {"md5Content": md5Content, "numBytes": contentBytes.length};
    return {
      "md5Content": md5Content,
      "numBytes": encryptedContent.length,
      "contentBytes": encryptedContent
    };
  }

  Future<Map<String, dynamic>?> requestUpload(String filename, int numBytes,
      String md5) async {
    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v3/uploads";
    Uri url = Uri.parse(baseUrl + route);

    final data = {
      "name": filename,
      "contentLength": numBytes,
      "contentType": "application/zip",
      "contentMd5": md5,
      "encrypted": false
    };
    print("encrypted is false");

    String sessionToken = await SecureStorageManager().getSessionToken();
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Bridge-Session": sessionToken
        },
        body: json.encode(data),
      );
      final jsonResponse = json.decode(response.body);
      print("upload request response body: $jsonResponse");
      return {"uploadId": jsonResponse["id"], "uploadUrl": jsonResponse["url"]};
    } catch (e) {
      print("Error occurred requesting upload. Details: $e");
    }
  }

  Future sonOfUploadContent(String uploadUrl, String filename,
      List<int> contentBytes, String md5, String filePath) async {
    try {
      final response = await http.put(Uri.parse(uploadUrl),
          headers: <String, String>{
            'Content-Type': 'application/zip',
            'Content-Length': contentBytes.length.toString(),
            'Content-MD5': md5,
            'connection': 'keep-alive'
          },
          body: contentBytes);
      print("everything worked out.");
    } catch (e) {
      print("Error occurred during upload. Details: $e");
    }
  }

  // Future uploadContent(String uploadUrl, String filename, int numBytes,
  //     String md5, String filePath) async {
  //   String sessionToken = await SecureStorageManager().getSessionToken();
  //
  //   final data = {
  //     "name": filename,
  //     "contentLength": numBytes,
  //     "contentType": "application/zip",
  //     "contentMd5": md5,
  //     'connection': 'keep-alive'
  //   };
  //
  //   try {
  //     final response = await http.put(
  //       Uri.parse(uploadUrl),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Bridge-Session": sessionToken
  //       },
  //       body: json.encode(data),
  //     );
  //     print("upload response: ${response.body}");
  //     final jsonResponse = json.decode(response.body);
  //     print("upload response body: $jsonResponse");
  //   } catch (e) {
  //     print("Error occurred during upload. Details: $e");
  //   }
  // }

  Future uploadComplete(String uploadId) async {
    Uri url = Uri.parse(
        'https://webservices.sagebridge.org/v3/uploads/$uploadId/complete');
    String sessionToken = await SecureStorageManager().getSessionToken();

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Bridge-Session": sessionToken
        },
        body: json.encode({}),
      );
      final jsonResponse = json.decode(response.body);
      print("Upload complete response body: $jsonResponse");
      print("upload id: $uploadId");
    } catch (e) {
      print("Error occurred calling upload complete. Details: $e");
    }
  }

  Future validateUpload(String uploadId) async {
    String sessionToken = await SecureStorageManager().getSessionToken();

    final url = Uri.parse(
        'https://webservices.sagebridge.org/v3/uploads/$uploadId/complete');

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Bridge-Session": sessionToken
        },
        body: json.encode({}),
      );
      final jsonResponse = json.decode(response.body);
      print("Upload validation response body: $jsonResponse");
    } catch (e) {
      print("Error occurred validating upload. Details: $e");
    }
  }
}
