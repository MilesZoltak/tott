// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:talk_of_the_town/Models/participant.dart';
import 'package:talk_of_the_town/Utilities/database_manager.dart';

class EditParticipantInfo extends StatefulWidget {
  final Participant participant;

  const EditParticipantInfo(this.participant, {super.key});

  @override
  State<EditParticipantInfo> createState() => _EditParticipantInfoState();
}

class _EditParticipantInfoState extends State<EditParticipantInfo> {
  late Map<String, dynamic> editedParticipant;
  int currentStep = 0;

  TextStyle stepTitleTextStyle = const TextStyle(fontSize: 24);
  TextStyle stepContentTextStyle = const TextStyle(fontSize: 18);
  TextStyle radioTileTextStyle =
      const TextStyle(fontSize: 18, color: Colors.grey);

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
  void initState() {
    super.initState();
    List<String> weekdayTimes = [];
    if (widget.participant.validTimes["weekdayTimes"]![0]) {
      weekdayTimes.add("Morning");
    }
    if (widget.participant.validTimes["weekdayTimes"]![1]) {
      weekdayTimes.add("Afternoon");
    }
    if (widget.participant.validTimes["weekdayTimes"]![2]) {
      weekdayTimes.add("Evening");
    }

    List<String> weekendTimes = [];
    if (widget.participant.validTimes["weekendTimes"]![0]) {
      weekendTimes.add("Morning");
    }
    if (widget.participant.validTimes["weekendTimes"]![1]) {
      weekendTimes.add("Afternoon");
    }
    if (widget.participant.validTimes["weekendTimes"]![2]) {
      weekendTimes.add("Evening");
    }

    editedParticipant = {
      "anonId": widget.participant.anonId,
      "nickname": widget.participant.nickname,
      "gender": widget.participant.gender,
      "DOB": widget.participant.dob,
      "weekdayAvailability": widget.participant.validTimes["weekdays"],
      "weekdayTimes": weekdayTimes,
      "weekendAvailability": widget.participant.validTimes["weekends"],
      "weekendTimes": weekendTimes,
    };
  }

