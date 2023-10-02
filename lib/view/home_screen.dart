// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_demo/model/movielist_model.dart';
import 'package:mvvm_demo/view_model/auth_view_model.dart';

import 'package:provider/provider.dart';

import '../data/response/status.dart';
import '../data/SharedPreferences/shared_preference_helper.dart';
import '../util/routes/routes_name.dart';
import '../util/utils.dart';
import '../view_model/home_view_view_model.dart';
import '../view_model/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    // TODO: implement initState
/*    homeViewViewModel.movieListApi(context);
    homeViewViewModel.randomUserApi(context);*/
    homeViewViewModel.regresGetApi(context);

    log("HomeScreen....");
    super.initState();
  }

  final getIt = GetIt.instance;
  AuthViewModel? authViewModel;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final userPrefernece = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: () {
                userPrefernece.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: Center(child: Text('logout'))),
          SizedBox(
            width: 20,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            homeViewViewModel.randomUserApi(context);
          });
        },
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, _) {
            if (value.regress.status == Status.LOADING) {
              log("LOADING");
              return Center(child: CircularProgressIndicator());
            } else if (value.regress.status == Status.ERROR) {
              log("ERROR");

              return Center(child: Text(value.regress.message.toString()));
            } else {
              return ListView.builder(
                  itemCount: value.regress.data!.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          value.regress.data!.data[index].avatar.toString(),
                          errorBuilder: (context, error, stack) {
                            return Icon(
                              Icons.error,
                              color: Colors.red,
                            );
                          },
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          value.regress.data!.data[index].firstName.toString(),
                        ),
                        subtitle: Text(
                          value.regress.data!.data[index].email.toString(),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Text(Utils.averageRating(value.movieList.data!.movies![index].ratings!).toStringAsFixed(1)),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
