import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news_bloc/news_bloc.dart';
import 'package:news_app/components/Error_page.dart';
import 'package:news_app/components/news_list.dart';

import '../constants.dart';

class NewsPage extends StatelessWidget {
  final NewsEvent event;
  NewsPage({Key key, @required this.event}) : super(key: key);
  final NewsBloc _bloc = NewsBloc();

  @override
  Widget build(BuildContext context) {
    _bloc.add(event);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(
          bloc: _bloc,
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
                    _bloc.add(event);
                    return;
                  },
                  child: NewsList(items: state.data));
            return Container();
          },
        ),
      ),
    );
  }
}
