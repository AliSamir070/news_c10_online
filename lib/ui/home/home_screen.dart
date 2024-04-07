import 'package:flutter/material.dart';
import 'package:news_c10_online/model/category_model.dart';
import 'package:news_c10_online/model/news_response/NewsResponse.dart';
import 'package:news_c10_online/shared/api/api_manager.dart';
import 'package:news_c10_online/shared/routes.dart';
import 'package:news_c10_online/ui/category_details/article_widget.dart';
import 'package:news_c10_online/ui/category_details/category_details.dart';
import 'package:news_c10_online/ui/home/categories_widget/categories_widget.dart';
import 'package:news_c10_online/ui/home/settings_widget/settings_widget.dart';

import 'home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    selectedWidget = CategoriesWidget(
      categoryClick: onCategoryItemClick,
    );
  }
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
          drawer: HomeDrawer(
            itemClick: onMenuItemClick,
          ),
          appBar:AppBar(
            title: const Text("News App"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.searchView);
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: selectedWidget,
        ));
  }

  late Widget selectedWidget;



  void onMenuItemClick(MenuItem item){
    switch(item){
      case MenuItem.Categories:{
        Navigator.pop(context);
        selectedWidget = CategoriesWidget(categoryClick: onCategoryItemClick,);
        setState((){});
      }
        break;
      case MenuItem.Settings:{
        Navigator.pop(context);
        selectedWidget = const SettingsWidget();
        setState((){});
      }
        break;

    }
  }

  void onCategoryItemClick(CategoryModel categoryModel){
    selectedWidget = CategoryDetails(category: categoryModel);
    setState(() {
    });
  }
}
