import 'package:ariana/model/category.dart';
import 'package:ariana/model/news.dart';
import 'package:ariana/state/news_state.dart';
import 'package:dio/dio.dart';

class NewsRepository {
  static Future<NewsState> fetch(int page, int category) async {
    try {
      var res = await Dio().get(
          'https://ariananews.af/wp-json/wp/v2/posts?page=$page&categories=$category&per_page=5');
      return NewsState.success(
          news: (res.data as List).map((e) => News.fromMap(e)).toList(),
          count: int.parse((res.headers['x-wp-total'] as List)[0]),
          totalPage: int.parse((res.headers['x-wp-totalpages'] as List)[0]),
          page: page);
    } catch (e) {
      return NewsState.error();
    }
  }

  static Future<List<Category>> fetchCategories() async {
    try {
      var res = await Dio()
          .get('https://ariananews.af/wp-json/wp/v2/categories?per_page=5');
      return (res.data as List).map((e) => Category.fromMap(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
