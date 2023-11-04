import 'package:get/get.dart';
import 'package:trajan_food_app/features/detail/bindings/detail_binding.dart';
import 'package:trajan_food_app/features/detail/screen/detail_screen.dart';
import 'package:trajan_food_app/features/main/bindings/main_binding.dart';
import 'package:trajan_food_app/features/main/screen/main_screen.dart';
import 'package:trajan_food_app/features/models/recommend_model.dart';
import 'package:trajan_food_app/features/onboarding/screen/onboarding_screen.dart';
import 'package:trajan_food_app/features/order/screen/order_screen.dart';
import 'package:trajan_food_app/features/signin/screen/sign_in_screen.dart';
import 'package:trajan_food_app/features/signup/screen/sign_up_screen.dart';
import 'package:trajan_food_app/features/splash/bindings/splash_binding.dart';
import 'package:trajan_food_app/features/splash/splash_screen.dart';
import 'package:trajan_food_app/route/route_name.dart';

class RoutePages {
  List<GetPage<dynamic>> routes = [
    GetPage(
        name: RouteName.splashScreen,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
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
      page: () => SignInScreen(),
    ),
    GetPage(
      name: RouteName.mainScreen,
      page: () => MainScreen(),
      binding: MainBainding(),
    ),
    GetPage(
      name: RouteName.detailScreen,
      binding: DetailBinding(),
      page: () {
        ProductModel productData = ProductModel(
            imageUrl: '', label: '', price: '', rating: '', tag: '');
        if (Get.arguments != null && Get.arguments is Map) {
          final Map<String, dynamic> args = Get.arguments;

          if (args.containsKey('data')) {
            productData = ProductModel.fromJson(args['data']);
          }
        }
        return DetailScreen(
          productModel: productData,
        );
      },
    ),
    GetPage(
      name: RouteName.orderScreen,
      page: () {
        ProductModel productData = ProductModel(
            imageUrl: '', label: '', price: '', rating: '', tag: '');
        int totalPrice = 0;
        int totalItem = 1;
        if (Get.arguments != null && Get.arguments is Map) {
          final Map<String, dynamic> args = Get.arguments;

          if (args.containsKey('data')) {
            productData = ProductModel.fromJson(args['data']);
          }

          if (args.containsKey('totalPrice')) {
            totalPrice = args['totalPrice'];
          }

          if (args.containsKey('totalItem')) {
            totalItem = args['totalItem'];
          }
        }
        return OrderScreen(
          productModel: productData,
          totalItem: totalItem,
          totalPrice: totalPrice,
        );
      },
    ),
  ];
}
