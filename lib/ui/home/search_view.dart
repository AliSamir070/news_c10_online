import 'package:flutter/material.dart';
import 'package:news_c10_online/model/news_response/NewsResponse.dart';
import 'package:news_c10_online/shared/api/api_manager.dart';
import 'package:news_c10_online/shared/routes.dart';
import 'package:news_c10_online/ui/category_details/article_widget.dart';


class SearchView extends StatefulWidget {
  const SearchView({super.key});



  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  NewsResponse news = NewsResponse();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(
                top: 60.0,
                left: 20.0,
                right: 20.0,
                bottom: 8.0,
            ),
            child: TextField(
              controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.4)),
                  suffixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                  prefixIcon: IconButton(onPressed: (){
                    news = NewsResponse();
                    controller.clear();
                    setState(() {
                    });
                  },icon: Icon(Icons.close, color: Theme.of(context).primaryColor)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
                onSubmitted: (value) {
                },
                onChanged: (value) async {
                  print(value);
                  news =  await ApiManager.getNewsBySearch(value);
                  setState(() {
                  });
                }
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(12),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
          ),
          child: ListView.builder(
            itemCount: news.totalResults ?? 0,
            itemBuilder: (context, index){
              return GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.articalDetails,arguments: news.articles![index]);
                  },
                  child: ArticleWidget(news: news.articles![index]));
            },
          ),
        ),
      ),
    );
  }
}
