import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:talk_of_the_town/Models/bridge_dart_sdk/bridge_sdk.models.swagger.dart';
import 'package:talk_of_the_town/Screens/Auth/sign_in.dart';
import 'package:talk_of_the_town/Utilities/secure_storage_manager.dart';
import 'package:talk_of_the_town/Utilities/shared_preferences_manager.dart';
import 'package:talk_of_the_town/main.dart';

class AuthUtils {
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future reAuth() async {
    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v3/auth/reauth";
    final url = Uri.parse(baseUrl + route);

    final data = {
      "appId": "tott-sandbox",
      "email": loginInfo!.email!,
      "reauthToken": loginInfo!.reauthToken!
    };
    //   TODO: this doesn't seem to be remotely complete...
  }

  Future<UserSessionInfo?> signIn(String email, String password) async {
    // TODO: test me!!! i am untested!
    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v4/auth/signIn";
    final url = Uri.parse(baseUrl + route);

    final data = {
      "appId": "tott-sandbox",
      "email": email,
      "password": password
    };

    UserSessionInfo? loginInfo;

    int? statusCode;
    String? errorMessage;
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );

      final jsonResponse = json.decode(response.body);
      print("sign in json response: $jsonResponse");
      if (response.statusCode == 200) {
        loginInfo = UserSessionInfo.fromJson(jsonResponse);
      } else {
        print("status code isn't 200 tho...");
        loginInfo = UserSessionInfo.fromJson(jsonResponse);

        statusCode = response.statusCode;
        errorMessage = response.body.toString();
        throw ApiException(
            response.statusCode, response.body.toString());
      }
    } catch (e) {
      print("Error attempting to sign in occurred. Details: $e");
      throw ApiException(statusCode ?? -1, errorMessage ?? e.toString());
    }
    return loginInfo;
  }

  Future<UserSessionInfo?> autoSignIn() async {
    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v4/auth/signIn";
    final url = Uri.parse(baseUrl + route);

    SecureStorageManager secureStorageManager = SecureStorageManager();
    String? email = await secureStorageManager.getEmail();
    String? password = await secureStorageManager.getPassword();
    print("email: $email");
    print("password: $password");
    UserSessionInfo? loginInfo;
    try {
      loginInfo = await signIn(email!, password!);
    } catch (e) {
      print("Error attempting to automatically sign in. Details: $e");
      throw ApiException(-1, e.toString());
    }
    return loginInfo;
  }

  /// A function for dealing with cases where, for whatever reason, we don't have login info.
  Future<void> missingLogin() async {
    if (loginInfo != null) {
      await reAuth();
    } else if (await SharedPreferencesManager()
        .get(SharedPreferencesManager.automatic_login_key, defaultValue: false)) {
      await autoSignIn();
    } else {
      // todo: Find a way to force the app to navigate to the manual login page.
      print("Total failure to log in, need manual login option");
    }
  }

  Future<bool> signUp(String email, String password) async {
    const baseUrl = "https://webservices.sagebridge.org/";
    const route = "/v3/auth/signUp";
    final url = Uri.parse(baseUrl + route);

    String externalId = getRandomString(8);
    final data = {
      "appId": "tott-sandbox",
      "email": email,
      "password": password,
      "studyIds": ['tott-sandbox-study'],
      "externalId": externalId
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );

      //code 201 means "Created"
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      print("Error occurred: $e");
    }
    return false;
  }
}

/// A class specifically for handling error messages returned by the new SDK
class ApiException implements Exception {
  int code = 0;
  String? message;
  Exception? innerException;
  StackTrace? stackTrace;

  ApiException(this.code, this.message);

  ApiException.withInner(
      this.code, this.message, this.innerException, this.stackTrace);

  String toString() {
    if (message == null) return "ApiException";

    if (innerException == null) {
      return "ApiException $code: $message";
    }

    return "ApiException $code: $message (Inner exception: $innerException)\n\n" +
        stackTrace.toString();
  }
}
