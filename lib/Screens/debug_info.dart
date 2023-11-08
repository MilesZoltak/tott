import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:talk_of_the_town/Utilities/geofence_manager.dart';
import 'package:talk_of_the_town/Utilities/notification_manager.dart';

class DebugInfo extends StatelessWidget {
  DebugInfo({super.key});

  NotificationManager notificationManager = NotificationManager();
  GeofenceManager geofenceManager = GeofenceManager();

  void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: const TextStyle(fontSize: 20),
        ),
        duration: const Duration(seconds: 2), // Customize the duration
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Debug Info"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                child: const Text("Upcoming Notifications"),
                onPressed: () async {
                  showSnackBar(context, "Loading notifications... please wait.");
                  List<PendingNotificationRequest> upcomingNotifications =
                      await notificationManager.getUpcomingNotifications();

                  // ignore: use_build_context_synchronously
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Upcoming Notifications"),
                          content: ListView.separated(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(upcomingNotifications[index].title ?? "Notification title is null..."),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(color: Colors.lightGreen),
                              itemCount: upcomingNotifications.length),
                        );
                      });
                },
              ),
              OutlinedButton(
                child: const Text("Active Geofences"),
                onPressed: () async {
                  // ignore: use_build_context_synchronously
                  showSnackBar(context, "Fetching geofences... please wait.");

                  List<String> activeGeofenceNames =
                      await geofenceManager.getActiveGeofences();

                  // ignore: use_build_context_synchronously
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Active Geofences"),
                          content: activeGeofenceNames.isNotEmpty
                              ? ListView.separated(
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(activeGeofenceNames[index]),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                        color: Colors.lightGreen,
                                      ),
                                  itemCount: activeGeofenceNames.length)
                              : const Text("No active geofences."),
                        );
                      });
                },
              ),
              OutlinedButton(
                child: const Text("Currently in geofence(s)"),
                onPressed: () async {
                  // ignore: use_build_context_synchronously
                  showSnackBar(context, "Fetching geofences... please wait.");

                  List<String> currentlyGeofences =
                      await geofenceManager.currentlyInGeofence();

                  // ignore: use_build_context_synchronously
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Currently in geofence(s)"),
                          content: currentlyGeofences.isNotEmpty
                              ? ListView.separated(
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(currentlyGeofences[index]),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                        color: Colors.lightGreen,
                                      ),
                                  itemCount: currentlyGeofences.length)
                              : const Text("Not currently in any geofences."),
                        );
                      });
                },
              ),
              OutlinedButton(
                child: const Text("All Geofences and Distances"),
                onPressed: () async {
                  // ignore: use_build_context_synchronously
                  showSnackBar(context, "Fetching geofences... please wait.");

                  List<String> geofenceNamesAndDistances =
                      await geofenceManager.getGeofenceNamesAndDistances();

                  // ignore: use_build_context_synchronously
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Geofence names and distances"),
                          content: geofenceNamesAndDistances.isNotEmpty
                              ? ListView.separated(
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                          geofenceNamesAndDistances[index]),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                        color: Colors.lightGreen,
                                      ),
                                  itemCount: geofenceNamesAndDistances.length)
                              : const Text("No geofences."),
                        );
                      });
                },
              ),
            ],
          ),
        ));
  }
}
