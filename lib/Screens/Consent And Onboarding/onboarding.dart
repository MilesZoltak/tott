import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:talk_of_the_town/Models/bridge_dart_sdk/bridge_sdk.models.swagger.dart';
import 'package:talk_of_the_town/Models/onboarding_response.dart';
import 'package:talk_of_the_town/Models/participant.dart';
import 'package:talk_of_the_town/Screens/home.dart';
import 'package:talk_of_the_town/Screens/learn_more.dart';
import 'package:talk_of_the_town/Screens/request_permissions.dart';
import 'package:talk_of_the_town/Utilities/client_manager.dart';
import 'package:talk_of_the_town/Utilities/database_manager.dart';
import 'package:talk_of_the_town/Utilities/secure_storage_manager.dart';
import 'package:talk_of_the_town/main.dart';

class ToTOnboarding extends StatefulWidget {
  const ToTOnboarding({Key? key}) : super(key: key);

  @override
  ToTOnboardingState createState() => ToTOnboardingState();
}

class ToTOnboardingState extends State<ToTOnboarding> {
  String _encode(Object object) =>
      const JsonEncoder.withIndent(' ').convert(object);
  final introKey = GlobalKey<IntroductionScreenState>();
  final DatabaseManager databaseManager = DatabaseManager();
  final SecureStorageManager secureStorageManager = SecureStorageManager();

  EdgeInsets titlePadding = const EdgeInsets.only(top: 32);
  TextStyle titleTextStyle = const TextStyle(fontSize: 28);
  TextStyle bodyTextStyle = const TextStyle(fontSize: 18);
  EdgeInsets footerPadding = const EdgeInsets.only(left: 16);
  TextStyle footerTextStyle = const TextStyle(fontSize: 18);

  TextStyle radioTileTextStyle =
      const TextStyle(fontSize: 18, color: Colors.grey);

  TextStyle stepTitleTextStyle = const TextStyle(fontSize: 24);
  TextStyle stepContentTextStyle = const TextStyle(fontSize: 18);

  int screenIdx = 0;
  int currentStep = 0;
  int? numChildren;
  List<Map<String, dynamic>> childrenData = [];
  String? householdIncome;
  String? education;
  List<String> languages = [];
  double doneTextSize = 16;

  String getNumberAndSuffix(int num, {bool ignoreOne = true}) {
    if (num == 1) {
      return ignoreOne ? "" : " 1st ";
    } else if (num == 2) {
      return " 2nd ";
    } else if (num == 3) {
      return " 3rd ";
    } else {
      return " ${num}th ";
    }
  }

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

