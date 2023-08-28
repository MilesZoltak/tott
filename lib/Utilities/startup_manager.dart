import 'dart:convert';

import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:intl/intl.dart';
import 'package:talk_of_the_town/Models/bridge_dart_sdk/bridge_sdk.models.swagger.dart';
import 'package:talk_of_the_town/Models/onboarding_response.dart';
import 'package:talk_of_the_town/Models/participant.dart';
import 'package:talk_of_the_town/Models/task_payload.dart';
import 'package:talk_of_the_town/Utilities/client_manager.dart';
import 'package:talk_of_the_town/Utilities/database_manager.dart';
import 'package:talk_of_the_town/Utilities/shared_preferences_manager.dart';
import 'package:talk_of_the_town/Utilities/task_activation_manager.dart';

class StartupManager {
  Future runStartupFunction() async {
    // if we haven't sent them anywhere yet, we have work to do
    // get participant data
    await getParticipantData();

    // update participant ages
    await updateAllParticipantAges();

    // check for updates
    await checkForUpdates(); // this also calls parseConfig and parseTimeline
  }

  /// Retrieves onboarding data, checks timestamp against local database.
  /// we do this if:
  ///   1. we are in the first launch BUT we also want to know if there is any existing onboarding data (WHY???)
  ///       - I think the only reason we would even expect this to be true is that
  ///         there might be a case where the app is being opened for the first time on the user's phone
  ///         or local data has been erased
  ///   2. if consent and onboarding are completed, and we are being brought to the app by a notification
  ///   3. even if we are not being brought to the app by a notification
  ///   4. I'll go ahead and say that we want to also call this after onboarding because I think that was handled recursively in the original implementation
  Future getParticipantData() async {
    ClientManager clientManager = ClientManager();
    DatabaseManager databaseManager = DatabaseManager();
    bool onboardingOutdated = false;

    ParticipantData? gotData = await clientManager.getOnboardingData();
    // If no onboarding data on server, we don't need to do anything.
    if (gotData != null) {
      print("got data: ${gotData.toString()}");
      // the problem with gotData.data: it's missing the quotation marks around the tags.
      // and it's also a generic 'Object'. So we use jsonEncode to go from object to string
      // and decode to go back into something that's actually a functional map.
      // TODO: the above comment is from jonathan, but is this still an issue in the new version?
      Map tempData = jsonDecode(jsonEncode(gotData.data));
      OnboardingResponse onboarding = OnboardingResponse.fromJson(tempData);

      // Now we need to check and update the participants table.
      if (await SharedPreferencesManager().getOnboardingCompleted() != false) {
        // The way onboarding completed works is that it is 'false' if it doesn't
        // exist, and a formatted datetime otherwise.
        String lastCompleted =
            await SharedPreferencesManager().getOnboardingCompleted();
        DateTime existingOnboarding = DateTime.parse(lastCompleted);

        // if the info pulled from the server is newer, flag the current database as outdated!
        onboardingOutdated =
            onboarding.timestamp.isAfter(existingOnboarding) ? true : false;
      } else {
        onboardingOutdated = true;
      }

      if (onboardingOutdated) {
        // update with the new info from the server
        List<Participant> existingParticipants =
            await databaseManager.getAllParticipants();
        if (existingParticipants.isNotEmpty) {
          // essentially, if there are already participant records, update them, matching by anonId.
          for (int x = 0; x < onboarding.participants.length; x++) {
            int success = await databaseManager
                .updateParticipantRecord(onboarding.participants[x]);
          }
          // update the timestamp, which is to say the onboardingCompleted shared pref.
          SharedPreferencesManager().set(
              SharedPreferencesManager.onboarding_completed_key,
              DateFormat('yyyy-MM-dd hh:mm:ss').format(onboarding.timestamp));
        } else {
          // TODO: this is profoundly unfinished. actually completely useless. it must be done
          // This should only really happen in the 'new phone' edge case where
          // there is a server-side participant record, but not a client-side one.
          // Requires prompting for non-anon info, spec. DOB and nickname.
          // As with the endtaskq, redirect and pull info from UpdateParticipantInfo

          // TODO: send them to update participant info, and thend send the info back here
          Map? updateInfoData;

          // pull info from the update quiz back into onboarding.participants for the update.
          // the structure of this should be similar to the onboarding Q itself.
          print(updateInfoData.toString()); // debug
          for (int x = 0; x < onboarding.participants.length; x++) {
            // since this loops through the participant list anyway, we can use it
            // to incorporate the updated information.
            // todo read off updateinfoadata, requires testing on a "fresh" device
            // TODO: but does it really?

            /*if (updateInfoData != null) {
              onboarding.participants[x].nickname = "placeholder";
            }*/
            int success = await databaseManager
                .addParticipant(onboarding.participants[x]);
          }
        }
      }
    }
    //   if there is no onboarding data on server, we end up here but i think that doesn't matter
    print("...got participant data");
  }

