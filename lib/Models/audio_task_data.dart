import 'dart:convert';
import 'dart:io';
import 'dart:core';

import 'package:path/path.dart' as path;
import 'package:talk_of_the_town/Models/task_payload.dart';
import 'package:talk_of_the_town/Utilities/client_manager.dart';


/// An object for completed tasks which can then be stored in a local database and uploaded
///
/// This includes all the requiredMetadataFields for Bridge, as well as a bunch
/// of other data fields for upload, and a generic "other" field.
/// In addition, for generic access this contains the upload function.
class AudioTaskData {
  String audioPath = "placeholder";
  String taskGuid = 'placeholder';
  String sessionInstanceGuid = 'placeholder';
  String recordingPath = 'placeholder'; // path to the recording file in permanent storage
  DateTime startDate = DateTime.now(); // task started
  DateTime endDate = DateTime.now(); // task completed
  String? deviceTypeIdentifier;
  String? dataGroups;
  String? appVersion;
  String? deviceInfo;
  List<String> participantIds = [];
  List<int> participantAgeMonths = [];
  TaskPayload? taskPayload;
  Map? extraData;

  AudioTaskData(this.audioPath, this.taskGuid,
      this.sessionInstanceGuid, this.recordingPath,
      this.startDate, this.endDate,
      this.deviceTypeIdentifier, this.dataGroups,
      this.appVersion, this.deviceInfo,
      this.participantIds, this.participantAgeMonths,
      this.taskPayload, {this.extraData});

