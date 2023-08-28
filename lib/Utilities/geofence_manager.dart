import 'package:latlong2/latlong.dart' as ll2;
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
as bg;
import 'package:talk_of_the_town/Models/bridge_dart_sdk/bridge_sdk.models.swagger.dart';
import 'package:talk_of_the_town/Models/participant.dart';
import 'package:talk_of_the_town/Models/task_payload.dart';
import 'package:talk_of_the_town/Utilities/database_manager.dart';
import 'package:talk_of_the_town/Utilities/notification_manager.dart';

class GeofenceManager {
  DatabaseManager databaseManager = DatabaseManager();

  void startGeofences() {
    bg.BackgroundGeolocation.onGeofence(_onGeofenceEvent);
    bg.BackgroundGeolocation.ready(bg.Config(
      desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
      distanceFilter: 10.0,
      enableHeadless: true,
      stopOnTerminate: false,
      startOnBoot: true,
      locationAuthorizationRequest: "Any",
    )).then((bg.State state) {
      if (!state.enabled) {
        // starts the geofence tracking system when the app first inits.
        bg.BackgroundGeolocation.startGeofences();
      }
    });
  }

  void headlessTask(bg.HeadlessEvent headlessEvent) async {
    // code that allows background geolocation to occur even when the app
    // has been closed altogether. Android-only, iOS does this differently.
    // see https://github.com/transistorsoft/flutter_background_geolocation/wiki/Android-Headless-Mode
    print('[BackgroundGeolocation HeadlessTask]: $headlessEvent');
    // Implement a 'case' for only those events you're interested in.
    switch (headlessEvent.name) {
      case bg.Event.HEARTBEAT:
        bg.HeartbeatEvent event = headlessEvent.event;
        print('- HeartbeatEvent: $event');
        break;
      case bg.Event.LOCATION:
        bg.Location location = headlessEvent.event;
        print('- Location: $location');
        break;
      case bg.Event.GEOFENCE:
        bg.GeofenceEvent geofenceEvent = headlessEvent.event;
        _onGeofenceEvent(geofenceEvent);
        print('- GeofenceEvent: $geofenceEvent');
        break;
      case bg.Event.GEOFENCESCHANGE:
        bg.GeofencesChangeEvent event = headlessEvent.event;
        print('- GeofencesChangeEvent: $event');
        break;
      case bg.Event.SCHEDULE:
        bg.State state = headlessEvent.event;
        print('- State: $state');
        break;
    }
  }

  void _onGeofenceEvent(bg.GeofenceEvent event) {
    print("geofence event triggered!");
    // event will have an identifier property, and an 'extras' property
    // the 'extras' property is an audiotaskpayload that needs to be parsed.

    Map<String, dynamic> payloadSpec = Map<String, dynamic>.from(event.extras!);
    TaskPayload taskPayload = TaskPayload.fromJson(payloadSpec);
    // now that we have the payload, we can go through each participant and see if
    // we are in a valid time window.
    DateTime currentTime = DateTime.now();
    // format of the date/times we're looking at is a map of the following
    // weekdays: [list strings], weekdayTimes: [0,0,0], weekends: [list], weekendTimes: [0,0,0]
    // so we need to pull a weekday and morning/afternoon/evening from currentTime.
    int weekday = currentTime.weekday - 1;
    List<String> daysWeek = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];
    String currentDay = daysWeek[weekday];
    int hour = currentTime.hour;
    List<bool> hourWindows = [false, false, false];
    if (hour > 6) {
      if (hour < 12) {
        hourWindows[0] = true;
      } else if (hour < 16) {
        hourWindows[1] = true;
      } else if (hour < 22) {
        hourWindows[2] = true;
      }
    }
    List<Participant> timeActive = [];
    taskPayload.participants?.forEach((element) {
      if (element.validTimes['weekdays']!.contains(currentDay)) {
        for (var i = 0; i < 3; i++) {
          if (element.validTimes['weekdayTimes']![i] == true &&
              hourWindows[i] == true) {
            timeActive.add(element);
          }
        }
      } else if (element.validTimes['weekend']!.contains(currentDay)) {
        for (var i = 0; i < 3; i++) {
          if (element.validTimes['weekendTimes']![i] == true &&
              hourWindows[i] == true) {
            timeActive.add(element);
          }
        }
      }
    });

    // Then recreate the payload with only participants who are available now.
    if (timeActive.length > 0) {
      NotificationManager notificationManager = NotificationManager();
      TaskPayload newTaskPayload = taskPayload;
      newTaskPayload.participants = timeActive;
      notificationManager.locationTriggeredNotification(
          event.identifier, newTaskPayload);
    }
    // or, if none, don't.
  }

  Future<List<String>> getActiveGeofences() async {
    List<Map> allGeofences = await databaseManager.getAllGeofences();
    List<Map> activeGeofences = [];
    if (allGeofences.length > 0) {
      allGeofences.forEach((element) {
        if (element['active'] == true || element['active'] == "true") {
          activeGeofences.add(element);
        }
      });
    }
    List<String> activeGeofenceNames = [];
    if (activeGeofences.length > 0) {
      activeGeofences.forEach((element) {
        activeGeofenceNames.add(element["identifier"]);
      });
    }
    return activeGeofenceNames;
  }

  /// Lists all stored geofences and distances.
  Future<List<String>> getGeofenceNamesAndDistances() async {
    List<Map> allGeofences = await databaseManager.getAllGeofences();
    List<String> geofenceNamesAndDistances = [];
    bg.Location currLoc = await bg.BackgroundGeolocation.getCurrentPosition();
    Map currLocMap = currLoc.toMap();
    ll2.LatLng currLatLng = ll2.LatLng(
        currLocMap['coords']['latitude'], currLocMap['coords']['longitude']);
    ll2.Distance distance = ll2.Distance();

    allGeofences.forEach((element) {
      ll2.LatLng geofenceLatLng =
      ll2.LatLng(element['latitude'], element['longitude']);
      double metricDistance = distance(geofenceLatLng, currLatLng);
      geofenceNamesAndDistances
          .add("${element['identifier']}: " + metricDistance.toString());
    });
    return geofenceNamesAndDistances;
  }

  /// Checks if the phone's current location is within a geofence
  Future<List<String>> currentlyInGeofence() async {
    bg.Location currLoc = await bg.BackgroundGeolocation.getCurrentPosition();
    Map currLocMap = currLoc.toMap();
    List<Map> allGeofences = await databaseManager.getAllGeofences();
    ll2.LatLng currLatLng = ll2.LatLng(
        currLocMap['coords']['latitude'], currLocMap['coords']['longitude']);
    List<String> inGeofences = [];
    allGeofences.forEach((element) {
      // compare against location.
      double tempGeofenceRadius = element['radius'];
      // the math here is rather ugly and complex.
      // but latlong2 solves it for us
      ll2.LatLng geofenceLatLng =
      ll2.LatLng(element['latitude'], element['longitude']);
      ll2.Distance distance = ll2.Distance();
      double metricDistance = distance(geofenceLatLng, currLatLng);
      if (metricDistance <= tempGeofenceRadius) {
        inGeofences.add(element['identifier']);
      }
    });
    return inGeofences;
  }
}