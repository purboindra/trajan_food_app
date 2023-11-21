import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trajan_food_app/features/controller/auth_controller.dart';
import 'package:trajan_food_app/route/route_name.dart';

class SplashController extends GetxController {
  final RxBool _isLoading = false.obs;

  Future<bool> isLoggedIn() async {
    _isLoading.value = true;
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('ERROR FROM IS LOGGED IN $e');
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  void handleRoute() async {
    final prefs = await SharedPreferences.getInstance();
    if ((prefs.getBool("hasOnboard") ?? false) && !await isLoggedIn()) {
      Get.put(AuthController());
      Get.offAllNamed(RouteName.signInScreen);
    } else if (await isLoggedIn()) {
      // home screen
      Get.offAllNamed(RouteName.mainScreen);
    } else {
      // STATE KETIKA USER PERTAMA KALI INSTALL
      Get.offAllNamed(RouteName.onboardingScreen);
    }
  }

  @override
  void onInit() {
    super.onInit();
    // fungsi ini akan terpanggil pertama kali ketika splash controller terpanggil
    handleRoute();
  }
}
