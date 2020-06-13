import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class Repo {
  static const String URL = 'https://newsapi.org/v2';
  static const String API_KEY = 'bd81f6fb8d3d4f6cbc9ee47fccc5d0f2';
  var message;
//   final String sort,category,language,country,query,;
  getData(
      {@required String sort,
      String category,
      String language = 'ar',
      String country = 'eg',
      String query,
      String from,
      String to,
      String sortBy,
      int page,
      int pageSize = 20}) {
    Map<String, dynamic> _queryParams = Map<String, dynamic>();
    String url;

    // define [URL]
    if (sort == 'topHeadlines')
      url = '$URL/top-headlines';
    else if (sort == 'everything')
      url = '$URL/everything';
    else if (sort == '') url = '$URL/';

    // define query parameters
    if (sort == 'topHeadlines' || sort == 'everything') {
      if (query != null) _queryParams["q"] = "$query";
      _queryParams["pageSize"] = pageSize;
      _queryParams["page"] = page;
    }
    if (sort == 'topHeadlines' || sort == 'sources') {
      _queryParams["country"] = "$country";
      if (category != null) _queryParams["category"] = "$category";
    }
    if (sort == 'everything' || sort == 'sources')
      _queryParams["language"] = "$language";
    if (sort == 'everything') {
      if (from != null) _queryParams["from"] = "$from";
      if (from != null) _queryParams["to"] = "$to";
      if (sortBy != null) _queryParams["SortBy"] = "$sortBy";
    }

    Dio _dio = Dio();
    try {
      _dio
          .get(url,
              queryParameters: _queryParams,
              options: Options(headers: {"X-Api-Key": "$API_KEY"}))
          .then((value) {
        print(value);
        print(value.data);
        message = value.data;
        return;
      }).catchError((e) {
        message = e;
        return;
      });
    } catch (e) {
      print(e);
      message = e;
      return;
    }
  }
}
