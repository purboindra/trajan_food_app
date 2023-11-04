import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';
import 'package:trajan_food_app/features/favourite/screen/favourite_screen.dart';
import 'package:trajan_food_app/features/home/screen/home_screen.dart';
import 'package:trajan_food_app/features/profile/screen/profile_screen.dart';
import 'package:trajan_food_app/features/promo/screen/promo_screen.dart';

class MainController extends GetxController {
  final RxInt _indexBottomNavbar = 0.obs;
  RxInt get indexBottomNavbar => _indexBottomNavbar;

  void changeIndex(int val) {
    _indexBottomNavbar.value = val;
  }

  final List<BottomNavigationBarItem> listBottomNav = [
    BottomNavigationBarItem(
      backgroundColor: cardColor,
      label: '',
      activeIcon: Container(
        height: 28,
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            ClipOval(
              child: Container(
                width: 5,
                height: 5,
                color: whiteColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Home',
              style: ConstantTextStyle.stylePoppins(color: whiteColor),
            )
          ],
        ),
      ),
      icon: Container(
        margin: const EdgeInsets.only(top: 10),
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/home_icon.png'),
          ),
        ),
      ),
    ),
    BottomNavigationBarItem(
      label: '',
      activeIcon: Container(
        height: 28,
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            ClipOval(
              child: Container(
                width: 5,
                height: 5,
                color: whiteColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Promo',
              style: ConstantTextStyle.stylePoppins(color: whiteColor),
            )
          ],
        ),
      ),
      icon: Container(
        margin: const EdgeInsets.only(top: 10),
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/promo_icon.png'),
          ),
        ),
      ),
    ),
    BottomNavigationBarItem(
      label: '',
      activeIcon: Container(
        height: 28,
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            ClipOval(
              child: Container(
                width: 5,
                height: 5,
                color: whiteColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Favourite',
              style: ConstantTextStyle.stylePoppins(color: whiteColor),
            )
          ],
        ),
      ),
      icon: Container(
        margin: const EdgeInsets.only(top: 10),
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/favourite_icon.png'),
          ),
        ),
      ),
    ),
    BottomNavigationBarItem(
      label: '',
      activeIcon: Container(
        height: 28,
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            ClipOval(
              child: Container(
                width: 5,
                height: 5,
                color: whiteColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Person',
              style: ConstantTextStyle.stylePoppins(color: whiteColor),
            )
          ],
        ),
      ),
      icon: Container(
        margin: const EdgeInsets.only(top: 10),
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/person_icon.png'),
          ),
        ),
      ),
    ),
  ];

  final List<Widget> bodyMain = [
    HomeScreen(),
    PromoScreen(),
    FavouriteScreen(),
    PersonScreen(),
  ];

  Future<void> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('user');
    print('USER FROM PREFS $user');
    FirebaseAuth.instance.currentUser;
  }

  @override
  void onInit() async {
    await getCurrentUser();
    super.onInit();
  }
}
