import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/components/search.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => showSearch(context: context, delegate: Search()))
        ],
      ),
      body: Container(
          child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Advanced search is supported here:',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: FaIcon(FontAwesomeIcons.dotCircle),
              title: Text(
                  'Prepend words or phrases that must appear with a + symbol. Eg: +bitcoin',
                  style: Theme.of(context).primaryTextTheme.bodyText2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: FaIcon(FontAwesomeIcons.dotCircle),
              title: Text(
                  'Prepend words that must not appear with a - symbol. Eg: -bitcoin',
                  style: Theme.of(context).primaryTextTheme.bodyText2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: FaIcon(FontAwesomeIcons.dotCircle),
              title: Text(
                  'Alternatively you can use the AND / OR / NOT keywords, and optionally group these with parenthesis. Eg: crypto AND (ethereum OR litecoin) NOT bitcoin',
                  style: Theme.of(context).primaryTextTheme.bodyText2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: FaIcon(FontAwesomeIcons.dotCircle),
              title: Text('Surround phrases with quotes (\") for exact match.',
                  style: Theme.of(context).primaryTextTheme.bodyText2),
            ),
          ),
        ],
      )),
    );
  }
}
