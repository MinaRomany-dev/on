import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
 const CustomDrawer({required this.pressed});
 final void Function(screen) pressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width * .75,
      child: Column(
       // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            width: double.infinity,
            height: 100,
            color: Colors.green,),
         Expanded(
           child: Container(
             child: Column(
              
              children: [
               InkWell(
                  onTap: () {
                    pressed(screen.setting);
                  },
                  child: Text("Setting")),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    pressed(screen.category);
                  },
                  child: Text("Categories"))
             ],),
           ),
         )
        ],
      ),
    );
  }
}
enum screen { category, setting }
