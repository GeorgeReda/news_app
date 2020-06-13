import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:news_app/components/drawer_tile.dart';
import 'package:news_app/constants.dart';

class ReusableDrawer extends StatelessWidget {
  final _items = Constants.DRAWER_ITEMS;
  final Scaffold scaffold;
  const ReusableDrawer({Key key, this.scaffold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
      borderRadius: 20,
      leftAnimationType: InnerDrawerAnimation.quadratic,
      swipe: true,
      leftChild: Scaffold(
        backgroundColor: Color(0xfff8f8f8),
        body: Center(child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return DrawerTile(
                title: _items[index]["title"], icon: _items[index]["title"]);
          },
        )),
      ),
      scaffold: scaffold, // TODO: change with BLoC builder
    );
  }
}
