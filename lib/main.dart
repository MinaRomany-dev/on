import 'package:flutter/material.dart';
import 'package:globaltimes/routes/generate_route.dart';
import 'package:globaltimes/routes/routes.dart';

void main() {
  runApp(const GlobalTimes());
}

class GlobalTimes extends StatelessWidget {
  const GlobalTimes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          
      ),
      
      debugShowCheckedModeBanner: false,
      onGenerateRoute: GenerateRoute.getRoute,
      initialRoute: Routes.home,
    );
  }
}
