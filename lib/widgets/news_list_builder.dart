import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:route_nuews23/models/news_model.dart';
import 'package:route_nuews23/models/source_model.dart';
import 'package:route_nuews23/services/news_service.dart';
import 'package:route_nuews23/widgets/news_item.dart';
import 'package:route_nuews23/widgets/news_list.dart';

class NewsListBuilder extends StatefulWidget {
  final String categoryName;
  String? source;
  NewsListBuilder({
    super.key,
    required this.categoryName,
  });
  @override
  State<NewsListBuilder> createState() => _NewsListState();
}

class _NewsListState extends State<NewsListBuilder> {
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getItemNews(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsItemModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsList(
              list: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
                child: Dialog(child: Center(child: Text("There is an Error"))));
          } else {
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
