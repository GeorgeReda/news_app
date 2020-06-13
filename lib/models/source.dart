import 'package:flutter/material.dart';

class Source extends StatelessWidget {
  final String name, description, url, category;
  const Source({Key key, this.name, this.description, this.url, this.category})
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
            title: Text(
              name,
              style: theme.headline6.copyWith(fontSize: 24),
            ),
            subtitle: Text(
              description,
              style: theme.bodyText2,
            ),
            trailing: Text('Category : $category'),
          ),
        ),
      ),
    );
  }
}
