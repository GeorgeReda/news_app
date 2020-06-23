import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:news_app/blocs/news_bloc/news_bloc.dart';
import 'package:news_app/components/drawer_tile.dart';
import '../routes/main_screen.dart';

import '../constants.dart';

class ModDrawer extends StatelessWidget {
  final GlobalKey<InnerDrawerState> _key = GlobalKey<InnerDrawerState>();
  final _items = Constants.DRAWER_ITEMS;
  final NewsBloc _bloc = NewsBloc();
  ModDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _bloc.add(TopHeadlines());
    return InnerDrawer(
      key: _key,
      borderRadius: 20,
      leftAnimationType: InnerDrawerAnimation.quadratic,
      swipe: false,
      leftChild: Scaffold(
        backgroundColor: Color(0xfff8f8f8),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 8),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int index) {
              return DrawerTile(
                title: _items[index]["title"],
                icon: _items[index]["icon"],
                color: _items[index]["color"],
              );
            },
          ),
        ),
      ),
      scaffold: BlocProvider.value(
          value: _bloc, child: MainScaffold(drawerKey: _key)),
    );
  }
}
