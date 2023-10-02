import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_demo/model/login_model.dart';
import 'package:mvvm_demo/repository/auth_repositery.dart';
import 'package:mvvm_demo/util/routes/routes_name.dart';
import 'package:mvvm_demo/util/utils.dart';
import 'package:mvvm_demo/view_model/user_model.dart';

import '../data/SharedPreferences/shared_preference_helper.dart';

class AuthViewModel with ChangeNotifier {
  AuthRepositery authRepositery = AuthRepositery();
  //Home response
  SignInModel? _signInModel;
  SignInModel? get signInModel {
    // log("HUMNss ${_homeListResponse!.data.trending}");
    return _signInModel;
  }

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    authRepositery.loginApi(data).then((value) {
      setLoading(false);
      // _signInModel = value;
      Utils.toastMessage("Login Successfully");
      Navigator.pushNamed(context, RoutesName.homeScreen);
      log("value ${value.toString()}");
    }).onError((error, stackTrace) {
      setLoading(false);

      Utils.flushBarErrorMessage(error.toString(), context);
      log("loginApi Error ${error.toString()}");
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setLoading(true);
    authRepositery.loginApi(data).then((value) {
      setLoading(false);

      Utils.toastMessage("SignUp Successfully");
      Navigator.pushNamed(context, RoutesName.homeScreen);

      log("value ${value.toString()}");
    }).onError((error, stackTrace) {
      setLoading(false);

      Utils.flushBarErrorMessage(error.toString(), context);
      log("loginApi Error ${error.toString()}");
    });
  }
}
