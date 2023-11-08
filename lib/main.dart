import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talk_of_the_town/Models/bridge_dart_sdk/bridge_sdk.models.swagger.dart'
    hide ColorScheme;
import 'package:talk_of_the_town/Utilities/wrapper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

UserSessionInfo? loginInfo;

/* ~~~~~~~ This is where the land of local notifications begins ~~~~~ */
//load up FLN
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// how we will represent notifications
class ReceivedNotification {
  ReceivedNotification({
    this.id,
    this.title,
    this.body,
    this.payload,
  });

  final int? id;
  final String? title;
  final String? body;
  final String? payload;
}

String? selectedNotificationPayload;

/// A notification action which triggers a url launch event
const String urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
const String navigationActionId = 'id_3';

/// Defines a iOS/MacOS notification category for text input actions.
const String darwinNotificationCategoryText = 'textCategory';

/// Defines a iOS/MacOS notification category for plain actions.
const String darwinNotificationCategoryPlain = 'plainCategory';

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

// const MethodChannel platform =
//     MethodChannel('dexterx.dev/flutter_local_notifications_example');
const MethodChannel platform =
    MethodChannel('talkofthetown.dev/testMethodChannel');

const String portName = 'notification_send_port';

//TODO: what in the fresh hell is this and must i keep it
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

// Future<void> _configureLocalTimeZone() async {
//   tz.initializeTimeZones();
//   final String timeZoneName = await platform.invokeMethod('getTimeZoneName');
//   tz.setLocalLocation(tz.getLocation(timeZoneName));
// }

Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  final String timeZoneName = await platform.invokeMethod('getTimeZoneName');
  print("time zone name $timeZoneName");
  tz.setLocalLocation(tz.getLocation(timeZoneName));
}

/* ~~~~~~~ This is where the land of local notifications ends, for now. ;) ~~~~~ */

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /* ~~~~~~ some other FLN stuff has to happen in main before we call runApp ~~~~~~ */
  await _configureLocalTimeZone();
  // dealing with the case where the app is launched from a notification
  final NotificationAppLaunchDetails? notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  bool fromNotification =
      notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

  // this should be the magic code that redirects immediately to the audio recording task.
  // specifically, if a notification launched the app, read the payload.
  if (fromNotification) {
    selectedNotificationPayload =
        notificationAppLaunchDetails?.notificationResponse?.payload ?? "";
  }

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  /// Note: permissions aren't requested here just to demonstrate that can be
  /// done later
  // borrowed from local notifications sample app
  final List<DarwinNotificationCategory> darwinNotificationCategories =
      <DarwinNotificationCategory>[
    DarwinNotificationCategory(
      darwinNotificationCategoryText,
      actions: <DarwinNotificationAction>[
        DarwinNotificationAction.text(
          'text_1',
          'Action 1',
          buttonTitle: 'Send',
          placeholder: 'Placeholder',
        ),
      ],
    ),
    DarwinNotificationCategory(
      darwinNotificationCategoryPlain,
      actions: <DarwinNotificationAction>[
        DarwinNotificationAction.plain('id_1', 'Action 1'),
        DarwinNotificationAction.plain(
          'id_2',
          'Action 2 (destructive)',
          options: <DarwinNotificationActionOption>{
            DarwinNotificationActionOption.destructive,
          },
        ),
        DarwinNotificationAction.plain(
          navigationActionId,
          'Action 3 (foreground)',
          options: <DarwinNotificationActionOption>{
            DarwinNotificationActionOption.foreground,
          },
        ),
        DarwinNotificationAction.plain(
          'id_4',
          'Action 4 (auth required)',
          options: <DarwinNotificationActionOption>{
            DarwinNotificationActionOption.authenticationRequired,
          },
        ),
      ],
      options: <DarwinNotificationCategoryOption>{
        DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
      },
    )
  ];

  /// Note: permissions aren't requested here just to demonstrate that can be
  /// done later
  final DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
    onDidReceiveLocalNotification:
        (int id, String? title, String? body, String? payload) async {
      didReceiveLocalNotificationStream.add(
        ReceivedNotification(
          id: id,
          title: title,
          body: body,
          payload: payload,
        ),
      );
    },
    notificationCategories: darwinNotificationCategories,
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) {
      switch (notificationResponse.notificationResponseType) {
        case NotificationResponseType.selectedNotification:
          selectNotificationStream.add(notificationResponse.payload);
          break;
        case NotificationResponseType.selectedNotificationAction:
          if (notificationResponse.actionId == navigationActionId) {
            selectNotificationStream.add(notificationResponse.payload);
          }
          break;
      }
    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );
  /* FLN interlude concludes */
  // TODO: now we have to go through main.dart in the other codebase and figure out what other notification stuff needs to happen
  runApp(MyApp(
      fromNotification: fromNotification,
      payload: selectedNotificationPayload ?? ""));
}

class MyApp extends StatelessWidget {
  final bool fromNotification; // did we launch the app from a notification?
  final String payload;

  const MyApp(
      {super.key, required this.fromNotification, required this.payload});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        supportedLocales: const [
          Locale("en"),
          //  we can add more locales here
        ],
        // TODO: figure out if we need to build out "localzationsDelegates" and "localeResolutionCallback"
        title: 'Talk of the Town',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark().copyWith(
            checkboxTheme:
                const CheckboxThemeData(side: BorderSide(color: Colors.grey)),
            listTileTheme: const ListTileThemeData(
                titleTextStyle: TextStyle(color: Colors.grey, fontSize: 16)),
            textButtonTheme: TextButtonThemeData(
              style:
                  TextButton.styleFrom(foregroundColor: Colors.lightGreen[300]),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.lightGreen[300],
                  textStyle: const TextStyle(fontSize: 18),
                  side: const BorderSide(width: 2.0, color: Colors.grey)),
            ),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              foregroundColor: Colors.white,
              backgroundColor:
                  Colors.lightGreen, // Set the default AppBar background color.
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen)),
        debugShowCheckedModeBanner: false,
        home: const Wrapper(),
      ),
    );
  }
}
