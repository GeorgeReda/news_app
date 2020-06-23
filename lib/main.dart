import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'components/drawer.dart';
import 'constants.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      title: 'News App',
      home: ModDrawer(),
      theme: Constants.lightTheme,
      defaultTransition: Transition.scale,
    );
  }
}
