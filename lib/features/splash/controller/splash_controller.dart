import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
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
    if (await isLoggedIn()) {
      Get.offAllNamed(RouteName.mainScreen);
    } else {
      Get.offAllNamed(RouteName.onboardingScreen);
    }
  }

  @override
  void onInit() {
    super.onInit();
    handleRoute();
  }
}
