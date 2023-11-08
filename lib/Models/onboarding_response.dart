import 'dart:convert';

import 'package:onboarding/onboarding.dart';
import 'package:talk_of_the_town/Models/participant.dart';

class OnboardingResponse {
  OnboardingResponse(this.participants, this.familyIncome, this.education,
      this.languages, this.timestamp);

  List<Participant> participants;
  String familyIncome;
  String education;
  List languages;
  DateTime timestamp;

  OnboardingResponse.fromJson(Map json)
      : participants = List<Participant>.from(jsonDecode(json["participants"]).map((e) => Participant.fromJson(e)).toList()),
        // complex because need to convert these back into Participant objects
        familyIncome = json['famIncome'],
        education = json['education'],
        languages = List<String>.from(jsonDecode(json['languages'])),
        timestamp = DateTime.parse(json['timestamp']);

  Map<String, dynamic> toMap() {
    String readableParticipants = jsonEncode(participants.map((p) {
      if (p.anonymized) {
        return {
          "anonId": p.anonId,
          "ageMonths": p.ageMonths,
          "gender": p.gender,
          "validTimes": jsonEncode(p.validTimes),
          "anonymized": p.anonymized,
          "projectStatuses": p.projectStatuses
        };
      } else {
        return {
          "anonId": p.anonId,
          "ageMonths": p.ageMonths,
          "gender": p.gender,
          "validTimes": jsonEncode(p.validTimes),
          "anonymized": p.anonymized,
          "nickname": p.nickname,
          "DOB": p.dob!.toIso8601String(),
          "projectStatuses": p.projectStatuses
        };
      }
    }).toList());

    Map<String, dynamic> onboardingResponse = {
      "participants": readableParticipants,
      "famIncome": familyIncome,
      "education": education,
      "languages": jsonEncode(languages),
      "timestamp": timestamp.toIso8601String()
    };
    return onboardingResponse;
  }
}
