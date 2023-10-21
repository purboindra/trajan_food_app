import 'package:get/get.dart';
import 'package:trajan_food_app/route/route_name.dart';
import 'package:trajan_food_app/services/location_service.dart';

class OnboardingController extends GetxController {
  final imagesOnboarding = [
    'assets/images/image_onboarding_1.png',
    'assets/images/image_onboarding_2.png',
    'assets/images/image_onboarding_3.png',
  ];

  RxInt indexImage = 0.obs;

  void handleGetStared() async {
    final location = await LocationService.getCurrentPosition();
    if (location != null) {
      Get.offAllNamed(RouteName.signUpScreen);
    } else {
      return;
    }
  }
}