  /// A function that updates the ages of all participants in the local database
  Future<void> updateAllParticipantAges() async {
    String _encode(Object object) =>
        const JsonEncoder.withIndent(' ').convert(object);
    DatabaseManager databaseManager = DatabaseManager();
    ClientManager clientManager = ClientManager();

    List<Participant> allParticipants =
        await databaseManager.getAllParticipants();
    List<Participant> updatedParticipants = [];

    allParticipants.forEach((element) async {
      updatedParticipants.add(element);
      updatedParticipants.last.updateAge();
      int irrelevant = await databaseManager.updateParticipantRecord(element);
    });
    // todo: upload updated info to server.
    // ParticipantData 'onboarding' is in the form of an OnboardingResponse object
    ParticipantData? currentData = await clientManager
        .getOnboardingData(); // why is this coming back null?
    OnboardingResponse? toBeUpdated;
    // todo: What if we get nothing? Need an absolute safety catch.
    if (currentData == null) {
      print("Null participant data returned from server!");
      // in which case we need to rebuild it from the internal database
      toBeUpdated = await databaseManager.getOnboarding();
    } else {
      Map tempData = jsonDecode(jsonEncode(currentData.data));
      toBeUpdated = OnboardingResponse.fromJson(tempData);
    }
    if (toBeUpdated != null) {
      // replace existing participant data with updated data and re-upload.
      toBeUpdated.participants = updatedParticipants;
      databaseManager.storeOnboarding(toBeUpdated);
      ParticipantData onboardingResults = ParticipantData(
          identifier: 'onboarding', data: _encode(toBeUpdated.toMap()));
      clientManager.uploadOnboardingData(onboardingResults);
    } else {
      List<Participant> checkParticipants =
          await databaseManager.getAllParticipants();
      if (checkParticipants.length > 0) {
        print("Participant data stored at least");
      } else {
        SharedPreferencesManager()
            .clear(SharedPreferencesManager.onboarding_completed_key);
      }
    }
    print("... updated all participant ages");
  }

