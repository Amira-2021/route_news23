import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:route_nuews23/models/news_model.dart';
import 'package:route_nuews23/models/source_model.dart';
import 'package:route_nuews23/widgets/news_item.dart';

class NewsList extends StatelessWidget {
  final List<NewsItemModel> list;

  NewsList({
    super.key,
    required this.list,
  });
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => NewsItem(
                model: list[index],
              ),
          childCount: list.length),
    );
  }
}
