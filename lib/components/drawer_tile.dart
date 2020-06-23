import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:news_app/blocs/news_bloc/news_bloc.dart';
import 'package:news_app/routes/news_page.dart';

class DrawerTile extends StatelessWidget {
  final Categories title;
  final IconData icon;
  final Color color;
  const DrawerTile(
      {Key key,
      @required this.title,
      @required this.icon,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            title.toString().substring(11),
            style: Theme.of(context)
                .primaryTextTheme
                .bodyText2
                .copyWith(color: color),
          ),
          leading: FaIcon(
            icon,
            color: color,
          ),
          onTap: () {
            Get.to(NewsPage(
              event: TopHeadlines(category: title),
            ));
          },
        ),
      ),
    );
  }
}
