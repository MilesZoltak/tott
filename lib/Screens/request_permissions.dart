import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:talk_of_the_town/Screens/home.dart';

class RequestPermissions extends StatefulWidget {
  const RequestPermissions({super.key});

  @override
  State<RequestPermissions> createState() => _RequestPermissionsState();
}
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

class _RequestPermissionsState extends State<RequestPermissions> {
  final introKey = GlobalKey<IntroductionScreenState>();

  // one boolean for each permission
  // microphone, location, locationAlways, notification, storage
  List<bool> permissions = [false, false, false, false, false];

  EdgeInsets titlePadding = const EdgeInsets.only(top: 32);
  TextStyle titleTextStyle = const TextStyle(fontSize: 32);
  TextStyle bodyTextStyle = const TextStyle(fontSize: 20);
  TextStyle summaryTextStyle = const TextStyle(fontSize: 28);
  TextAlign summaryAlignment = TextAlign.center;

  bool freeze = false;
  bool animating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grant Permissions"),
      ),
      body: Center(
        child: IntroductionScreen(
          key: introKey,
          onChange: (idx) {
            if (idx == 0) {
              setState(() => freeze = false);
            } else {
              setState(() => freeze = true);

              if (idx < 6 && permissions[idx - 1] == true) {
                setState(() => freeze = false);
              }
            }
          },
          globalHeader: const Align(
            alignment: Alignment.topRight,
          ),
          resizeToAvoidBottomInset: false,
          pages: [
            PageViewModel(
                titleWidget: Padding(
                  padding: titlePadding,
                  child: Text(
                    "Required Permissions",
                    style: titleTextStyle,
                  ),
                ),
                bodyWidget: Text(
                  "For this app to function, you will need to grant a few permissions.  In this section, "
                  "you will be asked to grant permissions to use your phone's microphone, forground and background location services,"
                  "notifications, and storage.  An explanation of each permissions purpose will be displayed as well.",
                  style: bodyTextStyle,
                )),
            PageViewModel(
              titleWidget: Padding(
                padding: titlePadding,
                child: Text(
                  "Microphone",
                  style: titleTextStyle,
                ),
              ),
              bodyWidget: Column(
                children: [
                  Container(
                    height: 172,
                    width: 172,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightGreen,
                    ),
                    child: Icon(
                      Icons.mic,
                      size: animating ? 128 : 148,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                      "Your microphone will be used only when you do scheduled listening activities with your child(ren).",
                      style: summaryTextStyle,
                      textAlign: summaryAlignment),
                  const SizedBox(height: 16),
                  // TODO: finish this one up... maybe add an animation to the button or the icon (yes! the icon) before the page changes!!! and do that for all the other perms too!
                  OutlinedButton(
                    child: const Text("Grant Permission"),
                    onPressed: () async {
                      // Request the permission
                      var status = await Permission.microphone.request();

                      if (status.isGranted) {
                        setState(() {
                          permissions[0] = true;
                          freeze = false;
                        });
                        await Future.delayed(const Duration(milliseconds: 750));
                        introKey.currentState!.animateScroll(2);
                      } else {
                        showSnackBar(context, "Please enable microphone permission to continue.");
                      }
                    },
                  )
                ],
              ),
            ),
            PageViewModel(
              titleWidget: Padding(
                padding: titlePadding,
                child: Text(
                  "Foreground Location",
                  style: titleTextStyle,
                ),
              ),
              bodyWidget: Column(
                children: [
                  Container(
                    height: 172,
                    width: 172,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightGreen,
                    ),
                    child: const Icon(
                      Icons.location_on,
                      size: 128,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                      "Location services will be used in the app as you upload details about your conversations with your child(ren).",
                      style: summaryTextStyle,
                      textAlign: summaryAlignment),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    child: const Text("Grant Permission"),
                    onPressed: () async {
                      // Request the permission
                      var status = await Permission.location.request();
                      print(status);
                      if (status.isGranted) {
                        setState(() {
                          permissions[1] = true;
                          freeze = false;
                        });
                        await Future.delayed(const Duration(milliseconds: 750));
                        introKey.currentState!.animateScroll(3);
                      } else {
                        showSnackBar(context, "Please enable location permission to continue.");
                      }
                    },
                  )
                ],
              ),
            ),
            PageViewModel(
              titleWidget: Padding(
                padding: titlePadding,
                child: Text(
                  "Background Location",
                  style: titleTextStyle,
                ),
              ),
              bodyWidget: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 172,
                      width: 172,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.lightGreen,
                      ),
                      child: const Icon(
                        Icons.location_on_outlined,
                        size: 128,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                        "Location services will be needed while the app is in the background to prompt you to do special activites based on where you might be with your child(ren).",
                        style: summaryTextStyle,
                        textAlign: summaryAlignment),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      child: const Text("Grant Permission"),
                      onPressed: () async {
                        // Request the permission
                        var status = await Permission.locationAlways.request();

                        if (status.isGranted) {
                          setState(() {
                            permissions[2] = true;
                            freeze = false;
                          });
                          await Future.delayed(const Duration(milliseconds: 750));
                          introKey.currentState!.animateScroll(4);
                        } else {
                          showSnackBar(context, "Please enable background location permission to continue.");
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            PageViewModel(
              titleWidget: Padding(
                padding: titlePadding,
                child: Text(
                  "Notifications",
                  style: titleTextStyle,
                ),
              ),
              bodyWidget: Column(
                children: [
                  Container(
                    height: 172,
                    width: 172,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightGreen,
                    ),
                    child: const Icon(
                      Icons.notifications_active_outlined,
                      size: 128,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                      "You will receive notifications when it is time to do an activity with your child(ren).",
                      style: summaryTextStyle,
                      textAlign: summaryAlignment),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    child: const Text("Grant Permission"),
                    onPressed: () async {
                      // Request the permission
                      var status = await Permission.notification.request();

                      if (status.isGranted) {
                        setState(() {
                          permissions[3] = true;
                          freeze = false;
                        });
                        await Future.delayed(const Duration(milliseconds: 750));
                        introKey.currentState!.animateScroll(5);
                      } else {
                        showSnackBar(context, "Please enable notifications permission to continue.");
                      }
                    },
                  )
                ],
              ),
            ),
            PageViewModel(
              titleWidget: Padding(
                padding: titlePadding,
                child: Text(
                  "Storage",
                  style: titleTextStyle,
                ),
              ),
              bodyWidget: Column(
                children: [
                  Container(
                    height: 172,
                    width: 172,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightGreen,
                    ),
                    child: const Icon(
                      Icons.storage,
                      size: 128,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                      "Details about the app and your preferences will need to be stored on-device.  "
                      "This helps keep your information private.",
                      style: summaryTextStyle,
                      textAlign: summaryAlignment),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    child: const Text("Grant Permission"),
                    onPressed: () async {
                      final plugin = DeviceInfoPlugin();
                      final android = await plugin.androidInfo;

                      // if we have 33 or up, we have access to storage automatically
                      if (android.version.sdkInt >= 33) {
                        setState(() {
                          permissions[4] = true;
                          freeze = false;
                        });
                        await Future.delayed(const Duration(milliseconds: 750));
                        introKey.currentState!.animateScroll(6);
                        return;
                      }

                      // Request the permission if we have less than 33 sdk#
                      var status = await Permission.storage.request();
                      print("status: $status");

                      if (status.isPermanentlyDenied) {
                        // ignore: use_build_context_synchronously
                        showSnackBar(context, "This permission is denied.  Please enable 'Storage' in app permissions");
                        await Future.delayed(const Duration(seconds: 1));
                        openAppSettings();
                      }

                      if (status.isGranted) {
                        setState(() {
                          permissions[4] = true;
                          freeze = false;
                        });
                        await Future.delayed(const Duration(milliseconds: 750));
                        introKey.currentState!.animateScroll(6);
                      } else {
                        // ignore: use_build_context_synchronously
                        showSnackBar(context, "Please enable storage permission to continue.");
                      }
                    },
                  )
                ],
              ),
            ),
            PageViewModel(
                titleWidget: Padding(
                  padding: titlePadding,
                  child: Text(
                    "Thank you!",
                    style: titleTextStyle,
                  ),
                ),
                bodyWidget: Text(
                  "You may now continue to the app.\n\nThank you for your time.",
                  style: bodyTextStyle,
                  textAlign: TextAlign.center,
                )),
          ],
          freeze: freeze,
          onDone: () async {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
                (route) => false);
          },
          showBackButton: false,
          showNextButton: false,
          done: const Text("Done", style: TextStyle(fontSize: 18)),
          curve: Curves.ease,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: kIsWeb
              ? const EdgeInsets.all(12.0)
              : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(4.0, 4.0),
            spacing: EdgeInsets.symmetric(horizontal: 2),
            activeSize: Size(20.0, 8.0),
            activeColor: Colors.lightGreen,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
