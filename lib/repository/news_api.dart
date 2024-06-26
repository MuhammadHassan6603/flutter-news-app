import 'dart:convert';
import '/model/article_model.dart';
import '/repository/abstract_class_ropository.dart';
import 'package:http/http.dart' as http;
import '../model/articles_list_model.dart';

class NewsApi extends ClassRepository {
  var keyApi = "add your api key";

  @override
  Future<List<ArticleModel>> getAllNews() async {
    try {
      var url =
          ("https://newsapi.org/v2/top-headlines?country=us&apiKey=$keyApi");
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesListModel articles = ArticlesListModel.fromMap(jsonData);
        List<ArticleModel> articlesListModel =
            articles.articles!.map((e) => ArticleModel.fromMap(e)).toList();
        return articlesListModel;
      } else {
        print("status code = ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    throw Exception("Exception Thrown");
  }

  @override
  Future<List<ArticleModel>> getCategory(String category) async {
    try {
      var url =
          ("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$keyApi");
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesListModel articles = ArticlesListModel.fromMap(jsonData);
        List<ArticleModel> articlesListModel =
            articles.articles!.map((e) => ArticleModel.fromMap(e)).toList();
        return articlesListModel;
      } else {
        print("status code = ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    throw Exception("Exception Thrown");
  }
}
