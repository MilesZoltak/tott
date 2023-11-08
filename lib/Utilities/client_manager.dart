import 'dart:io';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:convert';
import 'package:flutter_archive/flutter_archive.dart' as fa;
import 'package:flutter/services.dart' show Uint8List, rootBundle;
import 'package:pointycastle/asymmetric/api.dart';
import 'package:talk_of_the_town/Models/bridge_dart_sdk/bridge_sdk.enums.swagger.dart';
import 'package:talk_of_the_town/Models/bridge_dart_sdk/bridge_sdk.models.swagger.dart';
import 'package:talk_of_the_town/Models/task_payload.dart';
import 'package:talk_of_the_town/Utilities/auth_utils.dart';
import 'package:talk_of_the_town/Utilities/secure_storage_manager.dart';
import 'package:talk_of_the_town/main.dart';

class ClientManager {
  String? sessionToken;

  Future uploadSignature(
      String firstName, String lastName, String imageData) async {
    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v3/subpopulations/tott-sandbox/consents/signature";
    final url = Uri.parse(baseUrl + route);

    String sessionToken = await SecureStorageManager().getSessionToken();

    ConsentSignature signedConsent = ConsentSignature(
        name: "Miles Zoltak",
        // name: "$firstName $lastName",
        imageData: imageData,
        // convert from a string representation of a list of bytes to a list of ints to be base64 encoded...
        imageMimeType: 'image/png',
        signedOn: DateTime.now(),
        // TODO: ask users what scope they would like in Consent
        scope: SharingScope.allQualifiedResearchers);

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Bridge-Session": sessionToken
        },
        body: json.encode(signedConsent.toJson()),
      );

      print("signature response: ${jsonDecode(response.body)}");
      return true;
    } catch (e) {
      print("Error occurred uploading signature: $e");
    }
  }

  Future<ParticipantData?> checkExistingOnboardingInfo(
      String email, String reAuthToken) async {
    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v3/users/self/data/{identifier}";
    final url = Uri.parse(baseUrl + route);

    String sessionToken = await SecureStorageManager().getSessionToken();

    try {
      http.Response response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "identifier": "onboarding",
          "Bridge-Session": sessionToken
        },
      );

      // check if there is some specific auth failure mentioned in the original code... reauth if neccessary
      if (response.statusCode == 401) {
        await AuthUtils().reAuth();
        // make recursive call to reattempt
        checkExistingOnboardingInfo(email, reAuthToken);
      } else {
        // get the existing participant
        ParticipantData? existingParticipant = ParticipantData.fromJson(json.decode(response.body));
        print(
            "Successfully checked for existing onboarding data.  Data is ${existingParticipant == null ? "null" : "not null"}.");
        return existingParticipant;
      }
    } catch (e) {
      print("Failed to check for existing onboarding data.  Details: $e");
    }
  }

  Future deleteOnboardingData() async {
    if (loginInfo == null) {
      await AuthUtils().missingLogin();
    }

    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v3/users/self/data/{identifier}";
    final url = Uri.parse(baseUrl + route);

    String sessionToken = await SecureStorageManager().getSessionToken();

    try {
      http.Response response = await http.delete(
        url,
        headers: {
          "Content-Type": "application/json",
          "identifier": "onboarding",
          "Bridge-Session": sessionToken
        },
      );
      print("Successfully deleted existing onboarding data.");
    } catch (e) {
      print("Failed to delete existing onboarding data.  Details: $e");
    }
  }

  Future uploadOnboardingData(ParticipantData onboardingResults) async {
    if (loginInfo == null) {
      await AuthUtils().missingLogin();
    }

    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v3/users/self/data/{identifier}";
    final url = Uri.parse(baseUrl + route);

    String sessionToken = await SecureStorageManager().getSessionToken();

    // first check for existing onboarding data
    ParticipantData? existingParticipant = await checkExistingOnboardingInfo(
        loginInfo!.email!, loginInfo!.reauthToken!);

    // delete existing onboarding data if it is not null
    if (existingParticipant != null) {
      deleteOnboardingData();
    }

    // now we upload the (new) onboarding data
    final data = {
      "identifier": onboardingResults.identifier,
      "data": onboardingResults.toJson(),
    };

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Bridge-Session": sessionToken
        },
        body: json.encode(data),
      );
      print("Onboarding upload response body: ${response.body}");
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  Future deleteParticipant(String participantId) async {
    final url = Uri.parse(
        'https://webservices.sagebridge.org/v3/participants/$participantId');
    String sessionToken = await SecureStorageManager().getSessionToken();

    try {
      final response = await http.delete(url, headers: {
        "Content-Type": "application/json",
        "Bridge-Session": sessionToken
      });

      if (response.statusCode == 200) {
        print('Participant deleted successfully.');
      } else {
        print('Failed to delete participant: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while deleting participant: $e');
    }
  }

  /** this is the crazy assortment of methods needed for uploading data to bridge/synapse **/

  //create a temporary file that will later be turned into a zip file and uploaded
  Future<Map<String, dynamic>> getToBeZipped(String sessionId) async {
    Directory tempDirParent = await getTemporaryDirectory();
    String tempPath = path.join(tempDirParent.path, sessionId);
    Directory toBeZipped = await Directory(tempPath).create();

    // clear toBeZipped of any files it might already have from previous uploads
    //    in theory, this doesn't delete files from where they actually reside, just this directory
    //    which they are copied to at upload time from where they permanently reside
    //    so this shouldn't mess with the "upload later" functionality
    if (await toBeZipped.exists()) {
      final list = toBeZipped.list();
      await for (FileSystemEntity entity in list) {
        if (entity is File) {
          await entity.delete();
        }
      }
    }

    return {"toBeZipped": toBeZipped, "tempPath": tempPath};
  }

  // add our audio data to the zip file
  String addAudioToZip(Directory toBeZipped, String audioPath) {
    File audioFile = File(audioPath);
    String audioFilename = path.basename(audioPath);
    audioFilename = audioFilename.replaceAll(":", "_");
    print("directory path: ${toBeZipped.path}, audio path: $audioPath, filename: $audioFilename");
    try {
      audioFile.copySync("${toBeZipped.path}/$audioFilename");
    } catch (e) {
      print("Error adding recording file to zip folder. Details: $e");
    }

    return audioFilename;
  }

  // add other data we need to the zip (this is probably gonna end up in a table in Synapse???)
  void addJsonFilesToZip(
      Directory toBeZipped,
      String audioFilename,
      String taskGuid,
      String sessionInstanceGuid,
      String recordingPath,
      DateTime startDate,
      DateTime endDate,
      String? deviceTypeIdentifier,
      String? dataGroups,
      String? appVersion,
      String? deviceInfo,
      List<String> participantIds,
      List<int> participantAgeMonths,
      TaskPayload taskPayload,
      Map? extraData) {

    Map<String, dynamic> data = {
      'taskGuid': taskGuid,
      'sessionInstanceGuid': sessionInstanceGuid,
      'recordingPath': recordingPath,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'deviceTypeIdentifier': deviceTypeIdentifier,
      'dataGroups': dataGroups,
      'appVersion': appVersion,
      'deviceInfo': deviceInfo,
      'participantIds': participantIds,
      'participantAgeMonths': participantAgeMonths,
      'taskPayload': taskPayload.toMap()
    };

    if (extraData != null) {
      data['extraData'] = extraData;
    }

    String dataJsonString = json.encode(data);
    File dataFile = File('${toBeZipped.path}/metadata.json');
    dataFile.writeAsString(jsonEncode(dataJsonString));

    // Create the info.json content
    print("here is a test: $audioFilename");
    Map<String, dynamic> infoJson = {
      "files": [
        {"filename": audioFilename, "timestamp": DateTime.now().toIso8601String()},
        {"filename": "metadata.json", "timestamp": DateTime.now().toIso8601String()}
      ],
      "createdOn": DateTime.now().toUtc().toIso8601String(),
      "dataFilename": "data.json",
      "format": "v1_legacy",
      "item": "Voice Activity",
      "schemaRevision": 1,
      "appVersion": appVersion,
      "phoneInfo": deviceInfo,
    };

  }

  // we also need to add info.json to the zip file
  void addInfoToZip(Directory toBeZipped, String appVersion, String phoneInfo) {
    List<File> files = toBeZipped
        .listSync(recursive: true, followLinks: false)
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
      "files": files
          .map((file) => {
                "filename": path.basename(file.path),
                "timestamp": file.lastModifiedSync().toUtc().toIso8601String(),
              })
          .toList(),
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

  // actually zip the file
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

  Uint8List encryptLargeContent(Uint8List largeContent, Encrypter encrypter) {
    final chunkSize = 128; // Adjust the chunk size as needed
    final encryptedChunks = <Uint8List>[];

    for (var i = 0; i < largeContent.length; i += chunkSize) {
      final end = i + chunkSize < largeContent.length ? i + chunkSize : largeContent.length;
      final chunk = largeContent.sublist(i, end);
      String base64Chunk = base64Encode(chunk);
      final encryptedChunk = encrypter.encrypt(base64Chunk).bytes;
      encryptedChunks.add(encryptedChunk);
    }

    // Combine encrypted chunks into a single Uint8List
    final encryptedContent = Uint8List.fromList(encryptedChunks.expand((chunk) => chunk).toList());
    return encryptedContent;
  }

  // now we will encrypt the zip file TODO: once we figure out how to deal with memory constraints!!!!
  Future<Map<String, dynamic>> encryptZip(String contentPath) async {
    //get content of zip file
    File content = File(contentPath);
    String filename = path.basename(contentPath);
    List<int> contentBytes = await content.readAsBytes();
    Uint8List contentBytes2 = await content.readAsBytes();
    String base64Content = base64Encode(contentBytes2);

    // encrypt content
    String publicPem = await rootBundle.loadString('assets/public_key.pem');
    RSAPublicKey publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;
    Encrypter encrypter = Encrypter(RSA(publicKey: publicKey));
    // Uint8List encryptedContent = encrypter.encrypt(base64Content).bytes;
    Uint8List encryptedContent = encryptLargeContent(contentBytes2, encrypter);

    //do md5 hash of that content
    Digest digest = md5.convert(encryptedContent);
    // TODO: delete this and get the top stuff going so we actually encrypt
    // Digest digest = md5.convert(contentBytes);

    String md5Content = base64Encode(digest.bytes);

    // return {"md5Content": md5Content, "numBytes": contentBytes.length};
    return {
      "md5Content": md5Content,
      "numBytes": utf8.encode(base64Content).length,
      "contentBytes": contentBytes2
    };
  }

  // first you have to request an upload
  Future<Map<String, dynamic>?> requestUpload(
      String filename, int numBytes, String md5) async {
    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v3/uploads";
    Uri url = Uri.parse(baseUrl + route);

    final data = {
      "name": filename,
      "contentLength": numBytes,
      "contentType": "application/zip",
      "contentMd5": md5,
      "encrypted": true
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

  // then you have to actually upload it
  Future uploadContent(String uploadUrl, String filename,
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

  // this tells bridge to decrypt, unzip, and send your data to synapse
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

  // get the status of your upload
  Future<bool> validateUpload(String uploadId) async {
    String sessionToken = await SecureStorageManager().getSessionToken();

    final url = Uri.parse(
        'https://webservices.sagebridge.org/v3/uploadstatuses/$uploadId');

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
      return jsonResponse["status"] == "succeeded";
    } catch (e) {
      print("Error occurred validating upload. Details: $e");
      return false;
    }
  }

  /**  That is the end of the synapse/bridge amalgam of upload functions **/

  // gets the onboarding data from the server
  Future<ParticipantData?> getOnboardingData() async {
    if (loginInfo == null) {
      await AuthUtils().missingLogin();
    }

    final url = Uri.parse(
        "https://webservices.sagebridge.org/v3/users/self/data/onboarding");

    print("session token is ${loginInfo!.sessionToken}");
    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "identifier": "onboarding",
          "Bridge-Session": loginInfo!.sessionToken!
        },
      );
      final jsonResponse = json.decode(response.body);
      print("hahahhahaah: ${jsonResponse.toString()}");
      if (response.statusCode != 200) return null;
      // TODO: does this actually render the participantdata object we want?
      ParticipantData unparsed = ParticipantData(
          identifier: jsonResponse["identifier"],
          data: jsonResponse["data"],
          type: jsonResponse["type"]);
      return unparsed;
    } catch (e) {
      print("Error occurred getting participant data. Details: $e");
    }
  }

  /// Retrieves the appconfig from the server, necessary to check for updates.
  Future<AppConfig?> getCurrentConfig() async {
    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v1/apps/tott-sandbox/appconfig";
    final url = Uri.parse(baseUrl + route);

    String sessionToken = await SecureStorageManager().getSessionToken();

    AppConfig? appConfig;

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "appId": "tott-sandbox",
          "Bridge-Session": sessionToken
        },
      );
      print("app config response");
      print(response.body);
      final jsonResponse = jsonDecode(response.body);
      appConfig = AppConfig.fromJson(jsonResponse);
    } catch (e) {
      print("Failed to get AppConfig.  Details: $e");
    }
    return appConfig;
  }

  /// Retrieves *all* ActivityEvents for a participant (if there are any).
  Future<StudyActivityEventList?> getActivityEvents(
      {String studyId = 'tott-sandbox-study'}) async {
    if (loginInfo == null) {
      AuthUtils().missingLogin();
    }

    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v5/studies/{studyId}/participants/self/activityevents";
    final url = Uri.parse(baseUrl + route);

    StudyActivityEventList? activityEventList;

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "studyId": "tott-sandbox-study",
          "Bridge-Session": loginInfo!.sessionToken!
        },
      );
      final jsonResponse = jsonDecode(response.body);
      activityEventList = StudyActivityEventList.fromJson(jsonResponse);
    } catch (e) {
      print("Error retrieving study activity event list.  Details: $e");
    }
    return activityEventList;
  }

  /// Retrieves a "Study" object, primarily only used for initial setup.
  Future<Study?> getStudy(String identifier) async {
    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v5/studies/{studyId}";
    final url = Uri.parse(baseUrl + route);

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "studyId": "tott-sandbox-study",
          "Bridge-Session": loginInfo!.sessionToken!
        },
      );
      if (response.statusCode == 401) {
        await AuthUtils().reAuth();
        return await getStudy(identifier);
      }
      final jsonResponse = jsonDecode(response.body);
      return Study.fromJson(jsonResponse);
    } catch (e) {
      print("Error retrieving study activity event list.  Details: $e");
    }
  }

  /// Retrieves study timeline.
  ///
  /// Checks against existing timeline timestamp for update using ifModifiedSince.
  Future<Timeline?> getTimeline(String studyIdentifier,
      {DateTime? lastChecked}) async {
    if (loginInfo == null) {
      AuthUtils().missingLogin();
    }

    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v5/studies/{studyId}/participants/self/timeline";
    final url = Uri.parse(baseUrl + route);

    try {
      late http.Response response;
      if (lastChecked == null) {
        response = await http.get(
          url,
          headers: {
            "Content-Type": "application/json",
            "studyId": "tott-sandbox-study",
            "Bridge-Session": loginInfo!.sessionToken!
          },
        );
      } else {
        response = await http.get(
          url,
          headers: {
            "Content-Type": "application/json",
            "studyId": "tott-sandbox-study",
            "If-Modified-Since": lastChecked.toIso8601String(),
            "Bridge-Session": loginInfo!.sessionToken!
          },
        );
      }
      if (response.statusCode == 304) {
        print("no timeline updates");
        // no update since last request.
        return null;
      }
      final jsonResponse = json.decode(response.body);
      return Timeline.fromJson(jsonResponse);
    } catch (e) {
      print(e); // error generated
      return null;
    }
  }

  /// Retrieves assessment config from the configurl provided by an AssessmentInfo object
  ///
  /// This doesn't use the usual API b/c the "getAssessmentConfig" system reqs
  /// higher-access roles, so Bridge provides a direct link in AssessmentInfo objects
  Future<Map?> getAssessmentConfig(String configUrl) async {
    final url = Uri.parse(configUrl);

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Bridge-Session": loginInfo!.sessionToken!
        },
      );
      Map rawConfig = jsonDecode(response.body);
      return rawConfig['config'];
    } catch (e) {
      print("Could not retrieve Assessment Conig.  Details: $e");
    }
  }

  /// Adds an event completion on the server.
  Future<bool> postActivityEvent(StudyActivityEvent newEvent) async {
    // TODO: this is currently failing with a 404 account not found error.  that's probably unique to me but i need to solve it
    StudyActivityEventRequest newRequest = StudyActivityEventRequest(
        eventId: newEvent.eventId, timestamp: newEvent.timestamp);
    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v5/studies/{studyId}/participants/self/activityevents";
    final url = Uri.parse(baseUrl + route);

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "studyId": "tott-sandbox-study",
          "showError": "true",
          //TODO: we may not need this after debugging, but i think it will make life much better for now
          "updateBursts": "false",
          "Bridge-Session": loginInfo!.sessionToken!
        },
        body: json.encode(newRequest),
      );
      final jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw ApiException(response.statusCode, response.body);
      }
    } catch (e) {
      print("Error posting ActivityEvent. Details: $e");
      return false;
    }
  }

  /// Updates adherence records
  Future<bool> postAdherenceRecord(AdherenceRecord record) async {
    AdherenceRecordUpdates updates = AdherenceRecordUpdates(records: [record]);

    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v5/studies/{studyId}/participants/self/activityevents";
    final url = Uri.parse(baseUrl + route);

    try {
      final response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "studyId": "tott-sandbox-study",
            "Bridge-Session": loginInfo!.sessionToken!
          },
          body: updates.toJson());
      if (response.statusCode == 200) {
        return true;
      } else {
        throw ApiException(response.statusCode, response.body);
      }
    } catch (e) {
      print("Error posting AdherenceRecord. Details: $e");
      return false;
    }
  }

  Future deleteUser(String userId) async {
    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v3/users/{userId}";
    final url = Uri.parse(baseUrl + route);

    try {
      final response = await http.delete(
        url,
        headers: {
          "Content-Type": "application/json",
          "userId": userId,
          "Bridge-Session": loginInfo!.sessionToken!
        },
      );
      final jsonResponse = jsonDecode(response.body);
      print("delete user response:");
      print(jsonResponse);
    } catch (e) {
      print("Error deleting user.  Details: $e");
    }
  }
}
