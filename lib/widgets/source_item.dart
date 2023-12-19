import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_nuews23/models/category_model.dart';
import 'package:route_nuews23/models/source_model.dart';
import 'package:route_nuews23/views/news_view.dart';
import 'package:route_nuews23/views/view_final.dart';
import 'package:route_nuews23/widgets/news_list_builder.dart';

class SourceItem extends StatefulWidget {
  final SourcesModel sourcesModel;
  final CategoryModel model;
  bool isSelect;
  int index;
  SourceItem(
      {super.key,
      required this.isSelect,
      required this.sourcesModel,
      required this.model,
      required this.index});

  @override
  State<SourceItem> createState() => _SourceItemState();
}

class _SourceItemState extends State<SourceItem> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = -1;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewFinal(
                      sourceName: widget.sourcesModel.sourceName,
                    )));
        print(widget.sourcesModel.sourceName);
        setState(() {
          currentIndex = widget.index;
          widget.isSelect = widget.isSelect ? false : true;
        });
      },
      child: Container(
        width: 130,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: widget.isSelect ? Colors.white : Colors.teal.shade400,
          ),
          color: widget.isSelect ? Colors.teal.shade400 : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            widget.sourcesModel.sourceName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: widget.isSelect ? Colors.white : Colors.teal.shade400,
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}
