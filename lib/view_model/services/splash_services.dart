import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mvvm_demo/data/SharedPreferences/preferences.dart';
import 'package:mvvm_demo/util/routes/routes_name.dart';
import 'package:mvvm_demo/view_model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/login_model.dart';

class SplashServices {
  Future<SignInModel> getUserData() => UserViewModel().getUser();

  checkAuthentication(context) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    String? token = sharedPreference.getString(Preferences.token);

    if (token.toString() == 'null' || token.toString() == '') {
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushNamed(context, RoutesName.login);
    } else {
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushNamed(context, RoutesName.homeScreen);
    }
  }

  Future<bool> remove() async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    sharedPreference.clear();
    return true;
  }
}
