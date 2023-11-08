// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talk_of_the_town/Models/audio_task_data.dart';
import 'package:talk_of_the_town/Models/bridge_dart_sdk/bridge_sdk.models.swagger.dart';
import 'package:talk_of_the_town/Screens/loading.dart';
import 'package:talk_of_the_town/Utilities/client_manager.dart';
import 'package:talk_of_the_town/Utilities/database_manager.dart';

class ViewCompletedData extends StatefulWidget {
  const ViewCompletedData({super.key});

  @override
  State<ViewCompletedData> createState() => _ViewCompletedDataState();
}

class _ViewCompletedDataState extends State<ViewCompletedData> {
  DatabaseManager databaseManager = DatabaseManager();
  ClientManager clientManager = ClientManager();

  List<AudioTaskData> completedTasks = [];
  double bulkCompletionValue = 0;

  Future<bool> manageConnectivity(DateTime? timestamp) async {
    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    bool onWifi = connectivityResult == ConnectivityResult.wifi;
    bool onMobile = connectivityResult == ConnectivityResult.mobile;
    bool doUpload = false;

    if (onWifi) {
      doUpload = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Upload?"),
                  content: Text(
                      "Would you like to upload ${timestamp == null ? "all activities" : "your activity from ${DateFormat('MMM d, y h:mm a').format(timestamp)}"}?\nNote: You are on WiFi."),
                  actions: [
                    OutlinedButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text("Upload Now"))
                  ],
                  actionsAlignment: MainAxisAlignment.center,
                );
              }) ??
          false;
    } else if (onMobile) {
      doUpload = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                      "Upload ${timestamp == null ? "all" : "activity from ${DateFormat('MMM d, y h:mm a').format(timestamp)}"}?\nNote: You are not on WiFi."),
                  actions: [
                    OutlinedButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text("Upload Now")),
                  ],
                  actionsAlignment: MainAxisAlignment.center,
                );
              }) ??
          false;
    } else {
      await showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("No Connection"),
              content: Text(
                  "You are not connected to the internet.  Please connect or try again later to continue uploading."),
            );
          });
    }

    return doUpload;
  }

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
    File toDelete = File(element.recordingPath);
    toDelete.deleteSync();

    // TODO: we have to setstate to get rid of the recording that we just uploaded from the listview
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: databaseManager.getCompletedData(),
        builder: (context, future) {
          if (!future.hasData) {
            // return dummy scaffold
            return Scaffold(
                appBar: AppBar(title: const Text("View Completed Data")),
                body: Center(child: Loading()));
          }

          completedTasks = future.data!.reversed.toList();

          return Scaffold(
              appBar: AppBar(
                title: const Text("View Completed Data"),
                actions: [
                  Visibility(
                    visible: completedTasks.isNotEmpty,
                    child: IconButton(
                        onPressed: () async {
                          bool upload = await manageConnectivity(null);
                          if (upload) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                        "Uploading ${completedTasks.length} item${completedTasks.length > 1 ? "s" : ""}."),
                                    content: LinearProgressIndicator(
                                      value: bulkCompletionValue,
                                    ),
                                  );
                                });
                          }
                        },
                        icon: const Icon(Icons.upload)),
                  )
                ],
              ),
              body: Center(
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      child: Text(
                          "Long press an activity to upload, or click the top right to upload all completed activities.",
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              AudioTaskData task = completedTasks[index];
                              return GestureDetector(
                                onLongPress: () async {
                                  bool upload = await manageConnectivity(
                                      completedTasks[index].endDate);

                                  if (upload) {
                                    await uploadData(task);
                                  }
                                },
                                child: ExpansionTile(
                                  title: Text(
                                      DateFormat('MMM d, y h:mm a')
                                          .format(task.endDate),
                                      style: TextStyle(
                                          color: Colors.grey[100],
                                          fontWeight: FontWeight.bold)),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Prompt: ${task.taskPayload?.taskText ?? "[No Prompt]"}"),
                                          Text(
                                              "Children: ${task.taskPayload?.participants?.map((p) => p.nickname) ?? "Any"}"),
                                          const SizedBox(
                                            height: 8,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const Divider(color: Colors.grey),
                            itemCount: completedTasks.length)),
                  ],
                ),
              ));
        });
  }
}