  Future doDoneTextTransition() async {
    print("it's happening!");
    // await Future.delayed(const Duration(milliseconds: 500));
    // setState(() => doneTextSize = 32);
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() => doneTextSize = 24);
  }

  List<PageViewModel> getChildrenPages(int numChildren) {
    List<PageViewModel> childrenPages = [];

    for (int i = 0; i < numChildren; i++) {
      childrenPages.add(PageViewModel(
          titleWidget: Padding(
            padding: titlePadding,
            child: Text(
              "Enter information for your ${getNumberAndSuffix(i + 1)} oldest child under 12.",
              style: titleTextStyle,
            ),
          ),
          bodyWidget: Stepper(
            physics: const NeverScrollableScrollPhysics(),
            currentStep: currentStep,
            onStepTapped: (val) {
              if (val < currentStep) {
                setState(() => currentStep = val);
              } else {
                //TODO: there may be a bug where sometimes it thinks you haven't written to a step but you have and it still wont let you advance
                if (currentStep == 0 &&
                    (childrenData[i]["nickname"] ?? "") == "") {
                  showSnackBar(context, "Please enter a nickname.");
                } else if (currentStep == 1 && childrenData[i]["DOB"] == null) {
                  showSnackBar(context, "Please select a date of birth.");
                } else if (currentStep == 2 &&
                    childrenData[i]["gender"] == null) {
                  showSnackBar(context, "Please select a gender.");
                } else if (currentStep == 3 &&
                    (childrenData[i]["weekdayAvailability"] ?? []).isEmpty) {
                  showSnackBar(context, "Please select at least one weekday.");
                } else if (currentStep == 4 &&
                    (childrenData[i]["weekdayTimes"] ?? []).isEmpty) {
                  showSnackBar(context, "Please select at least one timeslot.");
                } else if (currentStep == 5 &&
                    (childrenData[i]["weekendAvailability"] ?? []).isEmpty) {
                  showSnackBar(
                      context, "Please select at least one weekend day.");
                } else if (currentStep == 6 &&
                    (childrenData[i]["weekendTimes"] ?? []).isEmpty) {
                  showSnackBar(context, "Please select at least one timeslot.");
                } else {
                  setState(() => currentStep++);
                }
              }
            },
            controlsBuilder: (context, controlsDetails) {
              return Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: currentStep > 0,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() => currentStep--);
                        },
                        child: const Text('Back'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Visibility(
                      visible: currentStep < 6,
                      child: OutlinedButton(
                        onPressed: () {
                          if (currentStep == 0 &&
                              (childrenData[i]["nickname"] ?? "") == "") {
                            showSnackBar(context, "Please enter a nickname.");
                          } else if (currentStep == 1 &&
                              childrenData[i]["DOB"] == null) {
                            showSnackBar(
                                context, "Please select a date of birth.");
                          } else if (currentStep == 2 &&
                              childrenData[i]["gender"] == null) {
                            showSnackBar(context, "Please select a gender.");
                          } else if (currentStep == 3 &&
                              (childrenData[i]["weekdayAvailability"] ?? [])
                                  .isEmpty) {
                            showSnackBar(
                                context, "Please select at least one weekday.");
                          } else if (currentStep == 4 &&
                              (childrenData[i]["weekdayTimes"] ?? []).isEmpty) {
                            showSnackBar(context,
                                "Please select at least one timeslot.");
                          } else if (currentStep == 5 &&
                              (childrenData[i]["weekendAvailability"] ?? [])
                                  .isEmpty) {
                            showSnackBar(context,
                                "Please select at least one weekend day.");
                          } else if (currentStep == 6 &&
                              (childrenData[i]["weekendTimes"] ?? []).isEmpty) {
                            showSnackBar(context,
                                "Please select at least one timeslot.");
                          } else {
                            setState(() => currentStep++);
                          }
                        },
                        child: const Text("Next"),
                      ),
                    ),
                  ],
                ),
              );
            },
            steps: [
              Step(
                title: Text(
                  "Nickname",
                  style: stepTitleTextStyle,
                ),
                content: Column(
                  children: [
                    //TODO: should it be "between 2 and 12" and not "under 12"
                    Text(
                      "Please enter a nickname.\nNote: this will never be associated with their responses or sent to our server, it's just to tell you who an activity is for.",
                      style: stepContentTextStyle,
                    ),
                    TextFormField(
                      onChanged: (val) =>
                          setState(() => childrenData[i]["nickname"] = val),
                      decoration: const InputDecoration(hintText: "Nickname"),
                    )
                  ],
                ),
              ),
              Step(
                  title: Text("Date of Birth", style: stepTitleTextStyle),
                  content: Column(
                    children: [
                      Text(
                        "If you only want to provide the month and year, leave the day on '1'.",
                        style: stepContentTextStyle,
                      ),
                      TextButton(
                          onPressed: () async {
                            DateTime? dob = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now().subtract(
                                    const Duration(days: 365 * 2 + 1)),
                                firstDate: DateTime.now().subtract(
                                    const Duration(days: 365 * 12 + 3)),
                                lastDate: DateTime.now().subtract(
                                    const Duration(days: 365 * 2 + 1)));

                            if (dob != null) {
                              setState(() => childrenData[i]["DOB"] = dob);
                            }
                          },
                          child: Text(
                            childrenData[i]["DOB"] == null
                                ? "Select Date"
                                : DateFormat('MMM d yyy')
                                    .format(childrenData[i]["DOB"]),
                            style: const TextStyle(fontSize: 24),
                          ))
                    ],
                  )),
              Step(
                  title: Text(
                    "Gender",
                    style: stepTitleTextStyle,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose one option",
                        style: stepContentTextStyle,
                      ),
                      RadioListTile(
                          title: Text("Male", style: radioTileTextStyle),
                          value: "Male",
                          groupValue: childrenData[i]["gender"],
                          onChanged: (val) {
                            setState(() => childrenData[i]["gender"] = val);
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return childrenData[i]["gender"] == "Male"
                                ? Colors.lightGreen
                                : Colors.grey;
                          })),
                      RadioListTile(
                          title: Text("Female", style: radioTileTextStyle),
                          value: "Female",
                          groupValue: childrenData[i]["gender"],
                          onChanged: (val) {
                            setState(() => childrenData[i]["gender"] = val);
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return childrenData[i]["gender"] == "Female"
                                ? Colors.lightGreen
                                : Colors.grey;
                          })),
                      RadioListTile(
                          title: Text("Nonbinary or intersex",
                              style: radioTileTextStyle),
                          value: "Nonbinary or intersex",
                          groupValue: childrenData[i]["gender"],
                          onChanged: (val) {
                            setState(() => childrenData[i]["gender"] = val);
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return childrenData[i]["gender"] ==
                                    "Nonbinary or intersex"
                                ? Colors.lightGreen
                                : Colors.grey;
                          })),
                      RadioListTile(
                          title: Text("Other", style: radioTileTextStyle),
                          value: "Other",
                          groupValue: childrenData[i]["gender"],
                          onChanged: (val) {
                            setState(() => childrenData[i]["gender"] = val);
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return childrenData[i]["gender"] == "Other"
                                ? Colors.lightGreen
                                : Colors.grey;
                          })),
                    ],
                  )),
              Step(
                  title: Text(
                    "Weekday Availability",
                    style: stepTitleTextStyle,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What weekdays would you be willing to do short activities with this child?",
                        style: stepContentTextStyle,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text("(Choose one or more options)"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: (childrenData[i]["weekdayAvailability"] ?? [])
                            .contains("Monday"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              childrenData[i]["weekdayAvailability"] =
                                  (childrenData[i]["weekdayAvailability"] ??
                                          []) +
                                      ["Monday"];
                            } else {
                              (childrenData[i]["weekdayAvailability"] ?? [])
                                  .remove("Monday");
                            }
                          });
                        },
                        title: const Text("Monday"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: childrenData[i]["weekdayAvailability"] != null &&
                            childrenData[i]["weekdayAvailability"]
                                .contains("Tuesday"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              childrenData[i]["weekdayAvailability"] =
                                  (childrenData[i]["weekdayAvailability"] ??
                                          []) +
                                      ["Tuesday"];
                            } else {
                              (childrenData[i]["weekdayAvailability"] ?? [])
                                  .remove("Tuesday");
                            }
                          });
                        },
                        title: const Text("Tuesday"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: childrenData[i]["weekdayAvailability"] != null &&
                            childrenData[i]["weekdayAvailability"]
                                .contains("Wednesday"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              childrenData[i]["weekdayAvailability"] =
                                  (childrenData[i]["weekdayAvailability"] ??
                                          []) +
                                      ["Wednesday"];
                            } else {
                              (childrenData[i]["weekdayAvailability"] ?? [])
                                  .remove("Wednesday");
                            }
                          });
                        },
                        title: const Text("Wednesday"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: childrenData[i]["weekdayAvailability"] != null &&
                            childrenData[i]["weekdayAvailability"]
                                .contains("Thursday"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              childrenData[i]["weekdayAvailability"] =
                                  (childrenData[i]["weekdayAvailability"] ??
                                          []) +
                                      ["Thursday"];
                            } else {
                              (childrenData[i]["weekdayAvailability"] ?? [])
                                  .remove("Thursday");
                            }
                          });
                        },
                        title: const Text("Thursday"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: childrenData[i]["weekdayAvailability"] != null &&
                            childrenData[i]["weekdayAvailability"]
                                .contains("Friday"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              childrenData[i]["weekdayAvailability"] =
                                  (childrenData[i]["weekdayAvailability"] ??
                                          []) +
                                      ["Friday"];
                            } else {
                              (childrenData[i]["weekdayAvailability"] ?? [])
                                  .remove("Friday");
                            }
                          });
                        },
                        title: const Text("Friday"),
                      ),
                    ],
                  )),
              Step(
                  title: Text(
                    "Weekday Times",
                    style: stepTitleTextStyle,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "When on those days can we send you notifications about activities?",
                        style: stepContentTextStyle,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text("(Choose one or more options)"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: childrenData[i]["weekdayTimes"] != null &&
                            childrenData[i]["weekdayTimes"].contains("Morning"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              childrenData[i]["weekdayTimes"] =
                                  (childrenData[i]["weekdayTimes"] ?? []) +
                                      ["Morning"];
                            } else {
                              (childrenData[i]["weekdayTimes"] ?? [])
                                  .remove("Morning");
                            }
                          });
                        },
                        title: const Text("Morning (8am-12pm)"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: childrenData[i]["weekdayTimes"] != null &&
                            childrenData[i]["weekdayTimes"]
                                .contains("Afternoon"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              childrenData[i]["weekdayTimes"] =
                                  (childrenData[i]["weekdayTimes"] ?? []) +
                                      ["Afternoon"];
                            } else {
                              (childrenData[i]["weekdayTimes"] ?? [])
                                  .remove("Afternoon");
                            }
                          });
                        },
                        title: const Text("Afternoon (12pm-4pm)"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: childrenData[i]["weekdayTimes"] != null &&
                            childrenData[i]["weekdayTimes"].contains("Evening"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              childrenData[i]["weekdayTimes"] =
                                  (childrenData[i]["weekdayTimes"] ?? []) +
                                      ["Evening"];
                            } else {
                              (childrenData[i]["weekdayTimes"] ?? [])
                                  .remove("Evening");
                            }
                          });
                        },
                        title: const Text("Evening (4pm-8pm)"),
                      ),
                    ],
                  )),
              Step(
                  title: Text(
                    "Weekend Availability",
                    style: stepTitleTextStyle,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "What weekend days would you be willing to do short activities with this child?",
                          style: stepContentTextStyle),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text("(Choose one or more options)"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: (childrenData[i]["weekendAvailability"] ?? [])
                            .contains("Saturday"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              childrenData[i]["weekendAvailability"] =
                                  (childrenData[i]["weekendAvailability"] ??
                                          []) +
                                      ["Saturday"];
                            } else {
                              (childrenData[i]["weekendAvailability"] ?? [])
                                  .remove("Saturday");
                            }
                          });
                        },
                        title: const Text("Saturday"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: (childrenData[i]["weekendAvailability"] ?? [])
                            .contains("Sunday"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              childrenData[i]["weekendAvailability"] =
                                  (childrenData[i]["weekendAvailability"] ??
                                          []) +
                                      ["Sunday"];
                            } else {
                              (childrenData[i]["weekendAvailability"] ?? [])
                                  .remove("Sunday");
                            }
                          });
                        },
                        title: const Text("Sunday"),
                      ),
                    ],
                  )),
              Step(
                  title: Text(
                    "Weekend Times",
                    style: stepTitleTextStyle,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "When on those days can we send you notifications about activities?",
                          style: stepContentTextStyle),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text("(Choose one or more options)"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: childrenData[i]["weekendTimes"] != null &&
                            childrenData[i]["weekendTimes"].contains("Morning"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              childrenData[i]["weekendTimes"] =
                                  (childrenData[i]["weekendTimes"] ?? []) +
                                      ["Morning"];
                            } else {
                              (childrenData[i]["weekendTimes"] ?? [])
                                  .remove("Morning");
                            }
                          });
                        },
                        title: const Text("Morning (8am-12pm)"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: childrenData[i]["weekendTimes"] != null &&
                            childrenData[i]["weekendTimes"]
                                .contains("Afternoon"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              childrenData[i]["weekendTimes"] =
                                  (childrenData[i]["weekendTimes"] ?? []) +
                                      ["Afternoon"];
                            } else {
                              (childrenData[i]["weekendTimes"] ?? [])
                                  .remove("Afternoon");
                            }
                          });
                        },
                        title: const Text("Afternoon (12pm-4pm)"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: childrenData[i]["weekendTimes"] != null &&
                            childrenData[i]["weekendTimes"].contains("Evening"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              childrenData[i]["weekendTimes"] =
                                  (childrenData[i]["weekendTimes"] ?? []) +
                                      ["Evening"];
                            } else {
                              (childrenData[i]["weekendTimes"] ?? [])
                                  .remove("Evening");
                            }
                          });
                        },
                        title: const Text("Evening (4pm-8pm)"),
                      ),
                    ],
                  )),
            ],
          )));
    }

    return childrenPages;
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      resizeToAvoidBottomInset: false,
      onChange: (idx) {
        //TODO: it might be a bit more graceful if we maintain a list of len(numChildren) of ints where each one represents the stepIdx for each individual stepper. how hard could it be?
        //if we are going forward from one stepper to another, set currentStep to 0
        if (screenIdx > 1 && screenIdx < numChildren! + 1 && screenIdx < idx) {
          setState(() => currentStep = 0);
        } else if (screenIdx > 1 &&
            screenIdx < numChildren! + 2 &&
            screenIdx > idx) {
          //if we are going backward from one stepper to another, set currentStep to 6 (which is the last step)
          setState(() => currentStep = 6);
        }
        setState(() => screenIdx = idx);

        print("val $idx");
        if (idx == 6) {
          doDoneTextTransition();
        }
      },
      canProgress: (idx) {
        try {
          if (idx == 1 && numChildren == null) {
            return false;
          } else if (idx > 1 && idx < numChildren! + 2) {
            //  we are either on a child-info page or something after
            int childIdx = idx - 2;
            bool noNickname =
                (childrenData[childIdx]["nickname"] ?? "").isEmpty;
            bool noDob = childrenData[childIdx]["DOB"] == null;
            bool noWeekdays =
                (childrenData[childIdx]["weekdayAvailability"] ?? []).isEmpty;
            bool noWeekdayTimes =
                (childrenData[childIdx]["weekdayTimes"] ?? []).isEmpty;
            bool noWeekends =
                (childrenData[childIdx]["weekendAvailability"] ?? []).isEmpty;
            bool noWeekendTimes =
                (childrenData[childIdx]["weekendTimes"] ?? []).isEmpty;
            if (noNickname ||
                noDob ||
                noWeekdays ||
                noWeekdayTimes ||
                noWeekends ||
                noWeekendTimes) {
              return false;
            }
          } else if (idx == numChildren! + 2 && householdIncome == null) {
            return false;
          } else if (idx == numChildren! + 3 && education == null) {
            return false;
          } else if (idx == numChildren! + 4 && languages.isEmpty) {
            return false;
          }
        } catch (e) {
          return true;
        }
        return true;
      },
      key: introKey,
      allowImplicitScrolling: true,
      globalHeader: const Align(
        alignment: Alignment.topRight,
      ),
      pages: [
            PageViewModel(
              useScrollView: false,
              // TODO: I don't know that this will always cooperate on smaller screens.  The space allocated for the footer is way too large
              titleWidget: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  "Let's get started!",
                  style: titleTextStyle,
                ),
              ),
              bodyWidget: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Text(
                      "Welcome to the onboarding questionnaire. Let's find out who will be doing our activities!",
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "Learn more...",
                      style: footerTextStyle,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LearnMore(
                                  title: "Onboarding",
                                  content:
                                      "This onboarding questionnaire will help us find age-appropriate tasks and research activities for your family.")));
                    },
                  )
                ],
              ),
            ),
            PageViewModel(
              titleWidget: const Padding(
                padding: EdgeInsets.only(top: 32),
                child: Text(
                  "Number of children in your family between the ages of 2 and 12.",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select one",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  RadioListTile(
                      title: Text(
                        "6",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return numChildren == 6
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: 6,
                      groupValue: numChildren,
                      onChanged: (val) {
                        setState(() {
                          numChildren = val;
                          childrenData = List.generate(
                            numChildren!,
                            (index) => <String,
                                dynamic>{}, // Initialize each map as an empty map
                          );
                        });
                      }),
                  RadioListTile(
                      title: Text(
                        "5",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return numChildren == 5
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: 5,
                      groupValue: numChildren,
                      onChanged: (val) {
                        setState(() {
                          numChildren = val;
                          childrenData = List.generate(
                            numChildren!,
                            (index) => <String,
                                dynamic>{}, // Initialize each map as an empty map
                          );
                        });
                      }),
                  RadioListTile(
                      title: Text(
                        "4",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return numChildren == 4
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: 4,
                      groupValue: numChildren,
                      onChanged: (val) {
                        setState(() {
                          numChildren = val;
                          childrenData = List.generate(
                            numChildren!,
                            (index) => <String,
                                dynamic>{}, // Initialize each map as an empty map
                          );
                        });
                      }),
                  RadioListTile(
                      title: Text(
                        "3",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return numChildren == 3
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: 3,
                      groupValue: numChildren,
                      onChanged: (val) {
                        setState(() {
                          numChildren = val;
                          childrenData = List.generate(
                            numChildren!,
                            (index) => <String,
                                dynamic>{}, // Initialize each map as an empty map
                          );
                        });
                      }),
                  RadioListTile(
                      title: Text(
                        "2",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return numChildren == 2
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: 2,
                      groupValue: numChildren,
                      onChanged: (val) {
                        setState(() {
                          numChildren = val;
                          childrenData = List.generate(
                            numChildren!,
                            (index) => <String,
                                dynamic>{}, // Initialize each map as an empty map
                          );
                        });
                      }),
                  RadioListTile(
                      title: Text(
                        "1",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return numChildren == 1
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: 1,
                      groupValue: numChildren,
                      onChanged: (val) {
                        setState(() {
                          numChildren = val;
                          childrenData = List.generate(
                            numChildren!,
                            (index) => <String,
                                dynamic>{}, // Initialize each map as an empty map
                          );
                        });
                      }),
                ],
              ),
            ),
          ] +
          getChildrenPages(numChildren ?? 0) +
          [
            PageViewModel(
              titleWidget: const Padding(
                padding: EdgeInsets.only(top: 32),
                child: Text(
                  "What is your annual household income?",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile(
                      title: Text(
                        "\$200,000+",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return householdIncome == "\$200,000+"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "\$200,000+",
                      groupValue: householdIncome,
                      onChanged: (val) {
                        setState(() => householdIncome = val);
                      }),
                  RadioListTile(
                      title: Text(
                        "\$150,000 - \$200,000",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return householdIncome == "\$150,000 - \$200,000"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "\$150,000 - \$200,000",
                      groupValue: householdIncome,
                      onChanged: (val) {
                        setState(() => householdIncome = val);
                      }),
                  RadioListTile(
                      title: Text(
                        "\$125,000 - \$150,000",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return householdIncome == "\$125,000 - \$150,000"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "\$125,000 - \$150,000",
                      groupValue: householdIncome,
                      onChanged: (val) {
                        setState(() => householdIncome = val);
                      }),
                  RadioListTile(
                      title: Text(
                        "\$100,000 - \$125,000",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return householdIncome == "\$100,000 - \$125,000"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "\$100,000 - \$125,000",
                      groupValue: householdIncome,
                      onChanged: (val) {
                        setState(() => householdIncome = val);
                      }),
                  RadioListTile(
                      title: Text(
                        "\$80,000 - \$100,000",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return householdIncome == "\$80,000 - \$100,000"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "\$80,000 - \$100,000",
                      groupValue: householdIncome,
                      onChanged: (val) {
                        setState(() => householdIncome = val);
                      }),
                  RadioListTile(
                      title: Text(
                        "\$60,000 - \$80,000",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return householdIncome == "\$60,000 - \$80,000"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "\$60,000 - \$80,000",
                      groupValue: householdIncome,
                      onChanged: (val) {
                        setState(() => householdIncome = val);
                      }),
                  RadioListTile(
                      title: Text(
                        "\$40,000 - \$60,000",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return householdIncome == "\$40,000 - \$60,000"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "\$40,000 - \$60,000",
                      groupValue: householdIncome,
                      onChanged: (val) {
                        setState(() => householdIncome = val);
                      }),
                  RadioListTile(
                      title: Text(
                        "Less than \$40,000",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return householdIncome == "Less than \$40,000"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "Less than \$40,000",
                      groupValue: householdIncome,
                      onChanged: (val) {
                        setState(() => householdIncome = val);
                      }),
                ],
              ),
            ),
            PageViewModel(
              titleWidget: const Padding(
                padding: EdgeInsets.only(top: 32),
                child: Text(
                  "What is The highest level of education you have attained?",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile(
                      title: Text(
                        "Doctorate",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return education == "Doctorate"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "Doctorate",
                      groupValue: education,
                      onChanged: (val) {
                        setState(() => education = val);
                      }),
                  RadioListTile(
                      title: Text(
                        "Master's Degree",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return education == "Master's Degree"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "Master's Degree",
                      groupValue: education,
                      onChanged: (val) {
                        setState(() => education = val);
                      }),
                  RadioListTile(
                      title: Text(
                        "Bachelor's Degree",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return education == "Bachelor's Degree"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "Bachelor's Degree",
                      groupValue: education,
                      onChanged: (val) {
                        setState(() => education = val);
                      }),
                  RadioListTile(
                      title: Text(
                        "Associate's Degree",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return education == "Associate's Degree"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "Associate's Degree",
                      groupValue: education,
                      onChanged: (val) {
                        setState(() => education = val);
                      }),
                  RadioListTile(
                      title: Text(
                        "Some college",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return education == "Some college"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "Some college",
                      groupValue: education,
                      onChanged: (val) {
                        setState(() => education = val);
                      }),
                  RadioListTile(
                      title: Text(
                        "High school or GED",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return education == "High school or GED"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "High school or GED",
                      groupValue: education,
                      onChanged: (val) {
                        setState(() => education = val);
                      }),
                  RadioListTile(
                      title: Text(
                        "Did not finish high school",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return education == "Did not finish high school"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "Did not finish high school",
                      groupValue: education,
                      onChanged: (val) {
                        setState(() => education = val);
                      }),
                  RadioListTile(
                      title: Text(
                        "Other",
                        style: radioTileTextStyle,
                      ),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return education == "Other"
                            ? Colors.lightGreen
                            : Colors.grey;
                      }),
                      value: "Other",
                      groupValue: education,
                      onChanged: (val) {
                        setState(() => education = val);
                      }),
                ],
              ),
            ),
            PageViewModel(
              titleWidget: const Padding(
                padding: EdgeInsets.only(top: 32),
                child: Text(
                  "What languages do you speak at home?",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("(Choose one or more options)"),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: languages.contains("English"),
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          languages.add("English");
                        } else {
                          languages.remove("English");
                        }
                      });
                    },
                    title: const Text("English"),
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: languages.contains("Spanish"),
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          languages.add("Spanish");
                        } else {
                          languages.remove("Spanish");
                        }
                      });
                    },
                    title: const Text("Spanish"),
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: languages.contains("Mandarin"),
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          languages.add("Mandarin");
                        } else {
                          languages.remove("Mandarin");
                        }
                      });
                    },
                    title: const Text("Mandarin"),
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: languages.contains("French"),
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          languages.add("French");
                        } else {
                          languages.remove("French");
                        }
                      });
                    },
                    title: const Text("French"),
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: languages.contains("Korean"),
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          languages.add("Korean");
                        } else {
                          languages.remove("Korean");
                        }
                      });
                    },
                    title: const Text("Korean"),
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: languages.contains("Other"),
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          languages.add("Other");
                        } else {
                          languages.remove("Other");
                        }
                      });
                    },
                    title: const Text("Other"),
                  ),
                ],
              ),
            ),
            PageViewModel(
                titleWidget: const Padding(
                    padding: EdgeInsets.only(top: 64),
                    child: Text("All Done!", style: TextStyle(fontSize: 48))),
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: Colors.lightGreen, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.done,
                          size: 64,
                        )),
                    const SizedBox(height: 16),
                    const Text(
                      "Thank you for sharing.",
                      style: TextStyle(fontSize: 28),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    OutlinedButton(
                      child:
                          const Text("Done!", style: TextStyle(fontSize: 24)),
                      onPressed: () async {
                        // TODO: upload their onboarding information
                        // transform data into bridge types
                        List<Participant> participantsForUpload = [];
                        for (var child in childrenData) {
                          Map<String, List> availability = {
                            "weekdays": child["weekdayAvailability"],
                            "weekdayTimes": [
                              child["weekdayTimes"].contains("Morning"),
                              child["weekdayTimes"].contains("Afternoon"),
                              child["weekdayTimes"].contains("Evening")
                            ],
                            "weekends": child["weekendAvailability"],
                            "weekendTimes": [
                              child["weekendTimes"].contains("Morning"),
                              child["weekendTimes"].contains("Afternoon"),
                              child["weekendTimes"].contains("Evening")
                            ]
                          };

                          var random = Random.secure();
                          var values =
                              List<int>.generate(6, (i) => random.nextInt(255));
                          String anonId = base64UrlEncode(values);
                          print("most recent nickname and id: ${child["nickname"]} and $anonId");
                          Participant pLocal = Participant(
                              anonId, child["gender"], availability, false,
                              nickname: child["nickname"], dob: child["DOB"]
                              );
                          Participant pServer = Participant(
                              anonId, child["gender"], availability, true,
                              dob: null);
                          databaseManager.addParticipant(pLocal);
                          participantsForUpload.add(pServer);
                        }

                        // create the onboarding response object
                        late OnboardingResponse onboardingResponse;
                        DateTime onboardingEndDate = DateTime.now();
                        try {
                          onboardingResponse = OnboardingResponse(
                              participantsForUpload,
                              householdIncome!,
                              education!,
                              languages,
                              onboardingEndDate);
                        } catch (e) {
                          showSnackBar(context,
                              "Error: Please check your inputs and try again.");
                          return;
                        }

                        // store the onboarding response locally
                        await databaseManager.storeOnboarding(onboardingResponse);
                        print("stored onboarding");

                        // store it on the server
                        ClientManager clientManager = ClientManager();
                        ParticipantData onboardingResults = ParticipantData(
                            identifier: 'onboarding',
                            data: _encode(onboardingResponse.toMap()));
                        clientManager.uploadOnboardingData(onboardingResults);
                        print("uploaded onboarding");

                        // also do the associated activity event (whatever the heck that means)
                        StudyActivityEvent completedOnboarding =
                            StudyActivityEvent(
                                eventId: 'completed_onboarding',
                                timestamp: onboardingEndDate);
                        clientManager.postActivityEvent(completedOnboarding);
                        databaseManager
                            .addStudyActivityEvent(completedOnboarding);

                        secureStorageManager.setOnboarded(true);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RequestPermissions()),
                            (route) => false);
                      },
                    )
                  ],
                ))
          ],
      onDone: () {
        print("hello");
        //  TODO: go home
      },
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      next: const Icon(Icons.arrow_forward),
      overrideDone: const SizedBox(),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(5.0, 5.0),
        spacing: EdgeInsets.symmetric(horizontal: 4),
        activeSize: Size(22.0, 10.0),
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
    );
  }
}
