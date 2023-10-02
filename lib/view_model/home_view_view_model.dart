import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mvvm_demo/data/response/api_response.dart';
import 'package:mvvm_demo/model/movielist_model.dart';
import 'package:mvvm_demo/model/regresApiModel.dart';
import 'package:mvvm_demo/repository/home_repositery.dart';
import 'package:mvvm_demo/util/routes/routes_name.dart';
import 'package:mvvm_demo/util/utils.dart';

import '../model/randomUserModel.dart';

class HomeViewViewModel with ChangeNotifier {
  HomeRepositery homeRepositery = HomeRepositery();
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  ApiResponse<MovieListReposnse> movieList = ApiResponse.loading();
  ApiResponse<RandomUserModel> randomUser = ApiResponse.loading();
  ApiResponse<RegresUserModel> regress = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListReposnse> response) {
    movieList = response;
    notifyListeners();
  }

  randomUserList(ApiResponse<RandomUserModel> response) {
    randomUser = response;
    notifyListeners();
  }

  regressList(ApiResponse<RegresUserModel> response) {
    regress = response;
    notifyListeners();
  }

  Future<void> movieListApi(context) async {
    setLoading(true);
    homeRepositery.movieListApi().then((value) {
      setLoading(false);
      setMoviesList(ApiResponse.completed(value));
      log("value ${value.toString()}");
    }).onError((error, stackTrace) {
      setLoading(false);

      Utils.flushBarErrorMessage(error.toString(), context);
      log("movieListApi Error ${error.toString()}");
    });
  }

  Future<void> randomUserApi(context) async {
    setLoading(true);
    homeRepositery.randomUserApi().then(
      (value) {
        setLoading(false);
        randomUserList(ApiResponse.completed(value));
        log("value ${value.toString()}");
      },
    ).onError(
      (error, stackTrace) {
        setLoading(false);

        Utils.flushBarErrorMessage(error.toString(), context);
        log("randomUserApi Error ${error.toString()}");
      },
    );
  }

  Future<void> regresGetApi(context) async {
    setLoading(true);
    homeRepositery.regresGetApi().then(
      (value) {
        setLoading(false);
        regressList(ApiResponse.completed(value));
        log("value ${value.toString()}");
      },
    ).onError(
      (error, stackTrace) {
        setLoading(false);

        Utils.flushBarErrorMessage(error.toString(), context);
        log("regresGetApi Error ${error.toString()}");
      },
    );
  }
}
