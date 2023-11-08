import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:talk_of_the_town/Components/audio_player.dart';
import 'package:talk_of_the_town/Components/audio_recorder.dart';
import 'package:talk_of_the_town/Models/audio_task_data.dart';
import 'package:talk_of_the_town/Models/bridge_dart_sdk/bridge_sdk.models.swagger.dart';
import 'package:talk_of_the_town/Models/participant.dart';
import 'package:talk_of_the_town/Models/task_payload.dart';
import 'package:talk_of_the_town/Screens/Audio%20Recording%20Task/end_task_questions.dart';
import 'package:talk_of_the_town/Screens/home.dart';
import 'package:talk_of_the_town/Screens/loading.dart';
import 'package:talk_of_the_town/Utilities/client_manager.dart';
import 'package:talk_of_the_town/Utilities/database_manager.dart';
import 'package:talk_of_the_town/Utilities/shared_preferences_manager.dart';
import 'package:talk_of_the_town/Utilities/task_activation_manager.dart';
import 'package:talk_of_the_town/main.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:path/path.dart' hide context;

class AudioRecordingTask extends StatefulWidget {
  TaskPayload _payload;

  AudioRecordingTask(this._payload, {super.key});

  @override
  State<AudioRecordingTask> createState() => _AudioRecordingTaskState();
}

class _AudioRecordingTaskState extends State<AudioRecordingTask> {
  DatabaseManager databaseManager = DatabaseManager();
  ClientManager clientManager = ClientManager();

  bool loading = true;

  String audioPath = "";
  File? audioFile;
  final recorder = FlutterSoundRecorder();
  final audioPlayer = AudioPlayer();
  Duration position = Duration.zero;

  String taskText = "";
  DateTime startTime = DateTime.now().toLocal();

  Future<void> taskComplete() async {
    // all these goodies will be fields in the AudioTaskData later on
    List<Participant> participants = widget._payload?.participants ??
        await databaseManager.getAllParticipants();
    String taskGuid = widget._payload.guid;
    String metaTask = widget._payload.taskName;
    String sessionGuid = widget._payload.instanceId;
    String phoneInfo = await SharedPreferencesManager().get(
        SharedPreferencesManager.phone_identifier_key,
        defaultValue: 'unknown');
    String nowTime = DateTime.now().toLocal().toIso8601String();
    // Something that is user-unique in the filename.
    String externalId = loginInfo?.externalId ?? 'noExternalId';
    String newFileName = '$metaTask\_$externalId\_$sessionGuid\_$nowTime.wav';
    var docDir = await getApplicationDocumentsDirectory();
    String permPath = '${join(docDir.path, newFileName)}';
    audioFile!.copySync(permPath);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appVersion = packageInfo.version;
    DeviceInfoPlugin phoneOsInfo = DeviceInfoPlugin();
    var osInfo = await phoneOsInfo.deviceInfo;
    // Map allDeviceInfo = osInfo.toMap();
    // String whatDevice = allDeviceInfo['model'];
    String whatDevice = osInfo.data["model"];

    // this will later be set by our attempts to call insertData with AudioTaskData
    int success = 0;

    // deal with end task questions if they are
    if (widget._payload.endTaskQ) {
      // set us up to gather end task question content
      List<String> taskList = widget._payload.endTaskQContent ?? [];
      // ignore: use_build_context_synchronously
      Map? endQData = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EndTaskQuestions(taskList, participants)));

