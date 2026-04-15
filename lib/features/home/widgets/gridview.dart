import 'package:flutter/material.dart';
import 'package:globaltimes/core/apptheme.dart';
import 'package:globaltimes/features/home/models/categorymodel.dart';
import 'package:globaltimes/features/home/widgets/categoryitem.dart';

class Gridview_Items extends StatelessWidget {
  Gridview_Items({required this.selected});

  void Function(Categorymodel cat)  selected;

  final categories = [
    Categorymodel(
        id: 'sports',
        name: 'sports',
        imagename: 'sports',
        color: const Color.fromARGB(255, 242, 26, 11)),
    Categorymodel(
        id: 'science',
        name: 'science',
        imagename: 'science',
        color: const Color.fromARGB(255, 242, 26, 11)),
    Categorymodel(
        id: 'sports',
        name: 'health',
        imagename: 'health',
        color: const Color.fromARGB(255, 242, 26, 11)),
    Categorymodel(
        id: 'sports',
        name: 'Politics',
        imagename: 'Politics',
        color: const Color.fromARGB(255, 242, 26, 11)),
    Categorymodel(
        id: 'sports',
        name: 'environment',
        imagename: 'environment',
        color: const Color.fromARGB(255, 242, 26, 11)),
    Categorymodel(
        id: 'sports',
        name: 'bussines',
        imagename: 'bussines',
        color: const Color.fromARGB(255, 242, 26, 11)),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pick your category',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge?.copyWith(color: Apptheme.grey)
                        ),
                Text(
                  'of interests',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Apptheme.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: (){
                    selected(categories[index]);
                  },
                  child: CategoryItem(
                      //  onselect: (){},
                      cats: categories[index],
                      index: index),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    crossAxisCount: 2)),
          ),
        ],
      ),
    );
  }
}
