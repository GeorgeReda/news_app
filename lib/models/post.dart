import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:get/get.dart';
import 'package:news_app/components/details_page.dart';

class Post extends StatelessWidget {
  final String name,
      author,
      title,
      description,
      urlToImage,
      publishedAt,
      content;
  Post(
      {Key key,
      @required this.name,
      @required this.author,
      @required this.title,
      @required this.description,
      @required this.urlToImage,
      @required this.publishedAt,
      @required this.content})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextDirection _direction = TextDirection.ltr;
    if (description.toString() != 'null')
      _direction =
          description.contains('ا') ? TextDirection.rtl : TextDirection.ltr;
    var date = DateTimeFormat.format(DateTime.parse(publishedAt),
        format: DateTimeFormats.american);
    final theme = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: () {
            Get.to(DetailsPage(
                name: name,
                author: author,
                title: title,
                urlToImage: urlToImage,
                publishedAt: date,
                content: content,
                direction: _direction));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(title, style: theme.headline6, textDirection: _direction),
                SizedBox(height: 10),
                Text('$name\n$date',
                    style: theme.caption,
                    textAlign: TextAlign.center,
                    textDirection: _direction),
                SizedBox(height: 10),
                Text(description,
                    style: theme.bodyText2, textDirection: _direction),
                SizedBox(height: 10),
                Hero(
                    tag: title,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(urlToImage, fit: BoxFit.fill,
                            loadingBuilder:
                                (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                              child: CircularProgressIndicator(
                            strokeWidth: 3,
                            value: loadingProgress.expectedTotalBytes !=
                                    null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ));
                        }),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