  /// Checks for updates to app config and "timeline"
  Future checkForUpdates() async {
    StartupManager startupManager = StartupManager();
    ClientManager clientManager = ClientManager();
    DatabaseManager databaseManager = DatabaseManager();

    // Get latest appconfig.
    AppConfig? currentConfig = await clientManager.getCurrentConfig()!;
    // within the appConfig object we have configElements. Within configElements we have things.
    // also clientData
    // check for existing appConfigs
    List haveConfigs = await databaseManager.getAllAppConfigs();
    if (haveConfigs.length > 0) {
      // compare modifiedon.
      Map lastConfig = haveConfigs.last;
      DateTime lastModified = DateTime.parse(lastConfig['modifiedOn']);
      // compare datetimes
      if (currentConfig!.modifiedOn!.isAfter(lastModified)) {
        // now we need to do all the parsing of new activities and stuff.
        int irrel = await databaseManager.addAppConfig(currentConfig);
        // The parsing system
        startupManager.parseConfig(currentConfig);
      }
    } else {
      // The same parsing system. For the first launch, no need to check.
      int irrel = await databaseManager.addAppConfig(currentConfig!);
      startupManager.parseConfig(currentConfig);
    }

    // grab all StudyActivityEvents off the server
    // this has to happen first for the timeline update.
    StudyActivityEventList? serverEvents =
        await clientManager.getActivityEvents();
    int addedOrUpdated = 0;
    if (serverEvents != null) {
      // check against events in the database, add or update accordingly.
      addedOrUpdated =
          await databaseManager.updateAllStudyActivityEvents(serverEvents);
    }

    // next, timelines!
    bool timelineParsed = false;
    List allStudies = await databaseManager.getAllStudies();
    if (allStudies.length > 0) {
      allStudies.forEach((element) async {
        DateTime lastTimelineCheck = DateTime.parse(element['timelineUpdated']);
        print("Timeline last updated: " + element['timelineUpdated']);
        Timeline? latestTimeline = await clientManager
            .getTimeline(element['identifier'], lastChecked: lastTimelineCheck);
        //Timeline? latestTimeline = await client.getTimeline(element['identifier']); // debug, in case it screws up
        if (latestTimeline != null) {
          // if it's null, it hasn't changed.
          int updating = await databaseManager.updateTimelineDatestamp(
              element['identifier'], DateTime.now());
          // Parse timeline into ScheduledSessions, AudioTaskPayloads, and notifications
          print("parsing timeline");
          await startupManager.parseTimeline(latestTimeline);
          timelineParsed = true;
        }
      });
    } else {
      // no existing studies, i.e. first load.
      // TODO: will be replaced by study "arms"
      Study? theStudy = await clientManager.getStudy('tott-sandbox-study');
      Map<String, dynamic> clientData = theStudy!.clientData ??
          {"minAge": 36, "maxAge": 144, "status": "active"};

      // now get a timeline.
      Timeline? newTimeline =
          await clientManager.getTimeline('tott-sandbox-study');
      startupManager.parseTimeline(newTimeline!);
      timelineParsed = true;
      Map<String, Object> studyMap = {
        'identifier': 'tott-sandbox-study',
        'minAge': clientData['minAge'],
        'maxAge': clientData['maxAge'],
        'status': clientData['status'],
        'timelineData': jsonEncode(newTimeline.toJson()),
        'timelineUpdated': DateTime.now().toIso8601String()
      };
      databaseManager.addStudy(studyMap);
    }

    // now if no new timeline parsing occurred, we still need to check activityEvents for new tasks to update.
    if (timelineParsed == false && addedOrUpdated > 0) {
      // Go through and check startEventIds and "activated" status!
      await TaskActivationManager().checkNewActivations();
    }
    print("... checked for updates");
  }

  /// A function that parses the appConfig and updates all the relevant pieces
  ///
  /// Appconfig will contain studies but more importantly geofence_list!
  Future<void> parseConfig(AppConfig appConfig) async {
    DatabaseManager databaseManager = DatabaseManager();
    //List existingGeofences = await helper.getAllGeofences();
    // We are just going to take for granted that "geofence_list" will be a config element
    List<Map> geofenceList =
        List<Map>.from(appConfig.configElements!['geofence_list']);
    // translate the geofenceList into Geofence objects and update the database accordingly
    geofenceList.forEach((element) async {
      // check if the geofence is already in the database
      Map<String, dynamic>? testGeofence =
          await databaseManager.getGeoFence(element['identifier']);
      // if not, add it
      if (testGeofence == null) {
        bg.Geofence newGeofence = bg.Geofence(
            identifier: element['identifier'],
            radius: element['radius'].toDouble(),
            latitude: element['latitude'],
            longitude: element['longitude'],
            notifyOnEntry: element['notifyOnEntry'],
            notifyOnDwell: element['notifyOnDwell'],
            notifyOnExit: element['notifyOnExit'],
            loiteringDelay: element['loiteringDelay'],
            extras: {});
        int added = await databaseManager.addGeofence(newGeofence, false);
      }
    });
    print("... parsed config");
  }

