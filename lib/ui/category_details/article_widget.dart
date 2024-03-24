import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_c10_online/model/news_response/Article.dart';

class ArticleWidget extends StatelessWidget {
  Article news;

  ArticleWidget({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              width: double.infinity,
              fit: BoxFit.cover,
              height: height * 0.25,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
        Text(
          news.source?.name ?? "",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        Text(
          news.title ?? "",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            news.publishedAt ?? "",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
