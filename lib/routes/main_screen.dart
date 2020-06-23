import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/blocs/news_bloc/news_bloc.dart';
import 'package:news_app/routes/general_news.dart';
import 'package:news_app/routes/news_page.dart';
import 'package:news_app/routes/search_page.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({
    Key key,
    @required GlobalKey<InnerDrawerState> drawerKey,
  })  : _key = drawerKey,
        super(key: key);

  final GlobalKey<InnerDrawerState> _key;

  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;
  PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        children: <Widget>[
          GeneralNews(drawerKey: widget._key),
          SearchPage(),
          NewsPage(event: Sources())
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(_currentIndex);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(FontAwesomeIcons.newspaper), title: Text('General')),
          BottomNavyBarItem(
              icon: Icon(FontAwesomeIcons.compass), title: Text('Search')),
          BottomNavyBarItem(
              icon: Icon(FontAwesomeIcons.bars), title: Text('Sources'))
        ],
      ),
    );
  }
}