      if (endQData != null) {
        bool askParticipants = endQData["askParticipants"];
        Map<String, dynamic> metadata = endQData["metadata"];

        // collect some more information about participants (in endtaskq) for audiodata upload
        List<String> participatedIDs = [];
        List<int> participatedAges = [];
        DateTime timeCompleted = DateTime.now().toLocal();

        // if true, we only upload info from selected participants, if false we just get em all
        if (askParticipants) {
          List participated = metadata['participating']; // list of nicknames
          List<Participant> participantInfo =
              await databaseManager.getAllParticipants();
          DateTime timeCompleted = DateTime.now().toLocal();
          for (var element in participated) {
            for (var partic in participantInfo) {
              if (partic.anonId == element) {
                participatedIDs.add(partic.anonId);
                participatedAges.add(partic.ageMonths);
              }
            }
          }
        } else {
          // because participant is a list of Participant objects, we can pull direct.
          for (var element in participants) {
            participatedIDs.add(element.anonId);
            participatedAges.add(element.ageMonths);
          }
        }

        // wahoo! we finally are able to create the AudioTaskData object
        AudioTaskData recordedData = AudioTaskData(
            audioFile?.path ?? "no path",
            taskGuid,
            sessionGuid,
            // TODO: This somehow was null.
            permPath,
            startTime,
            timeCompleted,
            whatDevice,
            // device make/model
            'none',
            // data groups irrelevant
            appVersion,
            phoneInfo,
            participatedIDs,
            participatedAges,
            widget._payload,
            extraData: endQData);
        print("audio task data on line 120. audioPath = ${recordedData.audioPath}, recordingPath = ${recordedData.recordingPath}");

        // try to insert data
        success = await databaseManager.insertData(recordedData);

        // Need to update the status of the task itself, esp for repeating tasks!
        TaskPayload updatedPayload = widget._payload;
        updatedPayload.status =
            'pending'; // for now, return to 'pending' status
        databaseManager.updateTaskPayload(updatedPayload);

        // check if we need to trigger a custom event
        if (widget._payload.triggerCustomEvent != null) {
          StudyActivityEvent triggeredEvent = StudyActivityEvent(
              eventId: widget._payload.triggerCustomEvent,
              timestamp: DateTime.now().toUtc(),
              // needs to go through UTC b/c ISO assumes Zulu time
              createdOn: DateTime.now().toUtc());

          // Adds StudyActivityEvent to local database, actually upload happens later.
          databaseManager.addStudyActivityEvent(triggeredEvent,
              uploaded: false);

          //now is exactly when to check for new notifications to schedule etc.
          await TaskActivationManager().checkNewActivations();
        }
      }
    } else {
      // this is the case where payload.endTaskQ == false, which makes things simpler

      // collect participant IDs and ages from all participants
      //    (bc we just assume all participants are involved
      //    if there is no endtaskq to distinguish who participated)
      List<Participant> participantInfo =
          await databaseManager.getAllParticipants();
      List<String> particID = [];
      List<int> participatedAges = [];
      for (var element in participantInfo) {
        if (participants.contains(element.nickname)) {
          particID.add(element.anonId);
          participatedAges.add(element.ageMonths);
        }
      }
      DateTime timeCompleted = DateTime.now().toLocal();

      // now we can construct our AudioTaskData obj
      AudioTaskData recordedData = AudioTaskData(
          audioFile?.path ?? "no path",
          // audioFile != null ? audioFile!.path : "",
          taskGuid,
          sessionGuid,
          permPath,
          startTime,
          timeCompleted,
          whatDevice,
          'none',
          appVersion,
          phoneInfo,
          particID,
          participatedAges,
          widget._payload,
          extraData: {});

      print("audio task data on line 184. audioPath = ${recordedData.audioPath}, recordingPath = ${recordedData.recordingPath}");

      // and try to insert it
      success = await databaseManager.insertData(recordedData);

      // of course we have to update the payload in this instance too
      TaskPayload updatedPayload = widget._payload;
      updatedPayload.status = 'pending'; // for now, revert to 'pending' status
      databaseManager.updateTaskPayload(updatedPayload);

      databaseManager.updateTaskPayload(updatedPayload);
      if (widget._payload.triggerCustomEvent != null) {
        StudyActivityEvent triggeredEvent = StudyActivityEvent(
            eventId: widget._payload.triggerCustomEvent,
            timestamp: DateTime.now().toUtc(),
            createdOn: DateTime.now().toUtc());
        databaseManager.addStudyActivityEvent(triggeredEvent, uploaded: false);
        //now is exactly when to check for new notifications to schedule etc.
        await TaskActivationManager().checkNewActivations();
      }
    }

    // now we have to do some client stuff
    // indicates our insert attempts were successful
    if (success > 0) {
      if (widget._payload.triggerCustomEvent != null) {
        StudyActivityEvent newEvent = StudyActivityEvent(
            eventId: widget._payload!.triggerCustomEvent,
            timestamp: DateTime.now().toLocal(),
            createdOn: DateTime.now().toLocal());
        bool uploadNewEvent = await clientManager.postActivityEvent(newEvent);
        int eventAdded = await databaseManager.addStudyActivityEvent(newEvent,
            uploaded: uploadNewEvent);
      }

      // An extra dialog to confirm upload
      ConnectivityResult onWifi = await Connectivity().checkConnectivity();
      String haveWifi = "You are NOT on wifi.";
      if (onWifi == ConnectivityResult.wifi) {
        haveWifi = "You are connected to wifi.";
      }

      // ignore: use_build_context_synchronously
      await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Upload now?"),
              content: Text(
                  "Upload recording now or store and upload later? Note: $haveWifi"),
              actions: <Widget>[
                Column(children: [
                  OutlinedButton(
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Upload in progress')));
                        await doUploadLastData();
                        Navigator.pop(context);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                            (r) => false);
                      },
                      child: const Text("Upload now")),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.red)),
                    child: const Text("Upload later",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const Home()),
                          (r) => false);
                    },
                  )
                ])
              ],
            );
          });
    } else {
      // this is the case where there was an error uploading
      // TODO: give them some sort of explanation, or think of a more appropraite way of handling this
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Home()), (r) => false);
    }
  }

  /*/// Processes and saves the data locally, sets up upload, and returns to the main page.
  Future<void> oldTaskComplete() async {
    DatabaseManager databaseManager = DatabaseManager();

    //Step 1: We need to save/upload the file.
    // We can't store the file directly in the database, so we have to re-save
    // the file somewhere more permanent, then store the path in the table.
    // file ID from the temp file ID
    List<String> pathBreakdown = audioFile!.path!.split(Platform.pathSeparator);
    print("path breakdown: $pathBreakdown");
    String fileId = pathBreakdown.last;
    fileId = fileId.replaceAll('-', '');
    print("file id = $fileId");
    fileId = fileId.substring(0, fileId.length - 4);
    print(fileId);
    // copy and re-save output file in a more permanent folder using copySync
    // filename will be task, sessionId, datetime?
    List<Participant> participants = widget._payload?.participants ??
        await databaseManager.getAllParticipants();
    String taskGuid = widget._payload?.guid ?? 'unprompted';
    String metaTask = widget._payload?.taskName ?? 'unnamed';
    String sessionGuid = widget._payload!.instanceId;
    String phoneInfo = await SharedPreferencesManager().get(
        SharedPreferencesManager.phone_identifier_key,
        defaultValue: 'unknown');
    String nowTime = DateTime.now().toLocal().toIso8601String();
    // Something that is user-unique in the filename.
    String externalId = loginInfo?.externalId ?? 'noExternalId';
    String newFileName = '$metaTask\_$externalId\_$sessionGuid\_$nowTime.wav';
    var docDir = await getApplicationDocumentsDirectory();
    String permPath = '${join(docDir.path, newFileName)}';
    print("audio file path: ${audioFile!.path}");
    audioFile!.copySync(permPath);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appVersion = packageInfo.version;

    // Get phone OS info. Phone user identity (i.e. which parent) is stored in shared prefs
    DeviceInfoPlugin phoneOsInfo = DeviceInfoPlugin();
    var osInfo = await phoneOsInfo.deviceInfo;
    Map allDeviceInfo = osInfo.toMap();
    String whatDevice = allDeviceInfo['model'];

    int success = 0;

    // if there are end task questions...
    if (widget._payload!.endTaskQ) {
      List<String> taskList = widget._payload.endTaskQContent ?? [];
      // ignore: use_build_context_synchronously
      Map? endQData = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EndTaskQuestions(taskList, participants)));

      if (endQData != null) {
        bool askParticipants = endQData["askParticipants"];
        Map<String, dynamic> metadata = endQData["metadata"];

        // read from end of task questionnaire back into the metadata.
        // todo: make this more reliable about moving on to upload step.
        List<String> participatedIDs = [];
        List<int> participatedAges = [];
        DateTime timeCompleted = DateTime.now().toLocal();
        if (askParticipants) {
          List participated = metadata['participating']; // list of nicknames
          List<Participant> participantInfo =
              await databaseManager.getAllParticipants();
          DateTime timeCompleted = DateTime.now().toLocal();
          for (var element in participated) {
            for (var partic in participantInfo) {
              if (partic.anonId == element) {
                participatedIDs.add(partic.anonId);
                participatedAges.add(partic.ageMonths);
              }
            }
          }
        } else {
          // because participant is a list of Participant objects, we can pull direct.
          for (var element in participants) {
            participatedIDs.add(element.anonId);
            participatedAges.add(element.ageMonths);
          }
        }
        print("audio file! $audioFile");
        print("audio file path: ${audioFile?.path ?? "its null dummy"}");
        AudioTaskData recordedData = AudioTaskData(
            audioFile!.path,
            taskGuid,
            sessionGuid,
            // TODO: This somehow was null.
            permPath,
            startTime,
            timeCompleted,
            whatDevice,
            // device make/model
            'none',
            // data groups irrelevant
            appVersion,
            phoneInfo,
            participatedIDs,
            participatedAges,
            widget._payload,
            extraData: endQData); // todo: Add any other thing in the endtaskq
        success = await databaseManager.insertData(recordedData);
        // Need to update the status of the task itself, esp for repeating tasks!
        TaskPayload updatedPayload = widget._payload!;
        updatedPayload.status =
            'pending'; // for now, return to 'pending' status
        databaseManager.updateTaskPayload(updatedPayload);
        if (widget._payload!.triggerCustomEvent != null) {
          StudyActivityEvent triggeredEvent = StudyActivityEvent(
              eventId: widget._payload!.triggerCustomEvent,
              timestamp: DateTime.now().toUtc(),
              // needs to go through UTC b/c ISO assumes Zulu time
              createdOn: DateTime.now().toUtc());
          // Adds StudyActivityEvent to local database, actually upload happens later.
          databaseManager.addStudyActivityEvent(triggeredEvent,
              uploaded: false);
          //now is exactly when to check for new notifications to schedule etc.
          await TaskActivationManager().checkNewActivations();
        }
      } else {}
    } else {
      List<Participant> participantInfo =
          await databaseManager.getAllParticipants();
      List<String> particID = [];
      List<int> participatedAges = [];
      for (var element in participantInfo) {
        if (participants.contains(element.nickname)) {
          particID.add(element.anonId);
          participatedAges.add(element.ageMonths);
        }
      }
      DateTime timeCompleted = DateTime.now().toLocal();

      // construct audio task data object
      // pull the task and session guid from the AudioTaskPayload.
      print("audio file! $audioFile");
      print("audio file path: ${audioFile?.path ?? "its null dummy"}");
      AudioTaskData recordedData = AudioTaskData(
          audioFile != null ? audioFile!.path : "",
          taskGuid,
          sessionGuid,
          permPath,
          startTime,
          timeCompleted,
          whatDevice,
          'none',
          appVersion,
          phoneInfo,
          particID,
          participatedAges,
          widget._payload,
          extraData: {});

      success = await databaseManager.insertData(recordedData);
      TaskPayload updatedPayload = widget._payload!;
      updatedPayload.status = 'pending'; // for now, revert to 'pending' status
      // this is not await because the checknewactivations system needs to pay attn to its status.
      // because nothing in checknewactivations invokes this, it needs to be
      // fully synchronously activated.
      databaseManager.updateTaskPayload(updatedPayload);
      if (widget._payload!.triggerCustomEvent != null) {
        StudyActivityEvent triggeredEvent = StudyActivityEvent(
            eventId: widget._payload!.triggerCustomEvent,
            timestamp: DateTime.now().toUtc(),
            createdOn: DateTime.now().toUtc());
        databaseManager.addStudyActivityEvent(triggeredEvent, uploaded: false);
        //now is exactly when to check for new notifications to schedule etc.
        await TaskActivationManager().checkNewActivations();
      }
    }

    ClientManager clientManager = ClientManager();
    if (success > 0) {
      // Regardless, update studyActivityEvent and upload that at least.
      if (widget._payload!.triggerCustomEvent != null) {
        StudyActivityEvent newEvent = StudyActivityEvent(
            eventId: widget._payload!.triggerCustomEvent,
            timestamp: DateTime.now().toLocal(),
            createdOn: DateTime.now().toLocal());
        bool uploadNewEvent = await clientManager.postActivityEvent(newEvent);
        int eventAdded = await databaseManager.addStudyActivityEvent(newEvent,
            uploaded: uploadNewEvent);
      }

      // An extra dialog to confirm upload
      ConnectivityResult onWifi = await Connectivity().checkConnectivity();
      String haveWifi = "You are NOT on wifi.";
      if (onWifi == ConnectivityResult.wifi) {
        haveWifi = "You are connected to wifi.";
      }

      // ignore: use_build_context_synchronously
      await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Upload now?"),
              content: Text(
                  "Upload recording now or store and upload later? Note: $haveWifi"),
              actions: <Widget>[
                Column(children: [
                  OutlinedButton(
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Upload in progress')));
                        await doUploadLastData();
                        print("we should be popping!!!");
                        Navigator.pop(context);
                        return;
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                            (r) => false);
                      },
                      child: const Text("Upload now")),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.red)),
                    child: const Text("Upload later",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const Home()),
                          (r) => false);
                    },
                  )
                ])
              ],
            );
          });
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Home()), (r) => false);
    }
  }*/

  Future<void> uploadData(AudioTaskData element) async {
    Map uploadOutcome = await element.uploadAudioTaskData();
    bool successful = uploadOutcome['succeeded'];
    String uploadID = uploadOutcome['uploadId'];

    if (successful == true) {
      await databaseManager.deleteUploadId(uploadID);

      // Update adherence record
      // First, pull the eventTimestamp by looking up the triggering event from sessionId.
      DateTime scheduledSessionTimeStamp = DateTime.now().toLocal();
      ScheduledSession? getScheduledSessionInfo =
          await databaseManager.getSpecificScheduledSession(
              instanceGuid: element.sessionInstanceGuid);
      if (getScheduledSessionInfo != null) {
        if (getScheduledSessionInfo.startEventId != null) {
          List<StudyActivityEvent> lastEvents = await databaseManager
              .getLastStudyActivityEvent(getScheduledSessionInfo.startEventId!);
          scheduledSessionTimeStamp =
              lastEvents.last.timestamp ?? scheduledSessionTimeStamp;
        }
      }

      AdherenceRecord updateAdherence = AdherenceRecord(
          instanceGuid: element.sessionInstanceGuid,
          startedOn: element.startDate,
          finishedOn: element.endDate,
          eventTimestamp: scheduledSessionTimeStamp,
          uploadedOn: DateTime.now().toLocal());
      bool adherence = await clientManager.postAdherenceRecord(updateAdherence);

      if (adherence) {
        print("Adherence record updated");
      } else {
        print("Adherence record failed to update.");
      }

      // While we're here, updating StudyActivityEvents on the server:
      // Pull unuploaded from database, upload.
      List<StudyActivityEvent> toUpload =
          await databaseManager.getUnuploadedStudyActivityEvents();
      int updated = 0;
      int toUpdate = toUpload.length;
      toUpload.forEach((eventUpload) async {
        bool eventUpdated = await clientManager.postActivityEvent(eventUpload);
        if (eventUpdated) {
          // update the database record accordingly.
          updated = updated +
              await databaseManager.updateStudyActivityEvent(eventUpload,
                  uploaded: true);
        }
      });
    }

    // Finally, wipe from local storage
    await databaseManager.deleteCompletedData(element.sessionInstanceGuid);
    // also delete the local recording file, todo: for now.
    File todelete = File(element.recordingPath);
    todelete.deleteSync();
  }

  Future<void> doUploadLastData() async {
    // upload right away, including other stuff that's waiting.....?

    // retrieve unuploaded data
    List<AudioTaskData> completedData =
        await databaseManager.getCompletedData();

    // upload the most recent
    AudioTaskData element = completedData.last;
    await uploadData(element);

    // TODO: this is where we probably should check if we need to go to the review completed data page
    if (completedData.length > 1) {
      // ignore: use_build_context_synchronously
      dynamic result = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Remaining Uploads"),
              content: const Text(
                  "You have other data to upload.  Would you like to upload these activiites?"),
              actions: [
                OutlinedButton(
                    onPressed: () {
                      print("no");
                    },
                    child: const Text("No")),
                OutlinedButton(
                    onPressed: () {
                      print("Yes");
                    },
                    child: const Text("Yes"))
              ],
            );
          });
      //   there is extra data, so do something about it dickhead
    }
  }
