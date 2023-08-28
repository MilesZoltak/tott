import 'package:talk_of_the_town/Models/participant.dart';

class TaskPayload {
  TaskPayload(this.guid, this.instanceId, this.taskName, this.minAge, this.maxAge, this.geofences, this.taskText, this.endTaskQ, {this.endTaskQContent, this.participants, this.status, this.triggerCustomEvent, this.notificationBased, this.notificationDateTime});
  String guid = "placeholder";
  String instanceId = "placeholder";
  String taskName = "placeholder";
  int minAge = 48;
  int maxAge = 144;
  List geofences = [];
  String taskText = "placeholder";
  bool endTaskQ = false;
  List<String>? endTaskQContent;
  List<Participant>? participants;
  String? status;
  String? triggerCustomEvent;
  bool? notificationBased;
  DateTime? notificationDateTime;

  TaskPayload.fromJson(Map<String, dynamic> json){
    // required arguments:
    guid = json['guid'];
    instanceId = json['instanceId'];
    taskName = json['taskName'];
    minAge = json['minAge'];
    maxAge = json['maxAge'];
    geofences = json['geofences'];
    taskText = json['taskText'];
    endTaskQ = json['endTaskQ'] is bool ? json['endTaskQ'] : json['endTaskQ'] == "true";

    // optional args
    endTaskQContent = json['endTaskQContent']?.cast<String>() ?? null;
    participants = json['participants'] == null ? null : (json['participants'] as List<dynamic>).map((e) => Participant.fromJson(Map<String, dynamic>.from(e))).toList();
    status = json['status'] ?? null;
    triggerCustomEvent = json['triggerCustomEvent'] ?? null;
    if (json['notificationBased'] != null){
      notificationBased = json['notificationBased'] is bool ? json['notificationBased'] : json['notificationBased'] == 'true';
    } else {
      notificationBased = null;
    }
    notificationDateTime = json['notificationDateTime'] == null ? null : DateTime.parse(json['notificationDateTime']);
  }

  Map<String, dynamic> toMap() {
    return {
      // required args
      "guid": guid,
      "instanceId": instanceId,
      "taskName": taskName,
      "minAge": minAge,
      "maxAge": maxAge,
      "geofences": geofences,
      "taskText": taskText,
      "endTaskQ": endTaskQ,

      //optional args
      "endTaskQContent": endTaskQContent,
      "participants": participants,
      "status": status,
      "triggerCustomEvent": triggerCustomEvent,
      "notificationBased": notificationBased,
      "notificationDateTime": notificationDateTime
    };
  }

  /// Modified version of toJson that then converts the handful of things the geofence payload can't deal with.
  Map<String,dynamic> toGeofencePayload() {
    Map<String,dynamic> baseJson = toMap();
    List<Map> jsonParticipants = [];
    if(participants != null) {
      participants!.forEach((element) {
        jsonParticipants.add(element.toMap());
      });
    }
    baseJson['participants'] = jsonParticipants.length > 0 ? jsonParticipants : null;
    return baseJson;
  }

  @override
  String toString() {
    return 'TaskPayload(guid: $guid, instanceId: $instanceId, taskName: $taskName, '
        'minAge: $minAge, maxAge: $maxAge, geofences: $geofences, taskText: $taskText, '
        'endTaskQ: $endTaskQ, {endTaskQContent: $endTaskQContent, participants: $participants, status: $status, triggerCustomEvent: $triggerCustomEvent, notificationBased: $notificationBased, notificationDateTime: $notificationDateTime})';
  }
}