import 'dart:core';
import 'dart:convert';


import 'package:talk_of_the_town/Models/bridge_dart_sdk/bridge_sdk.models.swagger.dart';
import 'package:talk_of_the_town/Models/participant.dart';
import 'package:talk_of_the_town/Models/task_payload.dart';
import 'package:talk_of_the_town/Utilities/database_manager.dart';
import 'package:talk_of_the_town/Utilities/notification_manager.dart';

/// Determines if there are new eligible tasks and sets up notifications etc.
///
/// Sets up timed notifications, geofences, and more.
/// {@category App}
class TaskActivationManager {

  /// Reads through the session, StudyActivityEvent, and task parts of the table and figures out if anything needs to be active that isn't.
  Future<void> checkNewActivations() async {
    DatabaseManager databaseManager = DatabaseManager();
    List<StudyActivityEvent> allStudyActivityEvents = await databaseManager.getAllStudyActivityEvents();
    List<String> eventIds = [];
    allStudyActivityEvents.forEach((element) {
      eventIds.add(element.eventId!);
    });
    List<ScheduledSession> allSessions = await databaseManager.getAllScheduledSessions();
    allSessions.forEach((element) async {
      if (element.startEventId != null){
        if (eventIds.contains(element.startEventId)){
          String targetInstance = element.assessments!.first.instanceGuid ?? 'missing';
          TaskPayload? targetPayload = await databaseManager.getTaskPayloadInstance(targetInstance);
          if (targetPayload!.status != null){
            // checks if the task is pending to run, if so activate and update.
            if (targetPayload.status != "active") {
              String newStatus = await checkStatusAndActivate(element, targetPayload);
              targetPayload.status = newStatus;
              int updated = await databaseManager.updateTaskPayload(targetPayload);
            }
          }
        }
      }
    });
  }

  /// Checks whether a session should be activated and if so activates it.
  Future<String> checkStatusAndActivate(ScheduledSession session, TaskPayload payload) async {
    // First, simply determine if the criteria are correct to activate.
    DatabaseManager databaseManager = DatabaseManager();
    NotificationManager manager = NotificationManager();
    List<String> startAtOnce = ["enrollment", "created_on"];
    // check all events that have triggered so far
    List<StudyActivityEvent> activatedEvents = await databaseManager.getAllStudyActivityEvents();
    activatedEvents.forEach((element) {
      startAtOnce.add(element.eventId!);
    });

    if (startAtOnce.contains(session.startEventId) && payload.participants!.length > 0){
      // This is something we should set up right away, even if it's on a delay.
      // If there are geofences, we should just tie the notification to the geofence.
      if (payload.geofences.length > 0) {
        payload.geofences.forEach((element) async {
          int irrel = await databaseManager.activateGeofence(element, payload: payload);
        });
      } else {
        // if there aren't, we just set up a notification based on the session's criteria
        if (session.startDay! == 0){
          // fire that sucker off at the next eligible participant's window.
          payload.participants!.forEach((participant) async {
            await manager.notifyParticipantAtNextOpportunity(participant, payload);
          });
        } else {
          // Go X days in the future and then find the next eligible participant's window
          Duration minDelay = Duration(days: session.startDay!);
          payload.participants!.forEach((participant) async {
            await manager.notifyParticipantAtNextOpportunity(participant, payload, minimumDelay: minDelay);
          });
        }
      }
      return 'active';
    } else if (payload.participants!.length > 0) {
      // The conditions have not yet been met but there are eligible participants
      return 'pending';
    } else {
      // No eligible participants in this family
      return 'inactive';
    }

  }

  /// Gets a list of Participants based on a list of eligible ages for an activity.
  Future<List<Participant>> matchParticipantsToAges(int minAge, int maxAge) async {
    // pull participant info from local storage.
    DatabaseManager databaseManager = DatabaseManager();
    List<Participant> allParticipants = await databaseManager.getAllParticipants();
    List<Participant> participants = [];
    allParticipants.forEach((participant) {
      if ((participant.ageInMonths >= minAge) && (participant.ageInMonths <= maxAge)) {
        participants.add(participant);
      }
    });

    return participants;
  }
}