import 'package:flutter/material.dart';
import 'package:route_nuews23/models/category_model.dart';
import 'package:route_nuews23/models/source_model.dart';
import 'package:route_nuews23/widgets/source_item.dart';

class SourcesList extends StatefulWidget {
  List<SourcesModel> sourceName;
  CategoryModel model;
  SourcesList({
    super.key,
    required this.sourceName,
   required this.model
  });

  @override
  State<SourcesList> createState() => _SourcesListState();
}

class _SourcesListState extends State<SourcesList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: ListView.separated(
              itemCount: widget.sourceName.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SourceItem(
                    sourcesModel: widget.sourceName[index],
                    model: widget.model,
                    isSelect: false,
                    index: index,
                  ),
              separatorBuilder: (context, index) => Container(
                    width: 5,
                    color: Colors.white,
                  ))),
    );
  }
}
