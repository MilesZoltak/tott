import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:talk_of_the_town/Models/participant.dart';
import 'package:talk_of_the_town/Screens/loading.dart';
import 'package:talk_of_the_town/Utilities/database_manager.dart';

class EndTaskQuestions extends StatefulWidget {
  List<String> taskList;
  List<Participant> participants;

  EndTaskQuestions(this.taskList, this.participants, {super.key});

  @override
  State<EndTaskQuestions> createState() => _EndTaskQuestionsState();
}

class _EndTaskQuestionsState extends State<EndTaskQuestions> {
  final introKey = GlobalKey<IntroductionScreenState>();

  EdgeInsets titlePadding = const EdgeInsets.only(top: 32);
  TextStyle titleTextStyle = const TextStyle(fontSize: 32);
  TextStyle bodyTextStyle = const TextStyle(fontSize: 20);
  TextStyle summaryTextStyle = const TextStyle(fontSize: 28);
  TextAlign summaryAlignment = TextAlign.center;

  bool freeze = true;

  late bool askParticipants;
  bool loading = true;

  List<String> participatingChildren = [];
  String whatTeachingResponse = "";
  bool? didHaveFun;

  /// Pulls the nicknames of the participants from their identifiers for endTaskQ
  Future<List> participantNames() async {
    DatabaseManager databaseManager = DatabaseManager();
    List<Participant> allParticipantInfo =
        await databaseManager.getAllParticipants();
    List nameList = [];
    // go through list, extract nicknames, populate.
    int counter = 0;
    allParticipantInfo.forEach((element) {
      nameList.add(element.nickname);
      counter++;
    });
    return nameList;
  }

  List<PageViewModel> getPages() {
    List<PageViewModel> pages = [];

    PageViewModel whichChildPage = PageViewModel(
        titleWidget: Padding(
          padding: titlePadding,
          child: Text(
            "Who was this conversation with?",
            style: titleTextStyle,
          ),
        ),
        bodyWidget: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              String name = widget.participants[index].nickname ?? "[NO NAME]";
              String anonId = widget.participants[index].anonId;
              return CheckboxListTile(
                  title: Text(name),
                  value: participatingChildren.contains(anonId),
                  onChanged: (val) {
                    if (val == null) return;
                    setState(() {
                      if (val) {
                        participatingChildren.add(anonId);
                      } else {
                        participatingChildren.remove(anonId);
                      }

                      freeze = participatingChildren.isEmpty;
                    });
                  });
            },
            separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                ),
            itemCount: widget.participants.length));

    PageViewModel whatTeachingPage = PageViewModel(
        titleWidget: Padding(
          padding: titlePadding,
          child: Text(
            "What were you teaching them or what activity were you doing with them?",
            style: titleTextStyle,
          ),
        ),
        bodyWidget: TextFormField(
            onChanged: (value) {
              setState(() {
                whatTeachingResponse = value;
                freeze = value.isEmpty;
              });
            },
            maxLines: 5, // Customize the number of lines
            decoration: const InputDecoration(
              hintText: 'We talked about...',
              border: OutlineInputBorder(),
            )));

    PageViewModel haveFunPage = PageViewModel(
        titleWidget: Padding(
          padding: titlePadding,
          child: Text(
            "Did you have fun using the app with this activity?",
            style: titleTextStyle,
          ),
        ),
        bodyWidget: Column(
          children: [
            RadioListTile<bool>(
              title: const Text('Yes'),
              value: true,
              groupValue: didHaveFun,
              onChanged: (value) {
                setState(() {
                  didHaveFun = value;
                  freeze = value == null;
                });
              },
            ),
            RadioListTile<bool>(
              title: const Text('No'),
              value: false,
              groupValue: didHaveFun,
              onChanged: (value) {
                setState(() {
                  didHaveFun = value;
                  freeze = value == null;
                });
              },
            ),
          ],
        ));

    PageViewModel thankYouPage = PageViewModel(
        titleWidget: Padding(
          padding: titlePadding,
          child: Text(
            "Thank you",
            style: titleTextStyle,
          ),
        ),
        bodyWidget: Text(
          "Thank you! This task is complete.",
          style: bodyTextStyle,
        ));

    if (widget.taskList.contains("whichChild")) {
      pages.add(whichChildPage);
    }

    if (widget.taskList.contains("whatTeaching")) {
      pages.add(whatTeachingPage);
    }

    if (widget.taskList.contains("haveFun")) {
      pages.add(haveFunPage);
    }
    pages.add(thankYouPage);
    return pages;
  }

  Future manageTaskList() async {
    bool askParticipants = widget.taskList.contains("whichChild");
    // if there is not exactly one participant eligible for this task, ask who did the task.
    if (widget.participants.length != 1) {
      var temp = await participantNames();
      if (widget.taskList.contains("whichChild") == false) {
        widget.taskList.add("whichChild");
      }
      askParticipants = true;
    }

    setState(() => loading = false);
  }

  @override
  void initState() {
    super.initState();
    askParticipants = widget.participants.length != 1;
    manageTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Center(
            child: IntroductionScreen(
              key: introKey,
              onChange: (idx) {
                FocusManager.instance.primaryFocus?.unfocus();
                if (idx < widget.taskList.length) {
                  if (widget.taskList[idx] == "whichChild" && participatingChildren.isNotEmpty) {
                    return;
                  } else if (widget.taskList[idx] == "whatTeaching" && whatTeachingResponse.isNotEmpty) {
                    return;
                  } else if (widget.taskList[idx] == "haveFun" && didHaveFun != null) {
                    return;
                  }
                  setState(() => freeze = true);
                }
              },
              globalHeader: const Align(
                alignment: Alignment.topRight,
              ),
              resizeToAvoidBottomInset: false,
              pages: getPages(),
              freeze: freeze,
              onDone: () async {
                Map results = {
                  "askParticipants": askParticipants,
                  "metadata": {
                    "participating": participatingChildren,
                    "teaching": whatTeachingResponse,
                    "hadFun": didHaveFun
                  }
                }; // returns a map to the parent screen
                Navigator.pop(context, results);
              },
              showBackButton: false,
              showNextButton: false,
              done: const Text("Done", style: TextStyle(fontSize: 18)),
              curve: Curves.ease,
              controlsMargin: const EdgeInsets.all(16),
              controlsPadding: kIsWeb
                  ? const EdgeInsets.all(12.0)
                  : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
              dotsDecorator: const DotsDecorator(
                size: Size(4.0, 4.0),
                spacing: EdgeInsets.symmetric(horizontal: 2),
                activeSize: Size(20.0, 8.0),
                activeColor: Colors.lightGreen,
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
              dotsContainerDecorator: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
          );
  }
}
