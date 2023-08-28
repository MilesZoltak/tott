import 'package:talk_of_the_town/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';
import 'dart:math';

import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// This retains various settings for the app from one run to the next
///
/// Some things, like logins etc., will move to secure storage
/// Other things, like the list of current tasks from the server, may be
/// better served by an SQLite database.
/// useful reference: https://github.com/appditto/natrium_wallet_flutter/blob/master/lib/util/sharedprefsutil.dart
/// and https://github.com/appditto/natrium_wallet_flutter/blob/master/lib/main.dart lines 330ish
/// {@category App}
class SharedPreferencesManager{

  // settings that have to do with setting up the app initially
  static const String first_launch_key = 'first_launch';
  static const String consent_completed_key = 'consent_completed';
  static const String onboarding_completed_key = 'onboarding_completed';
  static const String permissions_enabled_key = 'permissions_enabled';
  static const String account_exists_key = 'account_exists';
  static const String automatic_login_key = 'automatic_login';
  static const String remember_account_key = 'remember_account';
  static const String phone_identifier_key = 'phone_identifier';

  /// Handy utility method for setting any arbitrary setting.
  ///
  /// borrowed from 'natrium_wallet_flutter'
  Future<void> set(String key, value) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (value is bool) {
      sharedPreferences.setBool(key, value);
    } else if (value is String) {
      sharedPreferences.setString(key, value);
    } else if (value is double) {
      sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      sharedPreferences.setInt(key, value);
    }
  }

  /// Handy utility method for getting any arbitrary setting.
  ///
  /// borrowed from 'natrium_wallet_flutter'
  Future<dynamic> get(String key, {dynamic defaultValue}) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.get(key) ?? defaultValue;
  }

  /// A function which clears a given preference. Slightly dangerous.
  Future<void> clear(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  /// Check first launch setting.
  ///
  /// If it hasn't been set, it'll return true, thereby indicating that this is the first launch.
  Future<bool> getFirstLaunch() async{

    return await get(first_launch_key, defaultValue: true);
  }

  /// Sets first launch to false. Should only ever need to be called once.
  Future<void> setFirstLaunch() async{
    await set(first_launch_key, false);
  }

  /// Check whether consent has been completed. Defaults to false
  Future<bool> getConsentCompleted() async{
    //TODO: delete me!!!!
    return false;
    return await get(consent_completed_key, defaultValue: false);
  }

  /// Sets the consent completed variable.
  ///
  /// Has a switch to let it be set to false if that's needed, but by default
  /// just calling the method will set it to true.
  Future<void> setConsentCompleted({bool value=true}) async{
    await set(consent_completed_key, value);
  }

  /// Check if the onboarding questionnaire has been completed.
  ///
  /// like consent, defaults to false
  Future<dynamic> getOnboardingCompleted() async{

    return await get(onboarding_completed_key, defaultValue: false);
  }

  /// Sets the most recent onboarding completion date as a string.
  Future<void> setOnboardingCompleted(String value) async{
    await set(onboarding_completed_key, value);
  }

  /// For checking whether the permissions have been dealt with yet.
  ///
  /// Defaults to false.
  Future<bool> getPermissionsEnabled() async {
    return await get(permissions_enabled_key, defaultValue: false);
  }

  /// Sets permissions enabled variable.
  ///
  /// Defaults to true.
  Future<void> setPermissionsEnabled({bool value=true}) async{
    await set(permissions_enabled_key, value);
  }

  /// Checks if the 'account_exists' variable is set.
  ///
  /// Defaults to false, if it doesn't exist yet.
  Future<bool> getAccountExists() async{
    return await get(account_exists_key, defaultValue: false); // testing code, default in the future will be false.
  }

  /// Sets the account_exists variable.
  ///
  /// Defaults to true.
  Future<void> setAccountExists({bool value=true}) async{
    await set(account_exists_key, value);
  }

  /// Function for scheduling a notification.
  ///
  /// In this file for largely historical reasons, likely to be moved at a later date.
  Future<void> scheduleNotification(DateTime atTime, String projectName, String ageChild, String whichChild) async {
    Map taskPayload = {"task":projectName, "child":whichChild, "age":ageChild, "notificationBased":"true"};
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0, '$projectName activity!', 'Ready to do an activity with your $ageChild-year-old?',
        tz.TZDateTime.from(atTime, tz.local),
        const NotificationDetails(
            android: AndroidNotificationDetails('your channel id',
                'your channel name')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        payload: jsonEncode(taskPayload));

  }

  /// Function that actually requests audio and location permissions.
  ///
  /// Used with the permissions preference variable.
  Future<void> getAudioLocationPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.location,
      Permission.locationAlways,
      Permission.storage,
      Permission.notification
    ].request();
  }
  Future<void> setFullStoragePermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      // todo: This storage permission cause a crash when granted on first boot, rescheduling to try to make it crash less.
      Permission.manageExternalStorage,
      // todo: Did we even need external storage?
      //Permission.storage,
    ].request();
  }

}