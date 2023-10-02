// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppLoader extends StatefulWidget {
  final bool showLoader;
  final Widget child;
  const AppLoader({Key? key, required this.showLoader, required this.child})
      : super(key: key);

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Visibility(
          visible: widget.showLoader,
          child: loader(),
        )
      ],
    );
  }

  Widget loader() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
