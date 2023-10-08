import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';

class AuthController extends GetxController {
  final RxBool _isObsecure = false.obs;
  RxBool get isObsecure => _isObsecure;

  void changeIsObsecure() {
    _isObsecure.value = !_isObsecure.value;
  }

  RxInt idxBottomNavbar = 0.obs;

  void changeIndex(int val) {
    idxBottomNavbar.value = val;
  }

  List<BottomNavigationBarItem> iconList = [
    BottomNavigationBarItem(
        activeIcon: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Text(
                'Home',
                style: ConstantTextStyle.stylePoppins(color: whiteColor),
              ),
              Container(
                width: 3,
                height: 3,
                color: whiteColor,
              ),
            ],
          ),
        ),
        label: '',
        icon: const Icon(
          Icons.home,
          color: whiteColor,
        )),
    BottomNavigationBarItem(
        activeIcon: Column(
          children: [
            Text('Promo',
                style: ConstantTextStyle.stylePoppins(color: whiteColor)),
            const SizedBox(
              height: 3,
            ),
            Container(
              width: 3,
              height: 3,
              color: whiteColor,
            ),
          ],
        ),
        label: '',
        icon: const Icon(
          Icons.discount,
          color: whiteColor,
        )),
    BottomNavigationBarItem(
        activeIcon: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Text('Favorite',
                  style: ConstantTextStyle.stylePoppins(color: whiteColor)),
              const SizedBox(
                height: 3,
              ),
              Container(
                width: 3,
                height: 3,
                color: whiteColor,
              ),
            ],
          ),
        ),
        label: '',
        icon: const Icon(
          Icons.favorite,
          color: whiteColor,
        )),
    BottomNavigationBarItem(
      activeIcon: Container(
        color: greenColor,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text('Person',
                style: ConstantTextStyle.stylePoppins(color: whiteColor)),
            const SizedBox(
              height: 3,
            ),
            Container(
              width: 3,
              height: 3,
              color: whiteColor,
            ),
          ],
        ),
      ),
      label: '',
      icon: Container(
        color: greenColor,
        child: const Icon(
          Icons.person,
          color: whiteColor,
        ),
      ),
    ),
  ];
}
