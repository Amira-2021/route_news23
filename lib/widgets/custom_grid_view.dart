import 'package:flutter/material.dart';
import 'package:route_nuews23/models/category_model.dart';
import 'package:route_nuews23/models/source_model.dart';
import 'package:route_nuews23/widgets/news_category.dart';

class CustomGridView extends StatelessWidget {
  List<CategoryModel> list = [
    CategoryModel(imageUrl: "assets/img/business.jpg", name: "Business"),
    CategoryModel(imageUrl: "assets/img/sport.jpeg", name: "Sports"),
    CategoryModel(imageUrl: "assets/img/science.jpeg", name: "Science"),
    CategoryModel(imageUrl: "assets/img/health.jpg", name: "Health"),
    CategoryModel(
        imageUrl: "assets/img/entertainment.jpg", name: "Entertainment"),
    CategoryModel(imageUrl: "assets/img/general.jpg", name: "General"),
  ];

  CustomGridView({super.key});
  List<SourcesModel> source = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 200,
            childAspectRatio: 6 / 7),
        itemCount: 6,
        itemBuilder: (context, index) => NewsCategory(
          model: list[index],
          index: index,
        ),
      ),
    );
  }
}
