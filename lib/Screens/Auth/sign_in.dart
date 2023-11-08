import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:talk_of_the_town/Screens/Auth/create_account.dart';
import 'package:talk_of_the_town/Screens/Consent%20And%20Onboarding/consent.dart';
import 'package:talk_of_the_town/Screens/home.dart';
import 'package:talk_of_the_town/Screens/loading.dart';
import 'package:talk_of_the_town/Screens/Consent%20And%20Onboarding/onboarding.dart';
import 'package:talk_of_the_town/Utilities/auth_utils.dart';
import 'package:talk_of_the_town/Utilities/client_manager.dart';
import 'package:talk_of_the_town/Utilities/secure_storage_manager.dart';
import 'package:talk_of_the_town/Utilities/startup_manager.dart';
import 'package:talk_of_the_town/Utilities/wrapper.dart';
import 'package:talk_of_the_town/main.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key, this.email, this.password}) : super(key: key);
  final String? email;
  final String? password;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final AuthUtils auth = AuthUtils();
  final SecureStorageManager secureStorageManager = SecureStorageManager();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool loading = false;

  String email = "";
  String password = "";
  bool viewPassword = false;

  bool doAutoLogin = false;
  bool rememberMe = false;

  String error = "";

  String checkPasswordValid(String? pwd) {
    //make sure password isn't null, that would be messed up
    if (pwd == null) return "Try a stronger password";
    String password = pwd;

    // Password must be 8 or more characters long.
    if (password.length < 8) return "Password must be 8 characters or more.";

    // Password must contain at least one uppercase letter.
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter.";
    }

    // Password must contain at least one lowercase letter.
    if (!password.contains(RegExp(r'[a-z]'))) {
      return "Password must contain at least one lowercase letter.";
    }

    // Password must contain at least one special character (non-alphanumeric).
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must contain at least one special character.";
    }

    // All criteria are met, return true.
    return ":)";
  }

  @override
  void initState() {
    if (widget.email != null && widget.password != null) {
      setState(() {
        email = widget.email!;
        password = widget.password!;
        emailController.text = email;
        passwordController.text = password;
        rememberMe = true;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Loading();
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Talk of the Town")
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(children: [
                        TextFormField(
                          controller: emailController,
                          validator: (val) {
                            if (val == null ||
                                !EmailValidator.validate(email)) {
                              return "Please enter a valid email";
                            }
                            return null; // Return null if validation is successful
                          },
                          onChanged: (val) => setState(() => email = val),
                          decoration: const InputDecoration(hintText: "Email"),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: (val) {
                            String result = checkPasswordValid(val);
                            if (result != ":)") {
                              return result;
                            }
                            return null; // Return null if validation is successful
                          },
                          onChanged: (val) => setState(() => password = val),
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  setState(() => viewPassword = !viewPassword),
                              icon: Icon(
                                viewPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: viewPassword ? Colors.lightGreenAccent : Colors.grey[600],
                              ),
                            ),
                          ),
                          obscureText: !viewPassword,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          error,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        CheckboxListTile(
                          value: doAutoLogin,
                          onChanged: (val) {
                            setState(() =>
                                doAutoLogin = (val != null && val == true));
                          },
                          title: const Text("Automatic Login"),
                        ),
                        CheckboxListTile(
                          value: rememberMe,
                          onChanged: (val) {
                            setState(() =>
                                rememberMe = (val != null && val == true));
                          },
                          title: const Text("Remember Credentials"),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            setState(() => error = "");
                            // if (!_formKey.currentState!.validate()) return;
                            // dynamic? response = await auth.signIn(email, password);
                            secureStorageManager.dumpSecureStorage();
                            setState(() => loading = true);


                            ApiException? exception;
                            try {
                              loginInfo = await auth.signIn(
                                  "mileszoltak@gmail.com", "big!Cindy2011");
                              exception = null;
                            } catch (e) {
                              if (e.runtimeType == ApiException) {
                                exception = e as ApiException?;
                              }
                            }

                            print("loginInfo!! ${loginInfo != null ? loginInfo!.toJson() : "null"}");
                            // check if there were problems logging in
                            if (loginInfo == null && exception == null) {
                              setState(() => error = "Error: Please check your connection and your credentials.");
                            } else if (exception != null) {
                              var errContent = jsonDecode(exception.message!);
                              setState(() => error = "Error: ${errContent["message"]}");
                            } else if (loginInfo!.authenticated ?? false) {
                              //we are authenticated, update the autoLogin and "remember me" prefs
                              secureStorageManager
                                  .setAutoLoginPreference(doAutoLogin);
                              if (doAutoLogin || rememberMe) {
                                secureStorageManager.setLoginInfo(email, password);
                              } else {
                                secureStorageManager.forgetLoginInfo();
                              }
                              secureStorageManager.setSessionToken(loginInfo!.sessionToken!);

                              //we may not have consented or onboarded yet: navigate appropriately
                              print("login info: $loginInfo");
                              if (loginInfo!.consented ?? false) {
                              // if (false && (loginInfo!.consented ?? false)) {
                                bool onboarded =
                                    await secureStorageManager.getOnboarded();
                                print("onboarded: $onboarded");

                                if (onboarded) {
                                  await StartupManager().runStartupFunction();

                                  setState(() => loading =
                                  false); // dismiss loading screen bc we are done with async work

                                  // ignore: use_build_context_synchronously
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()),
                                      (route) => false);
                                } else {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ToTOnboarding()),
                                      (route) => false);
                                }
                              } else {
                                setState(() => loading =
                                    false); // dismiss loading screen bc we are done with async work
                                // ignore: use_build_context_synchronously
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Consent()),
                                    (route) => false);
                              }
                            } else {
                              //this may never happen, but it would be in the case that they aren't authenticated and the response in nonnull with a status code other than 404
                              setState(() => error = "Error: Please check your credentials and try again.");
                            }

                            //just in case we haven't set this back yet
                            setState(() => loading = false);
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                              "Log In",
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?  ",
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAccount()));
                  },
                  child: const Text(
                    "Create Account",
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
