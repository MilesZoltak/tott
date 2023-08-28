import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  // final storage = const FlutterSecureStorage(aOptions: AndroidOptions(
  //   encryptedSharedPreferences: true,
  // ));
  final storage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  IOSOptions _getIOSOptions() => const IOSOptions(
    accountName: "tott",
  );

//  AUTH RELATED FUNCTIONS
  void setLoginInfo(String email, String password) async {
    await storage.write(key: 'email', value: email, iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
    await storage.write(key: 'password', value: password, iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
  }

  void forgetLoginInfo() async {
    await storage.delete(key: 'email', iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
    await storage.delete(key: 'password', iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
  }

  Future<String?> getEmail() async {
    return await storage.read(key: 'email', iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
  }

  Future<String?> getPassword() async {
    return await storage.read(key: 'password', iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
  }

  void setAutoLoginPreference(bool preference) async {
    await storage.write(key: 'doAutoLogin', value: preference.toString(), iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
  }

  Future<bool> getAutoLoginPreference() async {
    String? doAutoLogin = await storage.read(key: 'doAutoLogin', iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
    return doAutoLogin == "true";
  }

  Future setSessionToken(String sessionToken) async {
    await storage.write(key: "sessionToken", value: sessionToken, iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
  }

  Future<String> getSessionToken() async {
    return await storage.read(key: "sessionToken", iOptions: _getIOSOptions(), aOptions: _getAndroidOptions()) ?? "";
  }

//  CONSENT RELATED FUNCTIONS
  void setConsented(bool consented) async {
    await storage.write(key: 'consented', value: consented.toString(), iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
  }

  Future<bool> getConsented() async {
    String? consented = await storage.read(key: 'consented', iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
    return consented == "true";
  }

//  ONBOARDING RELATED FUNCTIONS
  void setOnboarded(bool onboarded) async {
    await storage.write(key: 'onboarded', value: onboarded.toString(), iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
  }

  Future<bool> getOnboarded() async {
    //TODO: delete this, it is for debugging
    return true;
    String? onboarded = await storage.read(key: 'onboarded');
    return onboarded == "true";
  }

  // DEBUG STUFF
  Future dumpSecureStorage() async {
    print("email: ${await storage.read(key: "email", iOptions: _getIOSOptions(), aOptions: _getAndroidOptions())}");
    print("password: ${await storage.read(key: "password", iOptions: _getIOSOptions(), aOptions: _getAndroidOptions())}");
    print("doAutoLogin: ${await storage.read(key: "doAutoLogin", iOptions: _getIOSOptions(), aOptions: _getAndroidOptions())}");
    print("sessionToken: ${await storage.read(key: "sessionToken", iOptions: _getIOSOptions(), aOptions: _getAndroidOptions())}");
    print("consented: ${await storage.read(key: "consented", iOptions: _getIOSOptions(), aOptions: _getAndroidOptions())}");
    print("onboarded: ${await storage.read(key: "onboarded, iOptions: _getIOSOptions(), aOptions: _getAndroidOptions()")}");

    print("but also there is this");
    print(await storage.readAll(iOptions: _getIOSOptions(), aOptions: _getAndroidOptions()));
  }
}