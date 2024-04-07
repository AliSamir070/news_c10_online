import 'package:flutter/material.dart';
import 'package:news_c10_online/model/news_response/Article.dart';
import 'package:news_c10_online/ui/home/home_screen.dart';
import 'package:news_c10_online/ui/home/search_view.dart';

import '../ui/artical_details_view/artical_details_view.dart';

class Routes{
  static const String home = '/';
  static const String articalDetails = '/articalDetails';
  static const String searchView = '/searchView';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );

      case articalDetails:
        var article = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => ArticalDetailsView(article: article as Article,),
        );

      case searchView:
        return MaterialPageRoute(
          builder: (context) => const SearchView(),
        );

    }
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Text('no route defined'),
      ),
    );
  }
}