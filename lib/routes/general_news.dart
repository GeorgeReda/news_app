import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/blocs/news_bloc/news_bloc.dart';
import 'package:news_app/components/Error_page.dart';
import 'package:news_app/components/news_list.dart';

import '../constants.dart';

class GeneralNews extends StatelessWidget {
  const GeneralNews({
    Key key,
    @required GlobalKey<InnerDrawerState> drawerKey,
  })  : _key = drawerKey,
        super(key: key);

  final GlobalKey<InnerDrawerState> _key;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
        SliverAppBar(
          floating: false,
          pinned: false,
          automaticallyImplyLeading: true,
          title: Text(
            'General News',
            style: Theme.of(context)
                .primaryTextTheme
                .headline6
                .copyWith(color: Colors.white),
          ),
          centerTitle: true,
          leading: Center(
            child: GestureDetector(
                onTap: () {
                  _key.currentState.toggle();
                },
                child: FaIcon(
                  FontAwesomeIcons.bars,
                  size: 20,
                )),
          ),
        )
      ],
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading || state is NewsInitial)
            return Constants.circularProgressIndicator;
          else if (state is NewsFailure)
            return ErrorPage(error: state.error);
          else if (state is NewsDone)
            return RefreshIndicator(
                strokeWidth: 3,
                color: Constants.PRIMARY_COLOR,
                onRefresh: () {
                  BlocProvider.of<NewsBloc>(context).add(TopHeadlines());
                  return;
                },
                child: NewsList(items: state.data));
          return Container();
        },
      ),
    );
  }
}
