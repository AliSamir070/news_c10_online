import 'package:flutter/material.dart';

typedef onMenuItemClick = void Function(MenuItem item);
class HomeDrawer extends StatelessWidget {
  onMenuItemClick itemClick;
  HomeDrawer({Key? key,required this.itemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 40
            ),
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            alignment: Alignment.center,
            child: Text(
              "News App!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              itemClick(MenuItem.Categories);
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(width: 10,),
                Text("Categories",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              itemClick(MenuItem.Settings);
            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(width: 10,),
                Text("Settings",style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
enum MenuItem{
  Categories,
  Settings
}
