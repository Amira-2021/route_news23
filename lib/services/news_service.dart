import 'package:dio/dio.dart';
import 'package:route_nuews23/models/news_model.dart';
import 'package:route_nuews23/models/source_model.dart';

class NewsService {
  final Dio dio = Dio();
  NewsService(dio);
  String apiKey = "a3fc5a8e7cde4d22abd94356c4dad029";
  String url = "https://newsapi.org/v2/top-headlines";

  Future<List<NewsItemModel>> getItemNews(String category,
      [String sources = "BBC News"]) async {
    try {
      var response =
          await dio.get("$url?country=us&apiKey=$apiKey&category=$category");
      List<dynamic> articles = response.data["articles"];
      List<NewsItemModel> listOfObject = [];
      for (var article in articles) {
        NewsItemModel model = NewsItemModel.fromJson(article);
        listOfObject.add(model);
      }
      return listOfObject;
    } catch (error) {
      print("There ia an error in news $error");
      return [];
    }
  }

  Future<List<NewsItemModel>> getNewsWithSource(String sources) async {
    try {
      var response = await dio.get("${url}?sources=$sources&apiKey=$apiKey");
      List<dynamic> articles = response.data["articles"];
      List<NewsItemModel> listOfObject = [];
      for (var article in articles) {
        NewsItemModel model = NewsItemModel.fromJson(article);
        listOfObject.add(model);
      }
      print(listOfObject.length);
      return listOfObject;
    } catch (error) {
      print("There ia an error in news $error");
      return [];
    }
  }

  Future<List<SourcesModel>> getSources(String category) async {
    try {
      var response =
          await dio.get("$url/sources?apiKey=$apiKey&category=$category");
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> listOfMap = jsonData["sources"];
      List<SourcesModel> lisOfObject = [];
      for (var sources in listOfMap) {
        SourcesModel objectList = SourcesModel.fromJson(sources);
        lisOfObject.add(objectList);
      }
      return lisOfObject;
    } catch (e) {
      print("There is an error in source $e");
      return [];
    }
  }
}
