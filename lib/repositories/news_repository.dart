import 'package:ariana/model/news.dart';
import 'package:ariana/state/news_state.dart';
import 'package:dio/dio.dart';

class NewsRepository {
  static Future<NewsState> fetch(int page) async {
    try {
      var res = await Dio().get(
          'https://ariananews.af/wp-json/wp/v2/posts?page=$page&per_page=5');
      return NewsState.success(
          news: (res.data as List).map((e) => News.fromMap(e)).toList(),
          page: int.parse((res.headers['x-wp-total'] as List)[0]),
          totalPage: int.parse((res.headers['x-wp-totalpages'] as List)[0]),
          count: page);
    } catch (e) {
      return NewsState.error();
    }
  }
}
