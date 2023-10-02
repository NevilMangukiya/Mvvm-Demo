import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mvvm_demo/model/login_model.dart';
import 'package:mvvm_demo/util/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  Future<bool> saveUser(SignInModel signInModel) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString('token', signInModel.token.toString());
    notifyListeners();
    return true;
  }

  Future<SignInModel> getUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String? actoken = preferences.getString('token');

    log("toknnnn ${actoken}");
    return SignInModel(token: actoken.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    sharedPreference.clear();
    Utils.toastMessage("Logout SuccessFull");
    return true;
  }
}
