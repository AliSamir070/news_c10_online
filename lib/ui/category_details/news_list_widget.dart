import 'package:flutter/material.dart';
import 'package:news_c10_online/shared/api/api_manager.dart';

import '../../model/sources_response/Source.dart';
import 'article_widget.dart';

class NewsListWidget extends StatelessWidget {
  Source source;
  NewsListWidget({Key? key,required this.source}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: ApiManager.getNews(source.id!),
        builder: (context , snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError || snapshot.data?.status == "error"){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data?.message??snapshot.error.toString()),
                ElevatedButton(onPressed: (){}, child: Text("Try again"))
              ],
            );
          }
          var articles = snapshot.data?.articles??[];
          return ListView.separated(
              itemBuilder: (context , index)=>ArticleWidget(news: articles[index]),
              separatorBuilder: (context , index)=>SizedBox(height: 20,),
              itemCount: articles.length
          );
        },
      ),
    );
  }
}
