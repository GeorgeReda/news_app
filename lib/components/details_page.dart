import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String name, author, title, urlToImage, publishedAt, content;
  final TextDirection direction;
  const DetailsPage(
      {Key key,
      @required this.name,
      @required this.author,
      @required this.title,
      @required this.urlToImage,
      @required this.publishedAt,
      @required this.content,
      @required this.direction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                iconTheme: Theme.of(context).primaryIconTheme,
                floating: true,
                pinned: false,
                centerTitle: true,
                title: Text(
                  '$name',
                  style: theme.headline6.copyWith(color: Colors.white),
                ),
              )
            ];
          },
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            children: <Widget>[
              SizedBox(height: 10),
              Text('$title', style: theme.headline6, textDirection: direction),
              SizedBox(height: 10),
              Hero(
                  tag: title,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                                          child: Image.network(urlToImage, fit: BoxFit.fill,
                          loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 3,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ));
                      }),
                    ),
                  )),
              SizedBox(height: 10),
              Text('$name\n$publishedAt',
                  style: theme.caption,
                  textAlign: TextAlign.center,
                  textDirection: direction),
              SizedBox(height: 10),
              Text('${author != null ? author : ''}',
                  style: theme.caption, textDirection: direction),
              SizedBox(height: 10),
              Text('$content', style: theme.bodyText2, textDirection: direction)
            ],
          )),
    );
  }
}
