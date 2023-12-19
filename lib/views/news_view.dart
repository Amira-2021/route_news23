import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:route_nuews23/models/category_model.dart';
import 'package:route_nuews23/models/news_model.dart';
import 'package:route_nuews23/models/source_model.dart';
import 'package:route_nuews23/widgets/news_list.dart';
import 'package:route_nuews23/widgets/news_list_builder.dart';
import 'package:route_nuews23/widgets/sources_list.dart';
import 'package:route_nuews23/widgets/soureces_list_builder.dart';

class NewsView extends StatelessWidget {
  CategoryModel categoryModel;
  NewsItemModel? itemModel;

  NewsView({
    super.key,
    required this.categoryModel,
    // required this.sourcesModel,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        elevation: 0,
        title: Text(
          categoryModel.name,
          style: const TextStyle(fontSize: 22),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: SourcesListBuilder(
            model: categoryModel,
          )),
          NewsListBuilder(
            categoryName: categoryModel.name,
          ),
        ],
      ),
    );
  }
}
