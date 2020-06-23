import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/blocs/news_bloc/news_bloc.dart';
import 'package:news_app/routes/news_page.dart';

class Source extends StatelessWidget {
  final String id, name, description, url, category;
  const Source(
      {Key key,
      this.name,
      this.description,
      this.url,
      this.category,
      @required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            onTap: () {
              Get.to(NewsPage(
                  event: TopHeadlines(
                sources: id,
              )));
            },
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: theme.headline6.copyWith(fontSize: 24),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: theme.bodyText2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
