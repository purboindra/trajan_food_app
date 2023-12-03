import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trajan_food_app/route/route_name.dart';
import 'package:trajan_food_app/services/location_service.dart';

class OnboardingController extends GetxController {
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final imagesOnboarding = [
    'assets/images/image_onboarding_1.png',
    'assets/images/image_onboarding_2.png',
    'assets/images/image_onboarding_3.png',
  ];

  RxInt indexImage = 0.obs;
  AndroidNotificationDetails androidPlatformChannelSpecifics =
      const AndroidNotificationDetails(
          '1', 'trajan_notif' //Required for Android 8.0 or after
          );

  void handleGetStared() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoading.value = true;
    final location = await LocationService.getCurrentPosition();
    _isLoading.value = false;
    if (location != null) {
      Get.offAllNamed(RouteName.signUpScreen);
    }
    prefs.setBool("hasOnboard", true);
  }
}
