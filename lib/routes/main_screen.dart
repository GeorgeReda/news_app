import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import '../components/drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableDrawer(
      scaffold: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
                    SliverAppBar(
                        expandedHeight: 200,
                        floating: false,
                        pinned: false,
                        flexibleSpace: Container(
                            color: Constants.PRIMARY_COLOR,
                            child: FlexibleSpaceBar(
                                centerTitle: true,
                                title: Text(
                                  'General News',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline6
                                      .copyWith(color: Colors.white),
                                )))),
                  ],
              body:Container() )),
    );
  }
}
