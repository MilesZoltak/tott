import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:talk_of_the_town/Models/bridge_dart_sdk/bridge_sdk.models.swagger.dart';
import 'package:talk_of_the_town/Screens/Informed%20Consent/consent.dart';
import 'package:talk_of_the_town/Screens/loading.dart';
import 'package:talk_of_the_town/Utilities/auth_utils.dart';
import 'package:talk_of_the_town/main.dart';

class AwaitEmailVerification extends StatefulWidget {
  const AwaitEmailVerification(this.email, this.password, {Key? key})
      : super(key: key);
  final String email;
  final String password;

  @override
  State<AwaitEmailVerification> createState() => _AwaitEmailVerificationState();
}

class _AwaitEmailVerificationState extends State<AwaitEmailVerification> {
  AuthUtils auth = AuthUtils();
  bool loading = false;

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
    if (loading) {
      return const Loading();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Awaiting Email Verification"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "Please click the verification link in your email.\nThen click \"Try Logging In\"!"),
            ElevatedButton(
                onPressed: () async {
                  setState(() => loading = true);

                  ApiException? exception;
                  try {
                    loginInfo =
                        await auth.signIn(widget.email, widget.password);
                  } catch (e) {
                    if (e.runtimeType == ApiException) {
                      exception = e as ApiException;
                    }
                  }

                  setState(() => loading = false);
                  if (loginInfo == null && exception == null) {
                    // ignore: use_build_context_synchronously
                    showSnackBar(context,
                        "Unexpected Error.  Please check connection and try again.");
                  } else if (exception != null) {
                    var errContent = jsonDecode(exception.message!);
                    if (exception.code == 404 &&
                        errContent["type"] == "EntityNotFoundException") {
                      // ignore: use_build_context_synchronously
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Email not validated!'),
                              content: const Text(
                                  'Please check your email (and spam folder) for an email with a validation link. Click that link and press the "login" button again.'),
                              actions: <Widget>[
                                OutlinedButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });
                    } else if (exception.code == 404) {
                      // ignore: use_build_context_synchronously
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Unexpected error!'),
                              content: Text(
                                  'Server returned error of type: ${errContent["type"]}. Please ensure you are connected to the internet and try again.'),
                              actions: <Widget>[
                                OutlinedButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    print("closing alert");
                                    //Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });
                    } else {
                      // the 'has not consented' code - the expected outcome for this login attempt!
                      loginInfo = UserSessionInfo.fromJson(
                          json.decode(exception.message!));
                      print("tripped expected 412 exception, returning.");
                    }
                  } else {
                    //   i don't think this will ever actually happen
                  }
                },
                child: const Text("Try Logging In"))
          ],
        ),
      ),
    );
  }
}
