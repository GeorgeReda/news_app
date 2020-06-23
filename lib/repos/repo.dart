import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:news_app/blocs/news_bloc/news_bloc.dart';

class Repo {
  static const String URL = 'https://newsapi.org/v2';
  static const String API_KEY = 'bd81f6fb8d3d4f6cbc9ee47fccc5d0f2';
  var message;
  int count;
  int total;
  Future getData(
      {@required Sorts sort,
      String id,
      String category,
      String language,
      String country,
      String query,
      String from,
      String to,
      String sortBy,
      int page,
      int pageSize}) async {
    Map<String, dynamic> _queryParams = Map<String, dynamic>();
    String url;

    // define [URL]
    if (sort == Sorts.TopHeadlines)
      url = '$URL/top-headlines';
    else if (sort == Sorts.Everything)
      url = '$URL/everything';
    else if (sort == Sorts.Sources) url = '$URL/sources';

    // define query parameters
    if (sort == Sorts.TopHeadlines || sort == Sorts.Everything) {
      if (query != null) _queryParams["q"] = "$query";
      if (pageSize == null)
        _queryParams["pageSize"] = 20;
      else
        _queryParams["pageSize"] = "$pageSize";
      if (page == null)
        _queryParams["page"] = 0;
      else
        _queryParams["page"] = "$page";
    }
    if (sort == Sorts.TopHeadlines || sort == Sorts.Sources) {
      if (country == 'null' || category == 'null')
        _queryParams["country"] = 'us';
      else
        _queryParams["country"] = "$country";
      if (category != 'null')
        _queryParams["category"] = "${category.substring(11)}";
    }
    if (sort == Sorts.Everything || sort == Sorts.Sources) {
      if (language == 'null' && category == 'null')
        _queryParams["language"] = 'en';
      else
        _queryParams["language"] = "$language";
    }
    if (sort == Sorts.Everything) {
      if (from != null) _queryParams["from"] = "$from";
      if (from != null) _queryParams["to"] = "$to";
      if (sortBy != null) _queryParams["SortBy"] = "$sortBy";
    }
    if (sort == Sorts.TopHeadlines || sort == Sorts.Everything)
      _queryParams["id"] = '$id';

    Dio _dio = Dio();
    try {
      await _dio
          .get(url,
              queryParameters: _queryParams,
              options: Options(headers: {"X-Api-Key": "$API_KEY"}))
          .then((value) {
        message = value.data;
        return;
      }).catchError((e) {
        message = e;
        return;
      });
    } catch (e) {
      message = e;
      return e;
    }
  }
}
