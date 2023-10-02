/*
import 'dart:convert';
import 'dart:developer';
import 'package:mvvm_demo/data/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? token = '';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // Save Device Token: ----------------------------------------------------------
}

Future<bool> saveAuthToken(String authToken) async {
  SharedPreferences _sharedPreference = await SharedPreferences.getInstance();

  return _sharedPreference.setString(Preferences.authToken, authToken);
}

Future<String?> get authToken async {
  SharedPreferences _sharedPreference = await SharedPreferences.getInstance();

  log("sghaa ${Preferences.authToken}");
  return _sharedPreference.getString(Preferences.authToken);
}

Future getToken() async {
  SharedPreferences sharedPreference = await SharedPreferences.getInstance();
  String? token = sharedPreference.getString(Preferences.token);
  log("pree $token");
}
*/
