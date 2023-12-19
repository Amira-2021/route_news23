import 'package:flutter/material.dart';
import 'package:route_nuews23/models/category_model.dart';
import 'package:route_nuews23/models/news_model.dart';
import 'package:route_nuews23/widgets/new_list_with_source.dart';
import 'package:route_nuews23/widgets/news_list_builder.dart';

class ViewFinal extends StatelessWidget {
  final String sourceName;

  const ViewFinal({super.key, required this.sourceName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        elevation: 0,
        title: Text(
          sourceName,
          style: const TextStyle(fontSize: 22),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          NewsListWithSource(source: sourceName),
        ],
      ),
    );
  }
}
