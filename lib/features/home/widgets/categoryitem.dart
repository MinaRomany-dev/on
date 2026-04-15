import 'package:flutter/material.dart';
import 'package:globaltimes/features/home/models/categorymodel.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  Categorymodel cats;
  // void Function(Categorymodel) onselect;
  CategoryItem({
    required this.index,
 //   required this.onselect,
    required this.cats
  });
 
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          color: cats.color,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(25),
            topEnd: Radius.circular(25),
            bottomEnd: index.isOdd ? Radius.circular(25) : Radius.circular(0),
            bottomStart: Radius.circular(index.isEven ? 25 : 0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/${cats.imagename}.png"),
            Text(
              cats.name,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
    
  }
}
