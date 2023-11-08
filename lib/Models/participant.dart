import 'dart:convert';
import 'dart:math';

class Participant {
  String anonId = "placeholder"; // an anonymized ID for uploads.
  int ageMonths = -1; // can be updated
  String gender = "placeholder";
  Map<String, List> validTimes = {}; // stored as {weekdays: [list], weekdayTimes: [0,0,0], weekends: [list], weekendTimes: [0,0,0]}
  bool anonymized = false;
  // these are identifiable so they need to be nullable if we want to leave them out
  String? nickname;
  DateTime? dob;
  //idk wtf this is, but in the old repo it said "some way of tracking progress in different specific studies"
  Map<String, dynamic>? projectStatuses;

  Participant(this.anonId, this.gender, this.validTimes, this.anonymized,
      {this.nickname, required this.dob, this.projectStatuses}) {
    //set anonId, only if there is no anonId
    if (anonId == "placeholder") {
      var random = Random.secure();
      var values = List<int>.generate(6, (i) => random.nextInt(255));
      anonId = base64UrlEncode(values);
    }

    //set ageMonths
    DateTime now = DateTime.now();
    if (dob == null) {
      ageMonths = 0;
    } else {
      ageMonths = (now.year - dob!.year) * 12 + now.month - dob!.month;
      if (now.day < dob!.day) {
        ageMonths--;
      }
    }

    //anonymize dob if necessary, probably not necessary cuz if it's anonymized u should just pass null for dob
    if (anonymized) {
      dob = null;
    }
  }


  Participant.fromJson(Map<String, dynamic> json){
    print(json);
    anonId = json['anonId'];
    ageMonths = json['ageMonths'];
    gender = json['gender'];
    validTimes = Map.from(jsonDecode(json['validTimes']));
    anonymized = (json['anonymized'] == 'true' || json['anonymized'] == true || json['anonymized'] == 1);
    nickname = json['nickname'] ?? null;
    dob = json['DOB'] == null ? null : DateTime.parse(json['DOB']);
    projectStatuses = json['projectStatuses'] == null ? null : jsonDecode(json['projectStatuses']); // likewise, convert?
  }

  Map<String, dynamic> toMap() {
    return {
      'anonId': anonId,
      'ageMonths': ageMonths,
      'gender': gender,
      'validTimes': jsonEncode(validTimes),
      'anonymized': anonymized,
      'nickname': nickname ?? null,
      'DOB': dob == null ? null :dob!.toIso8601String(),
      'projectStatuses': projectStatuses?.toString()
    };
  }

  void updateAge() {
    DateTime currentDate = DateTime.now();
    // Compute age in months, the hard (but precise) way.
    int month1 = dob!.month;
    int month2 = currentDate.month;
    int day1 = dob!.day;
    int day2 = currentDate.day;
    int dayMod = day2 >= day1 ? 0 : 1; // modifier for day-of-month
    int monthMod = (month2 - dayMod) >= month1 ? 0 : 1; // modifier on years accounting for days.

    // A complex calculation based on both year and day difs
    int monthCalc = monthMod == 0 ? month2 - month1 - dayMod : (month1+12) - month2 - dayMod;
    int age = (currentDate.year - dob!.year - monthMod)*12 + monthCalc;


    ageMonths = age;
  }

  @override
  String toString() {
    return 'Participant(anonId: $anonId, ageMonths: $ageMonths, gender: $gender, '
        'validTimes: $validTimes, anonymized: $anonymized, nickname: $nickname, '
        'dob: $dob, projectStatuses: $projectStatuses)';
  }
}