  AudioTaskData.fromJson(Map<String, dynamic> json) {
    audioPath = json["audioPath"];
    taskGuid = json['taskGuid'];
    sessionInstanceGuid = json['sessionInstanceGuid'];
    recordingPath = json['recordingPath'];
    startDate = DateTime.parse(json['startDate']);
    endDate = DateTime.parse(json['endDate']);
    deviceTypeIdentifier = json['deviceTypeIdentifier'];
    dataGroups = json['dataGroups'];
    appVersion = json['appVersion'];
    deviceInfo = json['deviceInfo'];
    participantIds = json['participantIds'];
    participantAgeMonths = json['participantAgeMonths'];
    taskPayload = TaskPayload.fromJson(json['taskPayload']);

    if (json['extraData'] != null) {
      if (json['extraData'] is String){
        extraData = jsonDecode(json['extraData']);
      } else {
        extraData = json['extraData'];
      }
    }
  }
  /// A special constructor for parsing the particular oddities of database encoding
  ///
  /// Specifically, extraData, taskPayload, participantAges and participantIds
  /// are recorded as strings and need to be decoded
  AudioTaskData.fromDatabase(Map<String, dynamic> json) {
    taskGuid = json['taskGuid'];
    sessionInstanceGuid = json['sessionInstanceGuid'];
    recordingPath = json['recordingPath'];
    startDate = DateTime.parse(json['startDate']);
    endDate = DateTime.parse(json['endDate']);
    deviceTypeIdentifier = json['deviceTypeIdentifier'];
    dataGroups = json['dataGroups'];
    appVersion = json['appVersion'];
    deviceInfo = json['deviceInfo'];
    if (json['participantIds'] is String) {
      // convert to list[String]
      participantIds = List<String>.from(jsonDecode(json['participantIds']));
    } else {
      participantIds = json['participantIds'];
    }
    if (json['participantAgeMonths'] is String) {
      participantAgeMonths = List<int>.from(jsonDecode(json['participantAgeMonths']));
    } else {
      participantAgeMonths = json['participantAgeMonths'];
    }
    if (json['taskPayload'] is String){
      taskPayload = TaskPayload.fromJson(jsonDecode(json['taskPayload']));
    } else {
      taskPayload = TaskPayload.fromJson(json['taskPayload']);
    }

    if (json['extraData'] != null) {
      if (json['extraData'] is String){
        extraData = jsonDecode(json['extraData']);
      } else {
        extraData = json['extraData'];
      }
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> audioDataJson = {
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
      'taskPayload': taskPayload!.toMap()
    };
    if (extraData != null) {
      audioDataJson['extraData'] = extraData;
    }
    return audioDataJson;

  }

  Future<Map<String, dynamic>> uploadAudioTaskData() async {
    print("here is the audioTaskData: ${toJson()}");
    bool succeeded = false;
    ClientManager clientManager = ClientManager();

    Map<String, dynamic> infoForUpload = {
      'createdOn': startDate.toIso8601String(),
      'dataFileName':'metadata.json',
      'format':'v3_generic',
      'item': sessionInstanceGuid,
      'phoneInfo': deviceTypeIdentifier,
      'schemaRevision':2
    };

    // STEP 1: Create directory to be zipped
    Map<String, dynamic> zipPrep = await clientManager.getToBeZipped(
        sessionInstanceGuid);
    Directory toBeZipped = zipPrep["toBeZipped"];
    String tempPath = zipPrep["tempPath"];

    // STEP 2: add files to zip folder
    print("theres nothing i can do, the audio path is $recordingPath");
    String audioFilename = clientManager.addAudioToZip(toBeZipped, recordingPath);
    print("for the record audio, filename is $audioFilename");

    // STEP 2.5 add metadata.json and info.json to zip folder
    clientManager.addJsonFilesToZip(toBeZipped, audioFilename, taskGuid, sessionInstanceGuid, recordingPath, startDate, endDate, deviceTypeIdentifier, dataGroups, appVersion, deviceInfo, participantIds, participantAgeMonths, taskPayload!, extraData);

    // STEP 3: Zip the folder
    String? zipTarget = await clientManager.zipIt(toBeZipped, tempPath);
    print(zipTarget);

    // STEP 4: Get zip content
    Map<String, dynamic> encryptionResult =
    await clientManager.encryptZip(zipTarget!);
    int numBytes = encryptionResult["numBytes"];
    List<int> contentBytes = encryptionResult["contentBytes"];
    String contentMd5 = encryptionResult["md5Content"];
    print("did we get this far?");
    print(contentMd5);
    print(contentBytes);

    // STEP 5: Request upload
    String filename = path.basename(zipTarget);

    Map<String, dynamic>? requestResult =
    await clientManager.requestUpload(filename, numBytes, contentMd5);
    String uploadId = requestResult!["uploadId"];
    String uploadUrl = requestResult!["uploadUrl"];

    // STEP 6: Do Upload
    await clientManager.uploadContent(
        uploadUrl, filename, contentBytes, contentMd5, zipTarget);

    // STEP 7: Trigger Synapse Migration
    await clientManager.uploadComplete(uploadId);

    // a loop that checks at 1s intervals whether the upload is complete.
    bool finished = false;
    // timer for checking whether it's timed out
    Stopwatch timeOuter = Stopwatch()..start();
    print("upload id = $uploadId");
    while(finished == false){
      if (timeOuter.elapsed.inSeconds > 15){
        print("ah fuck it");
        finished = true;
      }

      bool uploadValidated = await clientManager.validateUpload(uploadId);
      if (uploadValidated == true){
        finished = true;
        succeeded = true;
        print("Upload validation confirmed");
      }
    }
    print("we out");
    Map<String,dynamic> uploadOutcome = {'succeeded': succeeded, 'uploadId': uploadId};
    return uploadOutcome;
  }

  /// Packages this AudioTaskData object into a zip and uploads it.
  ///
  /// Uses Bridge's generic v2 bundle upload system
  /// https://developer.sagebridge.org/articles/bundled_zip_file_uploads.html#v2-generic-bundles
  /*Future<Map<String, dynamic>> uploadAudioTaskData() async {
    bool succeeded = false;
    ClientManager client = ClientManager();
    // required for upload:
    // info.json containing a few basic fields (pulled from the data object)
    // metadata.json containing all the data we want to include
    // audio file
    // all of that put into a folder, folder zipped, and the whole thing uploaded.
    Map<String, dynamic> infoForUpload = {
      'createdOn': startDate.toIso8601String(),
      'dataFileName':'metadata.json',
      'format':'v2_generic',
      'item': sessionInstanceGuid,
      'phoneInfo': deviceTypeIdentifier,
      'schemaRevision':2
    };

    // create a directory with everything we need to zip.
    Directory tempDirParent = await getTemporaryDirectory();
    String tempPath = '${join(tempDirParent.path, sessionInstanceGuid)}';
    print(tempPath);
    Directory toBeZipped = await Directory(tempPath).create();

    // create info.json and metadata.json as actual files in this directory
    File infoFile = File('${toBeZipped.path}/info.json');
    infoFile.writeAsString(jsonEncode(infoForUpload));

    File metaFile = File('${toBeZipped.path}/metadata.json');
    metaFile.writeAsString(jsonEncode(toJson()));

    // copy audio file into directory.
    File recordingFile = File(recordingPath);
    String recordingFileName =  basename(recordingPath); //just the file stripped of the path.
    try {
      recordingFile.copySync('${toBeZipped.path}/$recordingFileName');
    } catch (e) {
      print(e);
    }

    // Zip the whole thing.
    String zipTarget =  '$tempPath.zip';
    try {
      await ZipFile.createFromDirectory(sourceDir: toBeZipped, zipFile: File(zipTarget));
    } catch (e) {
      print(e);
    }

    // Call the uploader in client manager, which returns an upload id to check against.
    // TODO: upload data the way this version of the app does it, that line is from the old app
    // String uploadID = await client.uploadData(zipTarget);

    // a loop that checks at 1s intervals whether the upload is complete.
    bool finished = false;
    // timer for checking whether it's timed out
    Stopwatch timeOuter = Stopwatch()..start();
    while(finished == false){
      if (timeOuter.elapsed.inSeconds > 15){
        finished = true;
      }
      bool uploadValidated = await client.validateUpload(uploadID);
      if (uploadValidated){
        finished = true;
        succeeded = true;
        print("Upload validation confirmed");
      }
    }
    Map<String,dynamic> uploadOutcome = {'succeeded': succeeded, 'uploadId': uploadID};
    return uploadOutcome;
  }*/



}