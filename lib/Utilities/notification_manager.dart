import 'dart:io';
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:talk_of_the_town/Models/participant.dart';
import 'package:talk_of_the_town/Models/task_payload.dart';
import 'package:talk_of_the_town/main.dart';
import 'dart:convert';
import 'package:timezone/timezone.dart' as tz;

class NotificationManager {
  TaskPayload genericNotificationPayload = TaskPayload('generic', 'manualtask',
      'unnamed', 48, 144, [], 'Record a conversation with your child!', true,
      endTaskQContent: ['whichChild', 'whatTeaching', 'haveFun'],
      notificationBased: true,
      triggerCustomEvent: 'last_default_task');

  // requests notification permissions.  TODO: not sure yet when to call this in the app... maybe right after onboarding?
  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? grantedNotificationPermission =
          await androidImplementation?.requestPermission();
    }
  }

  //returns list of PendingNotifications. Is convenient for use in main.dart
  Future<List<PendingNotificationRequest>> checkUpcomingNotifications() async {
    return await flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }

  /// Displays a pop-up with a list of all pending notifications.
  Future<List<PendingNotificationRequest>> getUpcomingNotifications() async {
    NotificationManager notificationManager = NotificationManager();
    List<PendingNotificationRequest> upcomingNotifications =
    await notificationManager.checkUpcomingNotifications();
    List<String> upcomingNotificationTimes = [];

    upcomingNotifications.forEach((element) {
      TaskPayload upcomingPayload =
      TaskPayload.fromJson(jsonDecode(element.payload!));
      DateTime existingScheduled =
          upcomingPayload.notificationDateTime ?? DateTime.now().toLocal();
      // computed difference between the planned time and the existing time
      if (existingScheduled.isAfter(DateTime.now().toLocal())) {
        print(existingScheduled.toIso8601String());
        upcomingNotificationTimes.add(existingScheduled.toIso8601String());
      } else {
        print('"Pending" notification is in the past!');
      }
    });

    return upcomingNotifications;
  }

  // sends a generic notification immediately.  just a boring old test function for debugging
  Future<void> createImmediateNotification() async {
    _requestPermissions();
    print("Notification: Now.");
    await FlutterLocalNotificationsPlugin().show(
        0,
        'Task notification',
        'This is an immediately triggered notification',
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'tott_notifications', 'Talk of the Town notifications')),
        payload: jsonEncode(genericNotificationPayload.toMap()));
  }

  // sends a (potentially) generic notification in the future (delay is number of seconds in future)
  Future<void> createFutureNotification(int delay,
      {TaskPayload? payload}) async {
    print("Scheduling delayed notification");

    // add timestamp to payload if it exists
    TaskPayload? updatedPayload;
    if (payload != null) {
      DateTime atTime = DateTime.now().add(Duration(seconds: delay));
      updatedPayload = payload;
      updatedPayload.notificationDateTime = atTime;
      updatedPayload!.notificationBased = true;
    }

    // use payload to populate notification title and text.
    // check if payload has participants
    String singleMulti = '';
    if (payload != null) {
      if (payload.participants?.length == 1) {
        singleMulti =
            'for you to do with ${payload.participants!.first.nickname}';
      } else {
        singleMulti = 'for you to do with your children!';
      }
    }
    singleMulti = 'for you!';

    await FlutterLocalNotificationsPlugin().zonedSchedule(
        0,
        'Activity available!',
        'Talk of the Town has an activity available $singleMulti',
        tz.TZDateTime.now(tz.local).add(Duration(seconds: delay)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'tott_notifications', 'Talk of the Town notifications')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        payload: jsonEncode(updatedPayload != null
            ? updatedPayload.toMap()
            : genericNotificationPayload.toMap()));
  }

  // schedule a notification for a specific datetime in the future
  Future<void> createNotificationAtTime(DateTime time, {TaskPayload? payload}) async {
    // if there is a payload, add the timestamp to it.
    TaskPayload? updatedPayload;
    if (payload != null){
      updatedPayload = payload;
      updatedPayload.notificationDateTime = time;
      updatedPayload.notificationBased = true;
    }

    // use payload to populate notification title and text.
    // check if payload has participants
    String singleMulti = '';
    if (payload != null) {
      if (payload.participants!.length == 1) {
        singleMulti = 'for you to do with ${payload.participants!.first.nickname}';
      } else {
        singleMulti = 'for you to do with your children!';
      }
    }
    singleMulti = 'for you!';

    await FlutterLocalNotificationsPlugin().zonedSchedule(
        0,
        'Activity available!',
        'Talk of the Town has an activity available $singleMulti',
        tz.TZDateTime.from(time, tz.local),
        const NotificationDetails(
            android: AndroidNotificationDetails('tott_notifications',
                'Talk of the Town notifications')
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.wallClockTime,
        payload: jsonEncode(updatedPayload != null ? updatedPayload.toMap() : genericNotificationPayload.toMap())
    );
  }

  // this is gonna use geofences to trigger an immediate notification!
  Future<void> locationTriggeredNotification(String locationName, TaskPayload task) async {
    // if one participant, use nickname. If multiple, use "your children".
    // todo: Deactivate geofence after it trips? No, disable on completion.

    String singleMulti = '';
    if (task.participants!.length == 1) {
      singleMulti = 'for you to do with ${task.participants!.first.nickname}';
    } else {
      singleMulti = 'for you to do with your children!';
    }

    Map notificationPayload = task.toMap();
    await FlutterLocalNotificationsPlugin().show(
        0,
        'You found an activity!',
        'There is a nearby activity at $locationName $singleMulti!',
        const NotificationDetails(
            android: AndroidNotificationDetails('tott_notifications',
                'Talk of the Town notifications')
        ),
        payload: jsonEncode(notificationPayload)
    );
  }

  // TODO: fix and figure out what this does
  Future<bool> checkNotificationCollisions(DateTime plannedTime) async{

    List<PendingNotificationRequest> upcomingNotifications = await checkUpcomingNotifications();
    bool answer = false;
    upcomingNotifications.forEach((element) {
      TaskPayload upcomingPayload = TaskPayload.fromJson(jsonDecode(element.payload!));
      DateTime existingScheduled = upcomingPayload.notificationDateTime ?? DateTime.now().toLocal();
      // computed difference between the planned time and the existing time
      Duration difference = plannedTime.difference(existingScheduled);
      if (difference.inHours <= 1){
        answer = true;
      }
    });

    return answer;
  }

  // TODO: fix and figure out wtf this does
  Future<void> notifyParticipantAtNextOpportunity(Participant participant, TaskPayload notificationPayload, {Duration? minimumDelay}) async {
    // participant object contains the windows of availability.
    DateTime currentTime = DateTime.now().toLocal();
    print("Finding time for notification. Availabile times: " + participant.validTimes.toString());
    if (minimumDelay != null) {
      // moves the whole process forward in the future.
      currentTime = currentTime.add(minimumDelay);
    }
    int weekday = currentTime.weekday-1;
    // Dart counts days of week from Monday (1) to Sunday (7)
    List<String> daysWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday','Saturday', 'Sunday'];
    String currentDay = daysWeek[weekday];
    int hour = currentTime.hour;
    bool foundTime = false;
    int dayCounter = 0;
    // starting with 'today', whatever that is, cycle through days until a viable time is found.
    while (foundTime == false && dayCounter < 7) {
      String targetDay = weekday + dayCounter < daysWeek.length ? daysWeek[weekday + dayCounter] : daysWeek[weekday + dayCounter - 7];
      print("Is day $targetDay in valid days? ");
      if (participant.validTimes['weekdays']!.contains(targetDay) && foundTime == false){
        // a list of eligible hours
        List<int> windowHours = [];
        List validWeekdayTimes = participant.validTimes['weekdayTimes']!;
        for (int i = 0; i < 3; i++){
          if (validWeekdayTimes[i] == "true" || validWeekdayTimes[i] == true){
            for (int q = 0; q < 4; q++){
              windowHours.add(8+(i*4)+q);
            }
          }
        }
        print("Weekday hours: " + windowHours.toString());
        int maxHour = windowHours.length > 0 ? windowHours.last : 0;
        int tempHour = dayCounter == 0 ? hour : 8;
        while (tempHour <= maxHour && foundTime == false) {

          if (windowHours.contains(tempHour)){
            // create a DateTime, check collision, and schedule!
            // +/- 30 min jitter
            var rng = Random();
            int minuteJitter = rng.nextInt(60)-30;
            Duration hourDifference = Duration(hours: tempHour-hour, minutes: tempHour == hour ? 0 : minuteJitter);
            DateTime targetTime = currentTime.add(hourDifference);
            // safety valve because the system crashes if the time is before "now"
            if (targetTime.isBefore(DateTime.now().toLocal())){
              targetTime = DateTime.now().toLocal().add(Duration(minutes:1));
            }
            if (await checkNotificationCollisions(targetTime) == false){
              // At last, schedule the thing!
              print("Creating notification at " + targetTime.toIso8601String());
              await createNotificationAtTime(targetTime, payload: notificationPayload);
              foundTime = true;
            }
          }
          tempHour++;
        }
      }
      // same again if "today" is a weekend. If not, then we have to go on to other days.
      if (participant.validTimes['weekend']!.contains(targetDay) && foundTime == false){
        // a list of eligible hours
        List<int> windowHours = [];
        List validWeekendTimes = participant.validTimes['weekendTimes']!;
        for (int i = 0; i < 3; i++){
          if (validWeekendTimes[i] == "true" || validWeekendTimes[i] == true){
            for (int q = 0; q < 4; q++){
              windowHours.add(8+(i*4)+q);
            }
          }
        }
        print("Weekend hour windows :" + windowHours.toString());
        int maxHour = windowHours.length > 0 ? windowHours.last : 0;
        int tempHour = dayCounter == 0 ? hour : 8;
        while (tempHour <= maxHour && foundTime == false) {
          if (windowHours.contains(tempHour)){
            // create a DateTime, check collision, and schedule!
            // +/- 30 min jitter
            var rng = Random();
            int minuteJitter = rng.nextInt(60)-30;
            Duration hourDifference = Duration(hours: tempHour-hour, minutes: tempHour == hour ? 0 : minuteJitter);
            DateTime targetTime = currentTime.add(hourDifference);
            // safety valve because the system crashes if the time is before "now"
            if (targetTime.isBefore(DateTime.now().toLocal())){
              targetTime = DateTime.now().toLocal().add(Duration(minutes:2));
            }
            if (await checkNotificationCollisions(targetTime) == false){
              // At last, schedule the thing!
              print("Creating notification at " + targetTime.toIso8601String());
              await createNotificationAtTime(targetTime, payload: notificationPayload);
              foundTime = true;
            }
          }
          tempHour++;
        }
      }
      dayCounter++;
    }
  }
}
