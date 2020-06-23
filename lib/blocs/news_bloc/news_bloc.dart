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

enum Sorts { TopHeadlines, Everything, Sources }

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
      await _repo.getData(sort: Sorts.TopHeadlines, page: 0);
      final data = json.decode(_repo.message);
      if (data['status'] == 'error') yield NewsFailure(error: data['message']);
      List posts = [];
      for (int i = 0; i <= data['articles'].length - 1; i++) {
        var path = data['articles'][i];
        posts.add(Post(
          author: '${path['author']}',
          name: '${path['source']['name']}',
          content: '${path['content']}',
          description: '${path['description']}',
          publishedAt: '${path['publishedAt']}',
          title: '${path['title']}',
          urlToImage: '${path['urlToImage']}',
        ));
      }
      yield NewsDone(data: posts);
    } else if (event is TopHeadlines) {
      yield NewsLoading();
      print(event.sources);
      await _repo.getData(
          sort: Sorts.TopHeadlines,
          id: event.sources,
          page: event.page,
          country: event.country.toString(),
          category: event.category.toString().toLowerCase(),
          pageSize: event.pageSize,
          query: event.q);
      final data = await _repo.message;
      if (data['status'] == 'error') yield NewsFailure(error: data['message']);
      List<Post> posts = [];
      for (int i = 0; i <= data['articles'].length - 1; i++) {
        var path = data['articles'][i];
        print(path['source']['id']);
        posts.add(Post(
          author: '${path['author']}',
          name: '${path['source']['name']}',
          content: '${path['content']}',
          description: '${path['description']}',
          publishedAt: '${path['publishedAt']}',
          title: '${path['title']}',
          urlToImage: '${path['urlToImage']}',
        ));
      }
      yield NewsDone(data: posts);
    } else if (event is Everything) {
      yield NewsLoading();
      print(event.id);
      await _repo.getData(
          id: event.sources,
          sort: Sorts.Everything,
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
          author: '${path['author']}',
          name: '${path['source']['name']}',
          content: '${path['content']}',
          description: '${path['description']}',
          publishedAt: '${path['publishedAt']}',
          title: '${path['title']}',
          urlToImage: '${path['urlToImage']}',
        ));
      }
      yield NewsDone(data: posts);
    } else if (event is Sources) {
      yield NewsLoading();
      await _repo.getData(
          sort: Sorts.Sources,
          language: event.language.toString(),
          country: event.country.toString(),
          category: event.category.toString().toLowerCase());
      final data = _repo.message;
      if (data['status'] == 'error') yield NewsFailure(error: data['message']);
      List<Source> sources = [];
      for (int i = 0; i <= data['sources'].length - 1; i++) {
        var path = data['sources'][i];
        sources.add(Source(
          id: '${path['id']}',
          name: '${path['name']}',
          description: '${path['description']}',
          url: '${path['url']}',
          category: '${path['category']}',
        ));
      }
      yield NewsDone(data: sources);
    }
  }
}
