import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/features/main/controller/main_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainController mainC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: mainC.indexBottomNavbar.value,
            onTap: (value) => mainC.changeIndex(value),
            type: BottomNavigationBarType.fixed,
            backgroundColor: cardColor,
            items: mainC.listBottomNav,
          )),
      body: Obx(() => mainC.bodyMain[mainC.indexBottomNavbar.value]),
    );
  }
}