/*
  /// Uploads the data on the spot
  ///
  /// TODO: This should only upload the most recent data, not all of it!
  /// TODO: If there is data that is left over, it prompts them to the review page.
  Future<void> oldUploadLastData() async {
    DatabaseManager databaseManager = DatabaseManager();
    ClientManager clientManager = ClientManager();
    // upload right away. In fact upload ALL data waiting to be uploaded, even if this task failed!
    List<AudioTaskData> completedData =
        await databaseManager.getCompletedData();
    // this is basically the same as the function in the review data screen, but just for one item.
    AudioTaskData element = completedData.last;
    print("audio task data (last): ${element.toJson()}");
    print("audiopath: ${element.audioPath}");
    Map uploadOutcome = await element.uploadAudioTaskData();
    bool successful = uploadOutcome['succeeded'];
    String uploadID = uploadOutcome['uploadId'];
    if (successful == true) {
      await clientManager.uploadComplete(uploadID);
      await databaseManager.deleteUploadId(uploadID);
      print("It all worked!");

      // Update adherence record
      // First, pull the eventTimestamp by looking up the triggering event from sessionId.
      DateTime scheduledSessionTimeStamp = DateTime.now().toLocal();
      ScheduledSession? getScheduledSessionInfo =
          await databaseManager.getSpecificScheduledSession(
              instanceGuid: element.sessionInstanceGuid);
      if (getScheduledSessionInfo != null) {
        if (getScheduledSessionInfo.startEventId != null) {
          List<StudyActivityEvent> lastEvents = await databaseManager
              .getLastStudyActivityEvent(getScheduledSessionInfo.startEventId!);
          scheduledSessionTimeStamp =
              lastEvents.last.timestamp ?? scheduledSessionTimeStamp;
        }
      }

      AdherenceRecord updateAdherence = AdherenceRecord(
          instanceGuid: element.sessionInstanceGuid,
          startedOn: element.startDate,
          finishedOn: element.endDate,
          eventTimestamp: scheduledSessionTimeStamp,
          uploadedOn: DateTime.now().toLocal());
      bool adherence = await clientManager.postAdherenceRecord(updateAdherence);
      if (adherence) {
        print("Adherence record updated");
      } else {
        print("Adherence record failed to update.");
      }

      // While we're here, updating StudyActivityEvents on the server:
      // Pull unuploaded from database, upload.
      List<StudyActivityEvent> toUpload =
          await databaseManager.getUnuploadedStudyActivityEvents();
      int updated = 0;
      int toUpdate = toUpload.length;
      toUpload.forEach((eventUpload) async {
        bool eventUpdated = await clientManager.postActivityEvent(eventUpload);
        if (eventUpdated) {
          // update the database record accordingly.
          updated = updated +
              await databaseManager.updateStudyActivityEvent(eventUpload,
                  uploaded: true);
        }
      });
    }

    // Finally, wipe local storage
    await databaseManager.deleteCompletedData(element.sessionInstanceGuid);
    // also delete the local recording file, todo: for now.
    File todelete = File(element.recordingPath);
    todelete.deleteSync();

    // TODO: this is where we probably should check if we need to go to the review completed data page
    if (completedData.length > 1) {
      //   there is extra data, so do something about it dickhead
    }
  }*/

  Widget showAppropriatePlayButton() {
    if (audioPlayer.source == null) {
      return const Column(
        children: [
          Slider(min: 0, max: 0, value: 0, onChanged: null),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("00:00"), Text("00:00")],
            ),
          ),
          CircleAvatar(
            radius: 35,
            child: IconButton(
                icon: Icon(Icons.play_arrow), iconSize: 50, onPressed: null),
          )
        ],
      );
    } else {
      return AudioPlayerComponent(audioPlayer, position);
    }
  }

  @override
  void initState() {
    super.initState();

    taskText = widget._payload.taskText ??
        "No task text provided"; //TODO: replace with a prompt object
  }

  @override
  void dispose() {
    super.dispose();

    if (audioFile != null) {
      // This is where the recording is actually saved!
      if (audioFile!.existsSync()) {
        audioFile!.delete();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Record Conversation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 4),
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    widget._payload.taskText,
                    style: const TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 4),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    AudioRecorderComponent(recorder, audioFile, (newFile) {
                      setState(() {
                        audioFile = newFile;
                        position = Duration.zero;
                        audioPlayer.setSourceDeviceFile(audioFile!.path);
                      });
                    }),
                    showAppropriatePlayButton(),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 4),
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        child: const Text("Cancel"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      OutlinedButton(
                        child: const Text("Done"),
                        onPressed: () {
                          taskComplete();
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
