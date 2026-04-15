import 'package:flutter/material.dart';
import 'package:globaltimes/features/home/screen/details_category.dart';
import 'package:globaltimes/features/home/screen/home.dart';
import 'package:globaltimes/features/settings/settingscreen.dart';
import 'package:globaltimes/routes/routes.dart';

class GenerateRoute {
  // route means screen 
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => Home(),
        );
        case Routes.settingsscreen:
         return MaterialPageRoute(
          builder: (context) => settingsscreen(),
        );
        case Routes.detailsCategory:
        final String name =settings.arguments as String ;
        return MaterialPageRoute(
          builder: (context) => detailsCategory(name: name,),
        );
    }
    return MaterialPageRoute(
      builder: (context) => Home(),
    );
  }
}
