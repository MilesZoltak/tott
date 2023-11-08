import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:talk_of_the_town/Debug/bundle.dart';
import 'package:talk_of_the_town/Screens/Consent%20And%20Onboarding/consent.dart';
import 'package:talk_of_the_town/Screens/Consent%20And%20Onboarding/onboarding.dart';
import 'package:talk_of_the_town/Screens/request_permissions.dart';
import 'package:talk_of_the_town/Utilities/client_manager.dart';
import 'package:talk_of_the_town/Utilities/notification_manager.dart';
import 'package:talk_of_the_town/Utilities/secure_storage_manager.dart';
import 'package:talk_of_the_town/Utilities/shared_preferences_manager.dart';

class Debug extends StatelessWidget {
  Debug({super.key});
  final String personalAccessToken = "eyJ0eXAiOiJKV1QiLCJraWQiOiJXN05OOldMSlQ6SjVSSzpMN1RMOlQ3TDc6M1ZYNjpKRU9VOjY0NFI6VTNJWDo1S1oyOjdaQ0s6RlBUSCIsImFsZyI6IlJTMjU2In0.eyJhY2Nlc3MiOnsic2NvcGUiOlsidmlldyIsImRvd25sb2FkIiwibW9kaWZ5Il0sIm9pZGNfY2xhaW1zIjp7fX0sInRva2VuX3R5cGUiOiJQRVJTT05BTF9BQ0NFU1NfVE9LRU4iLCJpc3MiOiJodHRwczovL3JlcG8tcHJvZC5wcm9kLnNhZ2ViYXNlLm9yZy9hdXRoL3YxIiwiYXVkIjoiMCIsIm5iZiI6MTY5MDkxMDY2OSwiaWF0IjoxNjkwOTEwNjY5LCJqdGkiOiIzNDcxIiwic3ViIjoiMzQ3NjA2NCJ9.fGyWE34PaRWUlbuEQpHeDxWyxjh0KaG4yZ7bfPQG7itDIotUdW9a1TdrLqYGNQq0tejj64p2rcR_ZYDzmUz3Tmas7tYic_RpW0ESrQWs5fOqthyBfRsXAcCpU2jyyl-wNAssBk7G5she0emHT7yPCe8GDFT_dzRZb029-iA7VvrXZzamAqGJM1nALsn6Xlo7tcR_GzLjCj7B0BoxDx9pbEU-mRLHKd5UjcXicK9tE31TorUqD-6lnkQym8QMa8D-q9PMF1PyF691LytCpI1gBxzlWDiGl8csgWRGINqHLsLka2FzPHEv8CBiFT_RIuaZmeW8HXpG7FSfncUkSC0OHg";
  final NotificationManager _notificationManager = NotificationManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Debug Tools"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: const Text("Consent"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Consent()));
              },
            ),
            ElevatedButton(
              child: const Text("Onboarding"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ToTOnboarding()));
              },
            ),
            ElevatedButton(
              child: const Text("Request Permissions"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RequestPermissions()));
              },
            ),
            ElevatedButton(
              child: const Text("Don't Auto Login"),
              onPressed: () {
                SecureStorageManager().setAutoLoginPreference(false);
              },
            ),
            ElevatedButton(
              child: const Text("Bundle"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Bundle()));
              },
            ),
            ElevatedButton(
              child: const Text("Trigger Notification Immediately"),
              onPressed: () {
                _notificationManager.createImmediateNotification();
              },
            ),
            ElevatedButton(
              child: const Text("Trigger Notification in 5s"),
              onPressed: () {
                _notificationManager.createFutureNotification(5);
              },
            ),
          ],
        ),
      ),
    );
  }
}
