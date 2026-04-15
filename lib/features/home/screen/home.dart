import 'package:flutter/material.dart';
import 'package:globaltimes/features/home/models/categorymodel.dart';
import 'package:globaltimes/features/home/screen/details_category.dart';
import 'package:globaltimes/features/home/widgets/customdrawer.dart';
import 'package:globaltimes/features/home/widgets/gridview.dart';
import 'package:globaltimes/features/settings/settingscreen.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  screen currentscreen = screen.category;
  Categorymodel? currencategory_selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
          drawer: CustomDrawer(pressed: check),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: currencategory_selected != null
                ? Text(currencategory_selected!.name)
                : Text('Global Times',style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.green,
          ),
          //body
          body: currencategory_selected != null
              ? detailsCategory(name: currencategory_selected!.id)
              : currentscreen == screen.category
                  ? Gridview_Items(
                      selected: onselected,
                    )
                  : settingsscreen()),
    );
  }

  void check(screen s) {
    currentscreen = s;
    currencategory_selected = null;
    Navigator.of(context).pop();
    setState(() {});
  }

  void onselected(Categorymodel cat) {
    currencategory_selected = cat;
    setState(() {});
  }
}
