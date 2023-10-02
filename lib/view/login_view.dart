// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_demo/res/apploader.dart';
import 'package:mvvm_demo/util/utils.dart';
import 'package:mvvm_demo/view/home_screen.dart';
import 'package:mvvm_demo/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../data/SharedPreferences/shared_preference_helper.dart';
import '../res/components/buttons.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> obsureText = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    log("LoginView...");

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    obsureText.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return AppLoader(
      showLoader: authViewModel.loading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              SizedBox(height: 20),
              ValueListenableBuilder(
                  valueListenable: obsureText,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: passwordController,
                      obscureText: obsureText.value,
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            obsureText.value = !obsureText.value;
                          },
                          child: obsureText.value
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                    );
                  }),
              SizedBox(height: 20),
              RoundButton(
                title: 'Login',
                loading: authViewModel.loading,
                onPress: () {
                  if (emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter email', context);
                  } else if (passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Please enter password', context);
                  } else if (passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        'Please enter 6 digit password', context);
                  } else {
                    Map data = {
                      'username': emailController.text.toString(),
                      'password': passwordController.text.toString(),
                    };

                    authViewModel.loginApi(data, context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