  /// Parses a timeline and updates or populates a database of tasks, makes notifications, etc.
  Future<void> parseTimeline(Timeline newTimeline) async {
    ClientManager clientManager = ClientManager();
    DatabaseManager databaseManager = DatabaseManager();
    // First, parse each ScheduledSession and check it against the database.
    newTimeline.schedule!.forEach((element) async {
      ScheduledSession? checkSession = await databaseManager
          .getSpecificScheduledSession(instanceGuid: element.instanceGuid);
      if (checkSession == null) {
        // if no such session exsits in the database, we have to start by adding it.
        int addedSession = await databaseManager.addScheduledSession(element);
        // now we pull info from it to make an AudioTaskPayload, add that to the database
        // and determine activation criteria etc.
        // todo: how do we determine if criteria have been met to set something up? And do we do it here, or do we do that elsewhere?
        // todo: use startEventId. if "enrollment" etc. just fire it up.

        // you have to parse the payload here because some info is best pulled from the timeline itself
        // lining up what goes into a payload
        Map? assessmentConfig = {};
        /*String? guid; // from assessmentInfo
        String? instanceId; // from scheduledAssessment
        String? taskName; // from the list of assessments in the timeline object.
        List? geofences; // from assessmentConfig
        int? minAge; // from assessmentConfig
        int? maxAge; // from assessmentConfig
        String? taskText; // from assessment config
        bool? endTaskQ; // from assessment config
        List? endTaskQContent; // from assessment config
        List? participants; // computed from age range here.
        String? status; // Processed and determined during this setup.
        String? triggerCustomEvent; // pulled from schedule, I think. or assessmentconfig? Might not be needed? No, need something to trigger sequential task series
        */

        element.assessments!.forEach((scheduledAssessment) async {
          // refkey will be used ot identify the guid of the assessment.
          // identify which element of assessments has the right key for this element
          AssessmentInfo thisAssessment = newTimeline.assessments!
              .where((item) => item.key == scheduledAssessment.refKey)
              .first;
          String guid = thisAssessment.guid ?? 'missing';
          String taskName = thisAssessment.identifier ?? 'unnamed';
          //instanceid will come from the scheduledassessment within this element.
          String instanceId = scheduledAssessment.instanceGuid ?? 'missing';

          // pull the assessment config map.
          assessmentConfig = await clientManager
              .getAssessmentConfig(thisAssessment.configUrl!);

          // assessmentconfig includes age range.
          int minAge = assessmentConfig![
              'minAge']; // todo: will this just come in clean as an int?
          int maxAge = assessmentConfig!['maxAge'];
          List<Participant> participants = await TaskActivationManager()
              .matchParticipantsToAges(minAge, maxAge);
          if (participants.length > 0) {
            print("Participants assigned to task during timeline parsing");
          }
          // This is a list of Strings referencing the geofences.
          List<String> geofences =
              List<String>.from(assessmentConfig!['geofences']);

          String taskText = assessmentConfig!['taskText'];
          bool endTaskQ = assessmentConfig!['endTaskQ'] == "true";

          // now we go into the optional args.
          List<String>? endTaskQContent =
              List<String>.from(assessmentConfig!['endTaskQContent']);
          String? triggerCustomEvent = assessmentConfig!['triggerCustomEvent'];

          TaskPayload tempPayload = TaskPayload(guid, instanceId, taskName,
              minAge, maxAge, geofences, taskText, endTaskQ,
              participants: participants,
              endTaskQContent: endTaskQContent,
              triggerCustomEvent: triggerCustomEvent);

          // This also actually sets up the notifications if needed.
          tempPayload.status = await TaskActivationManager()
              .checkStatusAndActivate(element, tempPayload);

          // we can now finally store all this in the database.
          int addedTask = await databaseManager.addTaskPayload(tempPayload);
          print("added audio task payload to database");
        });
      }
    });
    print("... parsed timeline");
  }
}
