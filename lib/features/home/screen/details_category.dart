  import 'package:flutter/material.dart';

  class detailsCategory extends StatelessWidget {
    final String name;
    const detailsCategory({
      required this.name,
    });

    @override
    Widget build(BuildContext context) {
      return DefaultTabController(
        length: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabBar(tabs: [
                Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            color:  Colors.green ,
            borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
           'data',
            style: TextStyle(
                color:
                     Colors.white ),
          ),
        )),
                  Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            color:  Colors.green ,
            borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
           'data',
            style: TextStyle(
                color:
                     Colors.white ),
          ),
        )),  Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            color:  Colors.green ,
            borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
           'data',
            style: TextStyle(
                color:
                     Colors.white ),
          ),
        )),  Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            color:  Colors.green ,
            borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
           'data',
            style: TextStyle(
                color:
                     Colors.white ),
          ),
        )),
        
            ]),
            Expanded(
              
              child: TabBarView(
                
                children: [
                 Center(child: Text("1"),),
                 Center(child: Text("2"),),
                 Center(child: Text("3"),),
                 Center(child: Text("4"),),
              ]),
            ),
            Center(child: Text(name)),
          ],
        ),
      );
    }
  }