  Future saveParticipantUpdates() async {
    DatabaseManager databaseManager = DatabaseManager();
    Map<String, List> availability = {
      "weekdays": editedParticipant["weekdayAvailability"],
      "weekdayTimes": [
        editedParticipant["weekdayTimes"].contains("Morning"),
        editedParticipant["weekdayTimes"].contains("Afternoon"),
        editedParticipant["weekdayTimes"].contains("Evening")
      ],
      "weekends": editedParticipant["weekendAvailability"],
      "weekendTimes": [
        editedParticipant["weekendTimes"].contains("Morning"),
        editedParticipant["weekendTimes"].contains("Afternoon"),
        editedParticipant["weekendTimes"].contains("Evening")
      ]
    };
    Participant participant = Participant(
        editedParticipant["anonId"], editedParticipant["gender"], availability, false,
        nickname: editedParticipant["nickname"], dob: editedParticipant["DOB"]
    );
    await databaseManager.updateParticipantRecord(participant);
    showSnackBar(context, "Updated participant!");
    Navigator.pop(context, participant);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Participant Info"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Stepper(
            physics: const NeverScrollableScrollPhysics(),
            currentStep: currentStep,
            onStepTapped: (val) {
              if (val < currentStep) {
                setState(() => currentStep = val);
              } else {
                //TODO: there may be a bug where sometimes it thinks you haven't written to a step but you have and it still wont let you advance
                if (currentStep == 0 &&
                    (editedParticipant["nickname"] ?? "") == "") {
                  showSnackBar(context, "Please enter a nickname.");
                } else if (currentStep == 1 && editedParticipant["DOB"] == null) {
                  showSnackBar(context, "Please select a date of birth.");
                } else if (currentStep == 2 &&
                    editedParticipant["gender"] == null) {
                  showSnackBar(context, "Please select a gender.");
                } else if (currentStep == 3 &&
                    (editedParticipant["weekdayAvailability"] ?? []).isEmpty) {
                  showSnackBar(context, "Please select at least one weekday.");
                } else if (currentStep == 4 &&
                    (editedParticipant["weekdayTimes"] ?? []).isEmpty) {
                  showSnackBar(context, "Please select at least one timeslot.");
                } else if (currentStep == 5 &&
                    (editedParticipant["weekendAvailability"] ?? []).isEmpty) {
                  showSnackBar(context, "Please select at least one weekend day.");
                } else if (currentStep == 6 &&
                    (editedParticipant["weekendTimes"] ?? []).isEmpty) {
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
                    OutlinedButton(
                      onPressed: () {
                        if (currentStep == 0 &&
                            (editedParticipant["nickname"] ?? "") == "") {
                          showSnackBar(context, "Please enter a nickname.");
                        } else if (currentStep == 1 &&
                            editedParticipant["DOB"] == null) {
                          showSnackBar(context, "Please select a date of birth.");
                        } else if (currentStep == 2 &&
                            editedParticipant["gender"] == null) {
                          showSnackBar(context, "Please select a gender.");
                        } else if (currentStep == 3 &&
                            (editedParticipant["weekdayAvailability"] ?? [])
                                .isEmpty) {
                          showSnackBar(
                              context, "Please select at least one weekday.");
                        } else if (currentStep == 4 &&
                            (editedParticipant["weekdayTimes"] ?? []).isEmpty) {
                          showSnackBar(
                              context, "Please select at least one timeslot.");
                        } else if (currentStep == 5 &&
                            (editedParticipant["weekendAvailability"] ?? [])
                                .isEmpty) {
                          showSnackBar(
                              context, "Please select at least one weekend day.");
                        } else if (currentStep == 6 &&
                            (editedParticipant["weekendTimes"] ?? []).isEmpty) {
                          showSnackBar(
                              context, "Please select at least one timeslot.");
                        } else {
                          if (currentStep < 6) {
                            setState(() => currentStep++);
                          } else {
                            saveParticipantUpdates();
                          }
                        }
                      },
                      child: Text(currentStep < 6 ? "Next" : "Save"),
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
                      initialValue: editedParticipant["nickname"],
                      onChanged: (val) =>
                          setState(() => editedParticipant["nickname"] = val),
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
                                initialDate: DateTime.now()
                                    .subtract(const Duration(days: 365 * 2 + 1)),
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 365 * 12 + 3)),
                                lastDate: DateTime.now()
                                    .subtract(const Duration(days: 365 * 2 + 1)));

                            if (dob != null) {
                              setState(() => editedParticipant["DOB"] = dob);
                            }
                          },
                          child: Text(
                            editedParticipant["DOB"] == null
                                ? "Select Date"
                                : DateFormat('MMM d yyy')
                                    .format(editedParticipant["DOB"]),
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
                          groupValue: editedParticipant["gender"],
                          onChanged: (val) {
                            setState(() => editedParticipant["gender"] = val);
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return editedParticipant["gender"] == "Male"
                                ? Colors.lightGreen
                                : Colors.grey;
                          })),
                      RadioListTile(
                          title: Text("Female", style: radioTileTextStyle),
                          value: "Female",
                          groupValue: editedParticipant["gender"],
                          onChanged: (val) {
                            setState(() => editedParticipant["gender"] = val);
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return editedParticipant["gender"] == "Female"
                                ? Colors.lightGreen
                                : Colors.grey;
                          })),
                      RadioListTile(
                          title: Text("Nonbinary or intersex",
                              style: radioTileTextStyle),
                          value: "Nonbinary or intersex",
                          groupValue: editedParticipant["gender"],
                          onChanged: (val) {
                            setState(() => editedParticipant["gender"] = val);
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return editedParticipant["gender"] ==
                                    "Nonbinary or intersex"
                                ? Colors.lightGreen
                                : Colors.grey;
                          })),
                      RadioListTile(
                          title: Text("Other", style: radioTileTextStyle),
                          value: "Other",
                          groupValue: editedParticipant["gender"],
                          onChanged: (val) {
                            setState(() => editedParticipant["gender"] = val);
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return editedParticipant["gender"] == "Other"
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
                        value: (editedParticipant["weekdayAvailability"] ?? [])
                            .contains("Monday"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              editedParticipant["weekdayAvailability"] =
                                  (editedParticipant["weekdayAvailability"] ?? []) +
                                      ["Monday"];
                            } else {
                              (editedParticipant["weekdayAvailability"] ?? [])
                                  .remove("Monday");
                            }
                          });
                        },
                        title: const Text("Monday"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: editedParticipant["weekdayAvailability"] != null &&
                            editedParticipant["weekdayAvailability"]
                                .contains("Tuesday"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              editedParticipant["weekdayAvailability"] =
                                  (editedParticipant["weekdayAvailability"] ?? []) +
                                      ["Tuesday"];
                            } else {
                              (editedParticipant["weekdayAvailability"] ?? [])
                                  .remove("Tuesday");
                            }
                          });
                        },
                        title: const Text("Tuesday"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: editedParticipant["weekdayAvailability"] != null &&
                            editedParticipant["weekdayAvailability"]
                                .contains("Wednesday"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              editedParticipant["weekdayAvailability"] =
                                  (editedParticipant["weekdayAvailability"] ?? []) +
                                      ["Wednesday"];
                            } else {
                              (editedParticipant["weekdayAvailability"] ?? [])
                                  .remove("Wednesday");
                            }
                          });
                        },
                        title: const Text("Wednesday"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: editedParticipant["weekdayAvailability"] != null &&
                            editedParticipant["weekdayAvailability"]
                                .contains("Thursday"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              editedParticipant["weekdayAvailability"] =
                                  (editedParticipant["weekdayAvailability"] ?? []) +
                                      ["Thursday"];
                            } else {
                              (editedParticipant["weekdayAvailability"] ?? [])
                                  .remove("Thursday");
                            }
                          });
                        },
                        title: const Text("Thursday"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: editedParticipant["weekdayAvailability"] != null &&
                            editedParticipant["weekdayAvailability"]
                                .contains("Friday"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              editedParticipant["weekdayAvailability"] =
                                  (editedParticipant["weekdayAvailability"] ?? []) +
                                      ["Friday"];
                            } else {
                              (editedParticipant["weekdayAvailability"] ?? [])
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
                        value: editedParticipant["weekdayTimes"] != null &&
                            editedParticipant["weekdayTimes"].contains("Morning"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              editedParticipant["weekdayTimes"] =
                                  (editedParticipant["weekdayTimes"] ?? []) +
                                      ["Morning"];
                            } else {
                              (editedParticipant["weekdayTimes"] ?? [])
                                  .remove("Morning");
                            }
                          });
                        },
                        title: const Text("Morning (8am-12pm)"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: editedParticipant["weekdayTimes"] != null &&
                            editedParticipant["weekdayTimes"].contains("Afternoon"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              editedParticipant["weekdayTimes"] =
                                  (editedParticipant["weekdayTimes"] ?? []) +
                                      ["Afternoon"];
                            } else {
                              (editedParticipant["weekdayTimes"] ?? [])
                                  .remove("Afternoon");
                            }
                          });
                        },
                        title: const Text("Afternoon (12pm-4pm)"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: editedParticipant["weekdayTimes"] != null &&
                            editedParticipant["weekdayTimes"].contains("Evening"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              editedParticipant["weekdayTimes"] =
                                  (editedParticipant["weekdayTimes"] ?? []) +
                                      ["Evening"];
                            } else {
                              (editedParticipant["weekdayTimes"] ?? [])
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
                        value: (editedParticipant["weekendAvailability"] ?? [])
                            .contains("Saturday"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              editedParticipant["weekendAvailability"] =
                                  (editedParticipant["weekendAvailability"] ?? []) +
                                      ["Saturday"];
                            } else {
                              (editedParticipant["weekendAvailability"] ?? [])
                                  .remove("Saturday");
                            }
                          });
                        },
                        title: const Text("Saturday"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: (editedParticipant["weekendAvailability"] ?? [])
                            .contains("Sunday"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              editedParticipant["weekendAvailability"] =
                                  (editedParticipant["weekendAvailability"] ?? []) +
                                      ["Sunday"];
                            } else {
                              (editedParticipant["weekendAvailability"] ?? [])
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
                        value: editedParticipant["weekendTimes"] != null &&
                            editedParticipant["weekendTimes"].contains("Morning"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              editedParticipant["weekendTimes"] =
                                  (editedParticipant["weekendTimes"] ?? []) +
                                      ["Morning"];
                            } else {
                              (editedParticipant["weekendTimes"] ?? [])
                                  .remove("Morning");
                            }
                          });
                        },
                        title: const Text("Morning (8am-12pm)"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: editedParticipant["weekendTimes"] != null &&
                            editedParticipant["weekendTimes"].contains("Afternoon"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              editedParticipant["weekendTimes"] =
                                  (editedParticipant["weekendTimes"] ?? []) +
                                      ["Afternoon"];
                            } else {
                              (editedParticipant["weekendTimes"] ?? [])
                                  .remove("Afternoon");
                            }
                          });
                        },
                        title: const Text("Afternoon (12pm-4pm)"),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: editedParticipant["weekendTimes"] != null &&
                            editedParticipant["weekendTimes"].contains("Evening"),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              editedParticipant["weekendTimes"] =
                                  (editedParticipant["weekendTimes"] ?? []) +
                                      ["Evening"];
                            } else {
                              (editedParticipant["weekendTimes"] ?? [])
                                  .remove("Evening");
                            }
                          });
                        },
                        title: const Text("Evening (4pm-8pm)"),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
