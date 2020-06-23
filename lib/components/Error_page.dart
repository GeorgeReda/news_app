import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/constants.dart';

class ErrorPage extends StatelessWidget {
  final String error;
  const ErrorPage({Key key, @required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FaIcon(
              FontAwesomeIcons.exclamationCircle,
              size: 24,
              color: Constants.PRIMARY_COLOR,
            ),
            SizedBox(height: 20),
            Text(
              error,
              style: Theme.of(context).primaryTextTheme.bodyText2,
            )
          ],
        ),
      ),
    );
  }
}
