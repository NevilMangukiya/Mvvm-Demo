import 'dart:developer';

import 'package:mvvm_demo/data/network/BaseApiServices.dart';
import 'package:mvvm_demo/data/network/NetworkApiService.dart';
import 'package:mvvm_demo/data/SharedPreferences/preferences.dart';
import 'package:mvvm_demo/data/SharedPreferences/shared_preference_helper.dart';
import 'package:mvvm_demo/res/components/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositery {
  BaseApiService baseApiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {

    try {
      log("try in LoginApi");

      dynamic response =
          await baseApiService.getPostApiResponse(ApiEndpoints.loginUrl, data);
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();

      preferences.setString(Preferences.token, response['token']);
      log("respppp ${response}");

      return response;
    } catch (e) {
      log("catach in LoginApi");
      throw e;
    }
  }

  Future<dynamic> signUp(dynamic data) async {
    try {
      log("signUp in LoginApi");

      dynamic response = await baseApiService.getPostApiResponse(
          ApiEndpoints.registerUrl, data);

      log("respppp ${response}");
      return response;
    } catch (e) {
      log("catch in signUp");
      throw e;
    }
  }
}
