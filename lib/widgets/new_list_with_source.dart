import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:route_nuews23/models/news_model.dart';
import 'package:route_nuews23/models/source_model.dart';
import 'package:route_nuews23/services/news_service.dart';
import 'package:route_nuews23/widgets/news_item.dart';
import 'package:route_nuews23/widgets/news_list.dart';

class NewsListWithSource extends StatefulWidget {
  final String source;
  const NewsListWithSource({
    super.key,
    required this.source,
  });
  @override
  State<NewsListWithSource> createState() => _NewsListState();
}

class _NewsListState extends State<NewsListWithSource> {
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNewsWithSource(widget.source);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsItemModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.length != 0
                ? NewsList(
                    list: snapshot.data!,
                  )
                : SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            color: Colors.red,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                  );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
                child:
                    Dialog(child: Center(child: Text("There is No Connect"))));
          } else {
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
