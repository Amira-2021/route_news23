import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:route_nuews23/models/category_model.dart';
import 'package:route_nuews23/models/source_model.dart';
import 'package:route_nuews23/services/news_service.dart';
import 'package:route_nuews23/widgets/sources_list.dart';

class SourcesListBuilder extends StatefulWidget {
  final CategoryModel model;

  const SourcesListBuilder({super.key, required this.model});
  @override
  _SourcesListBuilderState createState() => _SourcesListBuilderState();
}

class _SourcesListBuilderState extends State<SourcesListBuilder> {
  late var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getSources(widget.model.name);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SourcesModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SourcesList(
              sourceName: snapshot.data!,
              model: widget.model,
            );
          } else if (snapshot.hasError) {
            return const Dialog(
              child: Text("Has Error"),
            );
          } else {
            return Center(
              child: Container(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
