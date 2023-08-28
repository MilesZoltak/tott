import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:signature/signature.dart';
import 'package:talk_of_the_town/Screens/learn_more.dart';
import 'package:talk_of_the_town/Screens/onboarding.dart';
import 'package:talk_of_the_town/Utilities/client_manager.dart';
import 'package:talk_of_the_town/Utilities/secure_storage_manager.dart';

class Consent extends StatefulWidget {
  const Consent({super.key});

  @override
  State<Consent> createState() => _ConsentState();
}

class _ConsentState extends State<Consent> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final SecureStorageManager secureStorageManager = SecureStorageManager();
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  final clientManager = ClientManager();

  EdgeInsets titlePadding = const EdgeInsets.only(top: 32);
  TextStyle titleTextStyle = const TextStyle(fontSize: 32);
  TextStyle bodyTextStyle = const TextStyle(fontSize: 20);
  TextStyle summaryTextStyle = const TextStyle(fontSize: 28);
  TextAlign summaryAlignment = TextAlign.center;

  String firstName = "";
  String lastName = "";
  bool freeze = false;
  bool onReviewPage = false;
  bool showBackButton = true;

  void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: const TextStyle(fontSize: 20),
        ),
        duration: const Duration(seconds: 2), // Customize the duration
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      onChange: (idx) {
        setState(() => onReviewPage = (idx == 9));
        setState(() => freeze = (idx >= 9));
        if (idx == 10) {
          setState(() => showBackButton = false);
        }
      },
      key: introKey,
      allowImplicitScrolling: true,
      globalHeader: const Align(
        alignment: Alignment.topRight,
      ),
      pages: [
        PageViewModel(
            titleWidget: Padding(
              padding: titlePadding,
              child: Text(
                "Key Information",
                style: titleTextStyle,
              ),
            ),
            bodyWidget: Text(
              "The goal of this project is to understand how children learn from their families outside of school.\nYour participation in this study is completely volluntary.\nParticipation in this study involves completing short activities lasting no more than 5 minutes each.\nEach activity involves recording a short conversation with your children.\n\nThe following pages will provide you with more detailed information about the study.",
              style: bodyTextStyle,
            )),
        PageViewModel(
          titleWidget: Padding(
            padding: titlePadding,
            child: Text(
              "Goals",
              style: titleTextStyle,
            ),
          ),
          bodyWidget: Column(
            children: [
              Container(
                height: 172,
                width: 172,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),
                child: const Icon(
                  Icons.star,
                  size: 128,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                  "Talk of the Town overview and purpose: How children learn outside of school",
                  style: summaryTextStyle,
                  textAlign: summaryAlignment),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LearnMore(
                                title: "Goals",
                                content:
                                    "The goal of this project is to understand how children learn from their families outside of school. During this study, the app will prompt you to audio-record short conversations with your child(ren). We are interested in what children learn based on the topics they discuss with their parents, where and when these discussions happen, and the different ways that parents respond to their children's questions and teach their children new things.")));
                  },
                  child: const Text(
                    "Learn more...",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Padding(
            padding: titlePadding,
            child: Text(
              "Time Commitment",
              style: titleTextStyle,
            ),
          ),
          bodyWidget: Column(
            children: [
              Container(
                height: 172,
                width: 172,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),
                child: const Icon(
                  Icons.access_time,
                  size: 128,
                ),
              ),
              const SizedBox(height: 16),
              Text("Each activity will take about 5 minutes",
                  style: summaryTextStyle, textAlign: summaryAlignment),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LearnMore(
                                title: "Time Commitment",
                                content:
                                    "Each activity in the app is designed to take about five minutes. Five minutes is the longest the app will record audio for. You will never get more than 2 notifications to do an activity in the same day, but you can do as many self-started activities as you want. The app will continue to offer these short activities intermittently until you choose to delete the app, your children age out of the study, or the study concludes (in which case you will be notified that the app is being deactivated). You can always choose not to participate in an activity. You may also choose to delete the app from your phone at any time with no negative consequences.")));
                  },
                  child: const Text(
                    "Learn more...",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Padding(
            padding: titlePadding,
            child: Text(
              "Study Tasks",
              style: titleTextStyle,
            ),
          ),
          bodyWidget: Column(
            children: [
              Container(
                height: 172,
                width: 172,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),
                child: const Icon(
                  Icons.edit,
                  size: 128,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                  "Each activity involves recording a short conversation with your child(ren)",
                  style: summaryTextStyle,
                  textAlign: summaryAlignment),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LearnMore(
                                title: "Study Tasks",
                                content:
                                    "Each activity involves recording a short conversation with your child(ren). Activities will include a conversation prompt that we provide. Recording only occurs when you specifically activate the recording, and after the recording ends you can choose to delete it rather than upload it. This app can also use your phone's location information if you permit it. This is primarily for certain activities which are tied to specific locations. Activities may include up to three short survey questions after the recording ends.")));
                  },
                  child: const Text(
                    "Learn more...",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Padding(
            padding: titlePadding,
            child: Text(
              "Data Gathering",
              style: titleTextStyle,
            ),
          ),
          bodyWidget: Column(
            children: [
              Container(
                height: 172,
                width: 172,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Icon(
                    Icons.cloud,
                    size: 128,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                  "We are looking at what parents and children talk about, how they say it, and where.",
                  style: summaryTextStyle,
                  textAlign: summaryAlignment),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LearnMore(
                                title: "Data Gathering",
                                content:
                                    "The data we collect includes the recording of your conversation, when the conversation occurred, and if you have provided location permissions, where. We also collect the responses to the short questions following the activity. We transcribe the recording, remove any identifying information from the transcript (including names), and separately analyze the audio properties of the recording, such as the pitch of each speaker's voice and background noise level.")));
                  },
                  child: const Text(
                    "Learn more...",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Padding(
            padding: titlePadding,
            child: Text(
              "Privacy",
              style: titleTextStyle,
            ),
          ),
          bodyWidget: Column(
            children: [
              Container(
                height: 172,
                width: 172,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(
                    Icons.lock,
                    size: 128,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                  "All identifiable information will be removed from your data, and your recordings will never be shared unless you give us specific permission to do so.",
                  style: summaryTextStyle,
                  textAlign: summaryAlignment),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LearnMore(
                                title: "Privacy",
                                content:
                                    "All data will be associated with an anonymous participant identifier. Raw recordings will remain fully confidential and will only be accessible by members of the research team, and approved IT employees of Harvard for troubleshooting purposes. Recordings will be transcribed, and any identifying information will be removed from these transcripts. De-identified data may be analyzed in future research studies or shared with other scientists for future research purposes without additional informed consent. By law, the study team must release certain information to the appropriate authorities if at any time during the study there is concern that child abuse or elder abuse has possibly occurred, or you disclose a desire to harm yourself or others.")));
                  },
                  child: const Text(
                    "Learn more...",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Padding(
            padding: titlePadding,
            child: Text(
              "Health",
              style: titleTextStyle,
            ),
          ),
          bodyWidget: Column(
            children: [
              Container(
                height: 172,
                width: 172,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),
                child: const Icon(
                  Icons.health_and_safety,
                  size: 128,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                  "Health and safety: There are no known risks associated with the study, but please use this app safely.",
                  style: summaryTextStyle,
                  textAlign: summaryAlignment),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LearnMore(
                                title: "Health",
                                content:
                                    "There are no known risks associated with the activities in this study. PLEASE USE THIS APP SAFELY. Be aware of your environment, and never complete activities using the app while driving. For location-based activities, please be aware of any local hazards and follow any local traffic laws, do not cross busy roads to reach an activity location, and be aware of your surroundings.")));
                  },
                  child: const Text(
                    "Learn more...",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Padding(
            padding: titlePadding,
            child: Text(
              "Benefits for you",
              style: titleTextStyle,
            ),
          ),
          bodyWidget: Column(
            children: [
              Container(
                height: 172,
                width: 172,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),
                child: const Icon(
                  Icons.thumb_up,
                  size: 128,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                  "Your participation in this study is completely voluntary. You can get small gifts for your child(ren) after 10 activities.",
                  style: summaryTextStyle,
                  textAlign: summaryAlignment),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LearnMore(
                                title: "Benefits for you",
                                content:
                                    "Your participation in this study is completely voluntary. You can choose not to participate in any of the activities provided by the App at any time by using the \"cancel\" button in the task interface, and you can choose to manually upload or not upload each recording. Refusing to participate in an activity will not affect your future participation or benefits that you are otherwise entitled to in any way. You can also stop participating in the study altogether at any time by deleting the app with no penalty or loss of benefits to which you are otherwise entitled. You will receive no direct benefits for participating in this study. You will be offered the opportunity to sign up for a small gift (value <\$10) from our lab after completing 10 activities.")));
                  },
                  child: const Text(
                    "Learn more...",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Padding(
            padding: titlePadding,
            child: Text(
              "About Us",
              style: titleTextStyle,
            ),
          ),
          bodyWidget: Column(
            children: [
              Container(
                height: 172,
                width: 172,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),
                child: const Icon(
                  Icons.info,
                  size: 128,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                  "You can contact us or the Harvard University Institutional Review Board at any time.",
                  style: summaryTextStyle,
                  textAlign: summaryAlignment),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LearnMore(
                                title: "About Us",
                                // TODO: maybe make the email and phone link clickable, tho this will require some changes to LearnMore class and therefore probably all of the other PageViewModels
                                content:
                                    "If you have questions, concerns, or complaints, you can contact the principal investigator, Elizabeth Bonawitz [elizabeth_bonawitz@gse.harvard.edu]. This research has been reviewed and approved by the Harvard University Area Institutional Review Board ('IRB'). You may contact them at (617)-496-2847 or cuhs@harvard.edu if your questions, concerns, or complaints are not answered by the research team; you cannot reach the research team; you want to talk to someone besides the research team; you have questions about your child's rights as a research subject; or you want to get information or provide input about this research. You will also receive a copy of this consent form to the email address you registered with.")));
                  },
                  child: const Text(
                    "Learn more...",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Padding(
            padding: titlePadding,
            child: Text(
              "Review",
              style: titleTextStyle,
            ),
          ),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // key info
              Text("Key Information",
                  style:
                      summaryTextStyle.copyWith(color: Colors.deepPurple[300])),
              const SizedBox(height: 8),
              Text(
                  "The goal of this project is to understand how children learn from their families outside of school.\nYour participation in this study is completely volluntary.\nParticipation in this study involves completing short activities lasting no more than 5 minutes each.\nEach activity involves recording a short conversation with your children",
                  style: bodyTextStyle),
              const SizedBox(height: 16),
              // time commitment
              Text("Goals",
                  style:
                      summaryTextStyle.copyWith(color: Colors.deepPurple[300])),
              const SizedBox(height: 8),
              Text(
                  "Talk of the Town overview and purpose: How children learn outside of school.",
                  style: bodyTextStyle),
              const SizedBox(height: 8),
              Text(
                  "The goal of this project is to understand how children learn from their families outside of school. During this study, the app will prompt you to audio-record short conversations with your child(ren). We are interested in what children learn based on the topics they discuss with their parents, where and when these discussions happen, and the different ways that parents respond to their children's questions and teach their children new things.",
                  style: bodyTextStyle),
              const SizedBox(height: 16),
              // time commitment
              Text("Time Commitment",
                  style:
                      summaryTextStyle.copyWith(color: Colors.deepPurple[300])),
              const SizedBox(height: 8),
              Text("Each activity will take about 5 minutes.",
                  style: bodyTextStyle),
              const SizedBox(height: 8),
              Text(
                  "Five minutes is the longest the app will record audio for. You will never get more than 2 notifications to do an activity in the same day, but you can do as many self-started activities as you want. The app will continue to offer these short activities intermittently until you choose to delete the app, your children age out of the study, or the study concludes (in which case you will be notified that the app is being deactivated). You can always choose not to participate in an activity. You may also choose to delete the app from your phone at any time with no negative consequences.",
                  style: bodyTextStyle),
              const SizedBox(height: 16),
              // task description
              Text("Study Tasks",
                  style:
                      summaryTextStyle.copyWith(color: Colors.deepPurple[300])),
              const SizedBox(height: 8),
              Text(
                  "Each activity involves recording a short conversation with your child(ren).",
                  style: bodyTextStyle),
              const SizedBox(height: 8),
              Text(
                  "Activities will include a conversation prompt that we provide. Recording only occurs when you specifically activate the recording, and after the recording ends you can choose to delete it rather than upload it. This app can also use your phone's location information if you permit it. This is primarily for certain activities which are tied to specific locations. Activities may include up to three short survey questions after the recording ends.",
                  style: bodyTextStyle),
              const SizedBox(height: 16),
              // data gathering
              Text("Data Gathering",
                  style:
                      summaryTextStyle.copyWith(color: Colors.deepPurple[300])),
              const SizedBox(height: 8),
              Text(
                  "We are looking at what parents and children talk about, how they say it, and where.",
                  style: bodyTextStyle),
              const SizedBox(height: 8),
              Text(
                  "The data we collect includes the recording of your conversation, when the conversation occurred, and if you have provided location permissions, where. We also collect the responses to the short questions following the activity. We transcribe the recording, remove any identifying information from the transcript (including names), and separately analyze the audio properties of the recording, such as the pitch of each speaker's voice and background noise level.",
                  style: bodyTextStyle),
              const SizedBox(height: 16),
              // privacy
              Text("Privacy",
                  style:
                      summaryTextStyle.copyWith(color: Colors.deepPurple[300])),
              const SizedBox(height: 8),
              Text(
                  "All identifiable information will be removed from your data, and your recordings will never be shared unless you give us specific permission to do so.",
                  style: bodyTextStyle),
              const SizedBox(height: 8),
              Text(
                  "All data will be associated with an anonymous participant identifier. Raw recordings will remain fully confidential and will only be accessible by members of the research team, and approved IT employees of Harvard for troubleshooting purposes. Recordings will be transcribed, and any identifying information will be removed from these transcripts. De-identified data may be analyzed in future research studies or shared with other scientists for future research purposes without additional informed consent. By law, the study team must release certain information to the appropriate authorities if at any time during the study there is concern that child abuse or elder abuse has possibly occurred, or you disclose a desire to harm yourself or others.",
                  style: bodyTextStyle),
              const SizedBox(height: 16),
              // health
              Text("Health",
                  style:
                      summaryTextStyle.copyWith(color: Colors.deepPurple[300])),
              const SizedBox(height: 8),
              Text(
                  "Health and safety: There are no known risks associated with the study, but please use this app safely.",
                  style: bodyTextStyle),
              const SizedBox(height: 8),
              Text(
                  "There are no known risks associated with the activities in this study. PLEASE USE THIS APP SAFELY. Be aware of your environment, and never complete activities using the app while driving. For location-based activities, please be aware of any local hazards and follow any local traffic laws, do not cross busy roads to reach an activity location, and be aware of your surroundings.",
                  style: bodyTextStyle),
              const SizedBox(height: 16),
              // benefits
              Text("Benefits to you",
                  style:
                      summaryTextStyle.copyWith(color: Colors.deepPurple[300])),
              const SizedBox(height: 8),
              Text(
                  "Your participation in this study is completely voluntary. You can get small gifts for your child(ren) after 10 activities.",
                  style: bodyTextStyle),
              const SizedBox(height: 8),
              Text(
                  "You can choose not to participate in any of the activities provided by the App at any time by using the \"cancel\" button in the task interface, and you can choose to manually upload or not upload each recording. Refusing to participate in an activity will not affect your future participation or benefits that you are otherwise entitled to in any way. You can also stop participating in the study altogether at any time by deleting the app with no penalty or loss of benefits to which you are otherwise entitled. You will receive no direct benefits for participating in this study. You will be offered the opportunity to sign up for a small gift (value <\$10) from our lab after completing 10 activities.",
                  style: bodyTextStyle),
              const SizedBox(height: 16),
              // about us
              Text("About Us",
                  style:
                      summaryTextStyle.copyWith(color: Colors.deepPurple[300])),
              const SizedBox(height: 8),
              Text(
                  "You can contact us or the Harvard University Institutional Review Board at any time.",
                  style: bodyTextStyle),
              const SizedBox(height: 8),
              Text(
                  "If you have questions, concerns, or complaints, you can contact the principal investigator, Elizabeth Bonawitz [elizabeth_bonawitz@gse.harvard.edu]. This research has been reviewed and approved by the Harvard University Area Institutional Review Board ('IRB'). You may contact them at (617)-496-2847 or cuhs@harvard.edu if your questions, concerns, or complaints are not answered by the research team; you cannot reach the research team; you want to talk to someone besides the research team; you have questions about your child's rights as a research subject; or you want to get information or provide input about this research. You will also receive a copy of this consent form to the email address you registered with.",
                  style: bodyTextStyle),
              const SizedBox(height: 16),
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              TextFormField(
                onChanged: (val) {
                  setState(() => firstName = val);
                },
                decoration: const InputDecoration(hintText: "First Name"),
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() => lastName = val);
                },
                decoration: const InputDecoration(hintText: "Last Name"),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 16),
                child: Text(
                  "Please sign below",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Signature(
                controller: _controller,
                width: MediaQuery.of(context).size.width - 64,
                height: 200,
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    _controller.clear();
                  },
                  child: const Text(
                    "Clear",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
      ],
      onDone: () async {
        if (_controller.isNotEmpty) {
          Uint8List? sig = await _controller.toPngBytes();
          String b64Signature = base64Encode(sig!);

          try {
            await clientManager.uploadSignature(firstName, lastName, b64Signature);
            secureStorageManager.setConsented(true);

            // ignore: use_build_context_synchronously
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const ToTOnboarding()), (route) => false);
          } catch (e) {
            // ignore: use_build_context_synchronously
            showSnackBar(context, "Error: Could not upload signature.  Details: ${e.toString()}");
          }
        } else {
          showSnackBar(context, "Please sign before continuing.");
        }
      },
      freeze: freeze,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: showBackButton,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      next: const Icon(Icons.arrow_forward),
      overrideNext: !onReviewPage
          ? null
          : IconButton(
              icon: Icon(Icons.arrow_forward, color: Colors.deepPurple[300]),
              onPressed: () async {
                dynamic result = await showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Agree?"),
                        content: const Text(
                            "By tapping AGREE you can take part in the Talk of the Town study.  Otherwise you cannot progress further."),
                        actions: [
                          ElevatedButton(
                            child: const Text("CANCEL"),
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                foregroundColor: Colors.white),
                            child: const Text("AGREE"),
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                          ),
                        ],
                      );
                    });
                if (result == true) {
                  introKey.currentState!.controller.animateToPage(10,
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeIn);
                }
              }),
      showDoneButton: true,
      done: const Text("Done", style: TextStyle(fontSize: 18)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(5.0, 5.0),
        spacing: EdgeInsets.symmetric(horizontal: 4),
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.deepPurple,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

