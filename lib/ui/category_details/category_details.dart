import 'package:flutter/material.dart';
import 'package:news_c10_online/ui/category_details/news_list_widget.dart';

import '../../model/category_model.dart';
import '../../model/source_model.dart';
import '../../shared/reusable_components/source_tab_item.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;
  CategoryDetails({Key? key,required this.category}) : super(key: key);
  static List<Source> sources = [
    Source(id: "bbc", title: "BBC News"),
    Source(id: "bbc", title: "BBC News"),
    Source(id: "bbc", title: "BBC News"),
    Source(id: "bbc", title: "BBC News"),
    Source(id: "bbc", title: "BBC News"),
    Source(id: "bbc", title: "BBC News"),
    Source(id: "bbc", title: "BBC News"),
  ];

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: CategoryDetails.sources.length,
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
                tabs: CategoryDetails.sources.map((source){
                  return SourceTabItem(
                    source: source.title,
                    isSelected: selectedIndex==CategoryDetails.sources.indexOf(source),
                  );
                }).toList()
            ),
            NewsListWidget()
          ],
        ),
      ),
    );
  }
}
