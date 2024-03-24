import 'package:flutter/material.dart';
import 'package:news_c10_online/shared/api/api_manager.dart';
import 'package:news_c10_online/ui/category_details/news_list_widget.dart';

import '../../model/category_model.dart';
import '../../shared/reusable_components/source_tab_item.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;
  CategoryDetails({Key? key,required this.category}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.category.id),
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
          var sources = snapshot.data?.sources??[];
          return DefaultTabController(
            length: sources.length,
            initialIndex: selectedIndex,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TabBar(
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      unselectedLabelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                      ),
                      onTap: (index){
                        selectedIndex = index;
                        setState(() {

                        });
                      },
                      labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor
                      ),
                      tabs: sources.map((source){
                        return SourceTabItem(
                          source: source,
                          isSelected: selectedIndex==sources.indexOf(source),
                        );
                      }).toList()
                  ),
                  NewsListWidget(source: sources[selectedIndex],)
                ],
              ),
            ),
          );
        }
    );
  }
}
