import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final String name,
      author,
      title,
      description,
      urlToImage,
      publishedAt,
      content;
  const Post(
      {Key key,
      this.name,
      this.author,
      this.title,
      this.description,
      this.urlToImage,
      this.publishedAt,
      this.content})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(publishedAt);
    final theme = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(title, style: theme.headline6),
              Text('$name\n$date',
                  style: theme.caption, textAlign: TextAlign.center),
              Text(description, style: theme.bodyText2),
              Hero(
                  tag: title,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(urlToImage, fit: BoxFit.fill)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
