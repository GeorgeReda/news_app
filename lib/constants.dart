import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Constants {
  static const PRIMARY_COLOR = Color(0xffff566b);
  static const BG_COLOR = Colors.white;
  static const HEADLINE_COLOR = Color(0xff1f1f1f);
  static const CAPTION_COLOR = Color(0xffdedede);
  static const CONTENT_COLOR = Color(0xff8d8d8d);

  static ThemeData lightTheme = ThemeData(
    primarySwatch: PRIMARY_COLOR,
    backgroundColor: BG_COLOR,
    appBarTheme: AppBarTheme(
      color: PRIMARY_COLOR,
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(color: HEADLINE_COLOR),
      caption: TextStyle(color: CAPTION_COLOR),
      bodyText2: TextStyle(color: CONTENT_COLOR),
    ),
    primaryIconTheme: IconThemeData(color: BG_COLOR, size: 32),
    dividerTheme: DividerThemeData(
        color: CAPTION_COLOR,
        thickness: 2,
        indent: 30,
        endIndent: 30,
        space: 50),
    scaffoldBackgroundColor: BG_COLOR,
    splashColor: Colors.transparent,
  );
  static const List<Map<String, dynamic>> DRAWER_ITEMS = [
    {'title': 'General', 'icon': FontAwesomeIcons.globe},
    {'title': 'Business', 'icon': FontAwesomeIcons.briefcase},
    {'title': 'Entertainment', 'icon': FontAwesomeIcons.music},
    {'title': 'Health', 'icon': FontAwesomeIcons.medkit},
    {'title': 'Science', 'icon': FontAwesomeIcons.flask},
    {'title': 'Sports', 'icon': FontAwesomeIcons.futbol},
    {'title': 'Technology', 'icon': FontAwesomeIcons.desktop},
  ];
}
