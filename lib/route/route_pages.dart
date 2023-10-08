import 'package:get/get.dart';
import 'package:trajan_food_app/features/main/bindings/main_binding.dart';
import 'package:trajan_food_app/features/main/screen/main_screen.dart';
import 'package:trajan_food_app/features/onboarding/screen/onboarding_screen.dart';
import 'package:trajan_food_app/features/signin/screen/sign_in_screen.dart';
import 'package:trajan_food_app/features/signup/screen/sign_up_screen.dart';
import 'package:trajan_food_app/features/splash/splash_screen.dart';
import 'package:trajan_food_app/route/route_name.dart';

class RoutePages {
  List<GetPage<dynamic>> routes = [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteName.onboardingScreen,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: RouteName.signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: RouteName.signInScreen,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: RouteName.mainScreen,
      page: () => MainScreen(),
      binding: MainBainding(),
    ),
  ];
}