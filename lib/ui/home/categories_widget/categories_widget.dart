import 'package:flutter/material.dart';
import 'package:news_c10_online/model/category_model.dart';
import 'package:news_c10_online/ui/home/categories_widget/category_item.dart';

typedef onCategoryClick = void Function(CategoryModel categoryModel);
class CategoriesWidget extends StatelessWidget {
  onCategoryClick categoryClick;
  CategoriesWidget({Key? key,required this.categoryClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pick your category \nof interest",style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xff4F5A69)
          ),),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 25
            
                ),
                itemBuilder: (context , index)=>InkWell(
                  onTap: (){
                    categoryClick(CategoryModel.categories[index]);
                  },
                  child: CategoryItem(
                      categoryModel: CategoryModel.categories[index],
                      index: index
                  ),
                ),
                itemCount: CategoryModel.categories.length,
            ),
          )
        ],
      ),
    );
  }
}
