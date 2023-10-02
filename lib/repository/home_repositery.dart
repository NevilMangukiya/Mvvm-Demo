import 'dart:developer';

import 'package:mvvm_demo/data/network/BaseApiServices.dart';
import 'package:mvvm_demo/data/network/NetworkApiService.dart';
import 'package:mvvm_demo/model/movielist_model.dart';
import 'package:mvvm_demo/model/randomUserModel.dart';
import 'package:mvvm_demo/model/regresApiModel.dart';

import '../res/components/app_url.dart';

class HomeRepositery {
  BaseApiService baseApiService = NetworkApiService();
  Future<MovieListReposnse> movieListApi() async {
    try {
      log("try in LoginApi");

      dynamic response = await baseApiService.getGetApiResponse(
        ApiEndpoints.movieList,
      );

      log("respppp ${response['access']}");

      return MovieListReposnse.fromJson(response);
    } catch (e) {
      log("catach in LoginApi");
      throw e;
    }
  }

  Future<RandomUserModel> randomUserApi() async {
    try {
      log("try in randomUserApi");

      dynamic response = await baseApiService.getGetApiResponse(
        ApiEndpoints.randomUser,
      );

      log("randomUserApi ${response}");

      return RandomUserModel.fromJson(response);
    } catch (e) {
      log("catach in LoginApi");
      throw e;
    }
  }

  Future<RegresUserModel> regresGetApi() async {
    try {
      log("try in regresGetApi");

      dynamic response = await baseApiService.getGetApiResponse(
        ApiEndpoints.regresGetApi,
      );

      log("regresGetApi ${response}");

      return RegresUserModel.fromJson(response);
    } catch (e) {
      log("catach in regresGetApi");
      throw e;
    }
  }
}
