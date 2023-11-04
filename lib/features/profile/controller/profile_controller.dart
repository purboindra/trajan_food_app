import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trajan_food_app/route/route_name.dart';

class ProfileController extends GetxController {
  final List<Map<String, dynamic>> accountFeatureList = [
    {
      'icon': 'assets/icons/profile_history_check_icon.png',
      'label': 'Check History Order'
    },
    {'icon': 'assets/icons/profile_payment_icon.png', 'label': 'Payment'},
    {'icon': 'assets/icons/profile_voucher_icon.png', 'label': 'My Vouchers'},
    {
      'icon': 'assets/icons/profile_promo_icon.png',
      'label': 'Input Promo Code'
    },
    {'icon': 'assets/icons/profile_notif_icon.png', 'label': 'Notifications'},
    {
      'icon': 'assets/icons/profile_faq_icon.png',
      'label': 'Frequently Asked Question'
    },
  ];

  Future<void> singOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await FirebaseAuth.instance.signOut();
      await prefs.clear();
      Get.offAllNamed(RouteName.signUpScreen);
    } catch (e) {
      log('ERROR FROM SIGN OUT $e');
    }
  }
}
