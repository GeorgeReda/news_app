import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/blocs/news_bloc/news_bloc.dart';
import 'package:news_app/routes/news_page.dart';

class Search extends SearchDelegate {
  final suggestions = [
    'Egypt',
    'Twitter',
    'Facebook',
    'Space X',
    'Elon Musk',
    'Jeff Bezos',
    'Bill Gates'
  ];
  final recent = ['Covid - 19', 'Vaccine', 'Training', 'Programming'];

  @override
  List<Widget> buildActions(BuildContext context) =>
      [IconButton(icon: Icon(Icons.close), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () => close(context, null));

  @override
  Widget buildResults(BuildContext context) {
    return NewsPage(
      event: TopHeadlines(category: Categories.Business),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list = query.isEmpty
        ? recent
        : suggestions
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(FontAwesomeIcons.search),
        title: RichText(
            text: TextSpan(
                children: [
              TextSpan(
                  text: list[index].substring(query.length),
                  style: Theme.of(context).primaryTextTheme.bodyText2)
            ],
                text: list[index].substring(0, query.length),
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.bold))),
        onTap: () {
          query = '${list[index]}';
          showResults(context);
        },
      ),
    );
  }
}
