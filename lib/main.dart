import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants.dart';
import 'routes/main_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      home: MainScreen(),
      theme: Constants.lightTheme,
      defaultTransition: Transition.scale,
    );
  }
}
