import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  final List items;
  const NewsList({Key key,@required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(8.0),
        children: items,
      ),
    );
  }
}
