import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/blocs/news_bloc/news_bloc.dart';

class Constants {
  static const Map<int, Color> PRIMARY_SWATCH = {
    50: Color.fromRGBO(255, 86, 107, .1),
    100: Color.fromRGBO(255, 86, 107, .2),
    200: Color.fromRGBO(255, 86, 107, .3),
    300: Color.fromRGBO(255, 86, 107, .4),
    400: Color.fromRGBO(255, 86, 107, .5),
    500: Color.fromRGBO(255, 86, 107, .6),
    600: Color.fromRGBO(255, 86, 107, .7),
    700: Color.fromRGBO(255, 86, 107, .8),
    800: Color.fromRGBO(255, 86, 107, .9),
    900: Color.fromRGBO(255, 86, 107, 1),
  };
  static const PRIMARY_COLOR = Color(0xffff566b);
  static const BG_COLOR = Colors.white;
  static const HEADLINE_COLOR = Color(0xff1f1f1f);
  static const CAPTION_COLOR = Color(0xffc9c7c7);
  static const CONTENT_COLOR = Color(0xff8d8d8d);
  static const Widget circularProgressIndicator = Center(
    child: CircularProgressIndicator(
      strokeWidth: 3,
    ),
  );
  static ThemeData lightTheme = ThemeData(
    primarySwatch: MaterialColor(0xffff566b, PRIMARY_SWATCH),
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
    {
      'title': Categories.General,
      'icon': FontAwesomeIcons.globe,
      'color': Colors.black54
    },
    {
      'title': Categories.Business,
      'icon': FontAwesomeIcons.briefcase,
      'color': Colors.indigo
    },
    {
      'title': Categories.Entertainment,
      'icon': FontAwesomeIcons.music,
      'color': PRIMARY_COLOR
    },
    {
      'title': Categories.Health,
      'icon': FontAwesomeIcons.medkit,
      'color': Colors.green
    },
    {
      'title': Categories.Science,
      'icon': FontAwesomeIcons.flask,
      'color': Colors.orange
    },
    {
      'title': Categories.Sports,
      'icon': FontAwesomeIcons.futbol,
      'color': Colors.red
    },
    {
      'title': Categories.Technology,
      'icon': FontAwesomeIcons.desktop,
      'color': Colors.purple
    },
  ];
}
