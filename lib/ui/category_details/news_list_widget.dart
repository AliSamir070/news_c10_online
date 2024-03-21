import 'package:flutter/material.dart';

import '../../model/news_model.dart';
import 'article_widget.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({Key? key}) : super(key: key);
  static List<NewsModel> newsList = [
    NewsModel(title: "Why are football's biggest clubs starting a newtournament?", source: "BBC News", date: DateTime.now().toString(), image: "assets/images/article.png"),
    NewsModel(title: "Why are football's biggest clubs starting a newtournament?", source: "BBC News", date: DateTime.now().toString(), image: "assets/images/article.png"),
    NewsModel(title: "Why are football's biggest clubs starting a newtournament?", source: "BBC News", date: DateTime.now().toString(), image: "assets/images/article.png"),
    NewsModel(title: "Why are football's biggest clubs starting a newtournament?", source: "BBC News", date: DateTime.now().toString(), image: "assets/images/article.png"),
    NewsModel(title: "Why are football's biggest clubs starting a newtournament?", source: "BBC News", date: DateTime.now().toString(), image: "assets/images/article.png"),
    NewsModel(title: "Why are football's biggest clubs starting a newtournament?", source: "BBC News", date: DateTime.now().toString(), image: "assets/images/article.png"),

  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder:(context ,index)=>ArticleWidget(
            news:newsList[index] ,
          ),
          separatorBuilder: (context , index)=>SizedBox(height: 10,),
          itemCount: newsList.length
      ),
    );
  }
}
