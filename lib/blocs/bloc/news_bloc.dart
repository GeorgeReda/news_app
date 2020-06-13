import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/models/source.dart';
import 'package:news_app/repos/repo.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final Repo _repo = Repo();
  @override
  NewsState get initialState => NewsInitial();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    // yield General news first
    if (event is NewsMain) {
      yield NewsLoading();
      await _repo.getData(sort: 'topHeadlines', page: 0);
      final data = json.decode(_repo.message);
      if (data['status'] == 'error') yield NewsFailure(error: data['message']);
      List posts = [];
      for (int i = 0; i <= data['articles'].length - 1; i++) {
        var path = data['articles'][i];
        posts.add(Post(
          author: path['author'],
          name: path['source']['name'],
          content: path['content'],
          description: path['description'],
          publishedAt: path['publishedAt'],
          title: path['title'],
          urlToImage: path['urlToImage'],
        ));
      }
      yield NewsDone(data: posts);
    } else if (event is TopHeadlines) {
      yield NewsLoading();
      await _repo.getData(
          sort: 'topHeadlines',
          page: event.page,
          country: event.country.toString(),
          category: event.category.toString(),
          pageSize: event.pageSize,
          query: event.q);
      final data = json.decode(_repo.message);
      if (data['status'] == 'error') yield NewsFailure(error: data['message']);
      List posts = [];
      for (int i = 0; i <= data['articles'].length - 1; i++) {
        var path = data['articles'][i];
        posts.add(Post(
          author: path['author'],
          name: path['source']['name'],
          content: path['content'],
          description: path['description'],
          publishedAt: path['publishedAt'],
          title: path['title'],
          urlToImage: path['urlToImage'],
        ));
      }
      yield NewsDone(data: posts);
    } else if (event is Everything) {
      yield NewsLoading();
      await _repo.getData(
          sort: 'everything',
          language: event.language.toString(),
          from: DateTime.parse(event.from).toIso8601String(),
          to: DateTime.parse(event.to).toIso8601String(),
          page: event.page,
          pageSize: event.pageSize,
          query: event.q,
          sortBy: event.sortBy);
      final data = json.decode(_repo.message);
      if (data['status'] == 'error') yield NewsFailure(error: data['message']);
      List posts = [];
      for (int i = 0; i <= data['articles'].length - 1; i++) {
        var path = data['articles'][i];
        posts.add(Post(
          author: path['author'],
          name: path['source']['name'],
          content: path['content'],
          description: path['description'],
          publishedAt: path['publishedAt'],
          title: path['title'],
          urlToImage: path['urlToImage'],
        ));
      }
      yield NewsDone(data: posts);
    } else if (event is Sources) {
      yield NewsLoading();
      await _repo.getData(
          sort: 'sources',
          language: event.language.toString(),
          country: event.country.toString(),
          category: event.category.toString());
      final data = json.decode(_repo.message);
      if (data['status'] == 'error') yield NewsFailure(error: data['message']);
      List sources = [];
      for (int i = 0; i <= data['articles'].length - 1; i++) {
        var path = data['sources'][i];
        sources.add(Source(
          name: path['name'],
          description: path['description'],
          url: path['url'],
          category: path['category'],
        ));
      }
      yield NewsDone(data: sources);
    }
  }
}
