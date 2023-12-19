// class NewsViewModel {
//
//   // final NewsItemModel itemModel;
//
//   NewsViewModel({required this.sources});
//
//   factory NewsViewModel.fromJson(json) {
//     return NewsViewModel(
//       sources: json[""],
//     );
//   }
// }

import 'package:route_nuews23/models/source_model.dart';

class NewsItemModel {
  final String? imageUrl;
  final String title;
  final String? subTitle;
  final String url;
  final String? source;

  NewsItemModel(
      {required this.imageUrl,
      required this.url,
      required this.title,
      required this.subTitle,
      required this.source});
  factory NewsItemModel.fromJson(json) {
    return NewsItemModel(
        imageUrl: json["urlToImage"],
        title: json["title"],
        subTitle: json["description"],
        url: json["url"],
        source: json["source"]["name"]);
  }
}
