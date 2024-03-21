import 'package:flutter/material.dart';
import 'package:news_c10_online/model/news_model.dart';

class ArticleWidget extends StatelessWidget {
  NewsModel news;
  ArticleWidget({Key? key,required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(
            news.image,
            width: double.infinity,
            fit: BoxFit.cover,
            height: height*0.25,
          ),
        ),
        Text(
          news.source,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14
          ),
        ),
        Text(
          news.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            news.date,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 14
            ),
          ),
        ),
      ],
    );
  }
}
