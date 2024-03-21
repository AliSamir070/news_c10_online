import 'package:flutter/material.dart';

class SourceTabItem extends StatelessWidget {
  bool isSelected;
  String source;
  SourceTabItem({Key? key,required this.source , required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2
        ),
        color:isSelected
            ?Theme.of(context).colorScheme.primary
            :Colors.transparent
      ),
      child: Text(
        source,
        style: TextStyle(
          fontSize: 18,
          color: isSelected
              ?Colors.white
              :Theme.of(context).colorScheme.primary
        ),
      ),
    );
  }
}
