import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:trajan_food_app/route/route_name.dart';
import 'package:trajan_food_app/route/route_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RoutePages().routes,
      initialRoute: RouteName.onboardingScreen,
    );
  }
}
