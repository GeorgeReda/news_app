import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawerTile({Key key, @required this.title, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            title,
            style: Get.textTheme.bodyText2,
          ),
          leading: Icon(icon),
          onTap: () {}, // TODO: Define Drawer BLoC
        ),
      ),
    );
  }
}
