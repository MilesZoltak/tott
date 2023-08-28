import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:talk_of_the_town/Screens/Auth/await_email_verification.dart';
import 'package:talk_of_the_town/Screens/Auth/create_account.dart';
import 'package:talk_of_the_town/Screens/Auth/sign_in.dart';
import 'package:talk_of_the_town/Screens/Informed%20Consent/consent.dart';
import 'package:talk_of_the_town/Screens/home.dart';
import 'package:talk_of_the_town/Screens/loading.dart';
import 'package:talk_of_the_town/Screens/onboarding.dart';
import 'package:talk_of_the_town/Utilities/auth_utils.dart';
import 'package:talk_of_the_town/Utilities/secure_storage_manager.dart';
import 'package:talk_of_the_town/main.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final AuthUtils auth = AuthUtils();
  final SecureStorageManager secureStorageManager = SecureStorageManager();

  bool loading = false;

  String email = "";
  String password = "";
  bool viewPassword = false;
  String password2 = "";
  bool viewPassword2 = false;

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
      return "Passsword must contain at least one lowercase lettter.";
    }

    // Password must contain at least one special character (non-alphanumeric).
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must contain at least one special character.";
    }

    // All criteria are met, return true.
    return ":)";
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
                                color: viewPassword ? Colors.deepPurpleAccent : Colors.grey[600],
                              ),
                            ),
                          ),
                          obscureText: !viewPassword,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          validator: (val) {
                            String result = checkPasswordValid(val);
                            if (result != ":)") {
                              return result;
                            }
                            return null; // Return null if validation is successful
                          },
                          onChanged: (val) => setState(() => password2 = val),
                          decoration: InputDecoration(
                            hintText: "Re-Enter Password",
                            suffixIcon: IconButton(
                              onPressed: () => setState(
                                  () => viewPassword2 = !viewPassword2),
                              icon: Icon(
                                viewPassword2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: viewPassword2 ? Colors.deepPurpleAccent : Colors.grey[600],
                              ),
                            ),
                          ),
                          obscureText: !viewPassword2,
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
                          title: const Text("Automatic Login", style: TextStyle(color: Colors.grey)),
                        ),
                        CheckboxListTile(
                          value: rememberMe,
                          onChanged: (val) {
                            setState(() =>
                                rememberMe = (val != null && val == true));
                          },
                          title: const Text("Remember Credentials", style: TextStyle(color: Colors.grey)),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            setState(() => error = "");
                            // if (!_formKey.currentState!.validate()) return;

                            setState(() => loading = true);
                            bool success = false;
                            ApiException? exception;
                            try {
                              success = await auth.signUp(
                                  "mileszoltak@gmail.com", "big!Cindy2011");
                              exception = null;
                            } catch (e) {
                              if (e.runtimeType == ApiException) {
                                exception = e as ApiException?;
                              }
                            }

                            // check if there were problems logging in
                            if (success != true) {
                              setState(() => error =
                                  "Error: Please check your connection and your credentials.");
                            //   TODO: stop being a fuckwit vvvv
                            } else if (exception != null) {
                              // setState(() =>
                              //     error = "Error: ${loginInfo["message"]}");
                            } else if (success) {
                              //we are authenticated, update the autoLogin and "remember me" prefs
                              secureStorageManager
                                  .setAutoLoginPreference(doAutoLogin);
                              if (doAutoLogin || rememberMe) {
                                secureStorageManager.setLoginInfo(email, password);
                              } else {
                                secureStorageManager.forgetLoginInfo();
                              }

                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AwaitEmailVerification(
                                              email, password)),
                                  (route) => false);
                            }

                            // TODO: error report why the account was not created
                            //just in case we haven't set this back yet
                            setState(() => loading = false);
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                              "Create Account",
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
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Log In",
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
