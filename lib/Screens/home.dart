import 'package:flutter/material.dart';
import 'package:talk_of_the_town/Components/audio_recorder.dart';
import 'package:talk_of_the_town/Debug/debug.dart';
import 'package:talk_of_the_town/Models/task_payload.dart';
import 'package:talk_of_the_town/Screens/Audio%20Recording%20Task/audio_recording_task.dart';
import 'package:talk_of_the_town/Screens/View%20Completed%20Data/view_completed_data.dart';
import 'package:talk_of_the_town/Screens/debug_info.dart';
import 'package:talk_of_the_town/Screens/Edit%20Participant%20Info/select_participant_edit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Talk of the Town"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DebugInfo()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                      // Set the desired corner radius here
                      border: Border.all(
                        color: Colors.lightGreen,
                        width: 4,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.bug_report, color: Colors.white, size: 48),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Debug Information",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectParticipantEdit()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                      // Set the desired corner radius here
                      border: Border.all(
                        color: Colors.lightGreen,
                        width: 4,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, color: Colors.white, size: 48),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Edit Participant Information",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    TaskPayload defaultTaskPayload = TaskPayload(
                        'generic',
                        'manualtask',
                        'unnamed',
                        48,
                        144,
                        [],
                        'Record a conversation with your child!',
                        true,
                        endTaskQContent: ['whichChild', 'whatTeaching', 'haveFun'],
                        triggerCustomEvent: "last_default_task");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AudioRecordingTask(defaultTaskPayload)));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                      // Set the desired corner radius here
                      border: Border.all(
                        color: Colors.lightGreen,
                        width: 4,
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.task, color: Colors.white, size: 48),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Start a Task",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push((context), MaterialPageRoute(builder: (context) => const ViewCompletedData()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                      // Set the desired corner radius here
                      border: Border.all(
                        color: Colors.lightGreen,
                        width: 4,
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.insert_chart_rounded,
                            color: Colors.white, size: 48),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "View Completed Data",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Debug()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                      // Set the desired corner radius here
                      border: Border.all(
                        color: Colors.lightGreen,
                        width: 4,
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.bug_report, color: Colors.white, size: 48),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Debug",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
