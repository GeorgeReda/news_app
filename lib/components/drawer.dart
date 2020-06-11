import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/components/drawer_tile.dart';
import 'package:news_app/constants.dart';

class Drawer extends StatelessWidget {
  final _items = Constants.DRAWER_ITEMS;
  const Drawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
      borderRadius: 20,
      leftChild: Scaffold(
        body: Center(child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return DrawerTile(
                title: _items[index]["title"], icon: _items[index]["title"]);
          },
        )),
      ),
    );
  }
}
