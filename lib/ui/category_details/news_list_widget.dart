import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c10_online/shared/api/api_manager.dart';
import 'package:news_c10_online/ui/category_details/viewModel/CategoriesViewModel.dart';

import '../../model/sources_response/Source.dart';
import 'article_widget.dart';

class NewsListWidget extends StatefulWidget {
  Source source;
  NewsListWidget({Key? key,required this.source}) : super(key: key);

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      context.read<CategoryDetailsViewModel>().getNews(widget.source.id??"");
      // Add Your Code here.

    });

  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CategoryDetailsViewModel , CategoryDetailsStates>(
        builder: (BuildContext context, CategoryDetailsStates state) {
          if(state is NewSuccessState){
            var articles = state.artices;
            return ListView.separated(
                itemBuilder: (context , index)=>ArticleWidget(news: articles[index]),
                separatorBuilder: (context , index)=>SizedBox(height: 20,),
                itemCount: articles.length
            );
          }else if(state is NewsErrorState){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorMessage),
                ElevatedButton(onPressed: (){}, child: Text("Try again"))
              ],
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },

      )/*FutureBuilder(
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
      )*/,
    );
  }
}
