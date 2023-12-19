import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:route_nuews23/models/category_model.dart';
import 'package:route_nuews23/models/source_model.dart';
import 'package:route_nuews23/services/news_service.dart';
import 'package:route_nuews23/views/news_view.dart';

class NewsCategory extends StatelessWidget {
  CategoryModel model;
  int index;
  // SourcesModel sourcesModel;
  NewsCategory({
    super.key,
    required this.model,
    // required this.sourcesModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsView(
              categoryModel: model,
              // sourcesModel: sourcesModel,
            ),
          ),
        );
        // NewsService(Dio()).getItemNews(model.name);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: index % 2 == 0
                  ? const Radius.circular(12)
                  : const Radius.circular(0),
              topRight: index % 2 != 0
                  ? const Radius.circular(12)
                  : const Radius.circular(0),
            ),
            image: DecorationImage(
              image: AssetImage(model.imageUrl),
              fit: BoxFit.cover,
            )),
        child: Center(
            child: Text(
          model.name,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
