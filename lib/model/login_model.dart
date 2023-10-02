/*
// To parse this JSON data, do
//
//     final getBannerList = getBannerListFromJson(jsonString);

import 'dart:convert';

GetBannerList getBannerListFromJson(String str) => GetBannerList.fromJson(json.decode(str));

String getBannerListToJson(GetBannerList data) => json.encode(data.toJson());

class GetBannerList {
  String refresh;
  String access;
  String userType;
  String isAdmin;
  String isMulti;

  GetBannerList({
    required this.refresh,
    required this.access,
    required this.userType,
    required this.isAdmin,
    required this.isMulti,
  });

  factory GetBannerList.fromJson(Map<String, dynamic> json) => GetBannerList(
    refresh: json["refresh"],
    access: json["access"],
    userType: json["user_type"],
    isAdmin: json["is_admin"],
    isMulti: json["is_multi"],
  );

  Map<String, dynamic> toJson() => {
    "refresh": refresh,
    "access": access,
    "user_type": userType,
    "is_admin": isAdmin,
    "is_multi": isMulti,
  };
}
*/

// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  String token;

  SignInModel({
    required this.token,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
