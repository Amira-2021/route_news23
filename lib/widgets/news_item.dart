import 'package:flutter/material.dart';
import 'package:route_nuews23/models/news_model.dart';
import 'package:route_nuews23/models/source_model.dart';
import 'package:route_nuews23/views/news_web_view.dart';

class NewsItem extends StatelessWidget {
  final NewsItemModel model;

  NewsItem({
    super.key,
    required this.model,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsWebView(url: model.url),
            ),
          );
        },
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(model.imageUrl ??
                          "https://thumbs.dreamstime.com/z/hand-holding-light-bulb-business-digital-marketing-innovation-technology-icons-network-hand-holding-light-bulb-business-138534565.jpg"),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              model.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              model.subTitle ?? "remove content",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
