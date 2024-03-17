import 'package:flutter/material.dart';
import 'package:news_c10_online/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;
  CategoryItem({Key? key,required this.categoryModel,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(index.isEven?24:0),
          bottomLeft: Radius.circular(index.isEven?0:24)
        )
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/images/${categoryModel.imagePath}",
            height: height*0.1,
            fit: BoxFit.fitHeight,
            width: double.infinity,
          ),
          SizedBox(height: 10,),
          Text(
            categoryModel.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18
            ),
          )
        ],
      ),
    );
  }
}
