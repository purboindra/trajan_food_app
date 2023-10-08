import 'package:get/get.dart';
import 'package:trajan_food_app/features/favourite/controller/favorite_controller.dart';
import 'package:trajan_food_app/features/main/controller/main_controller.dart';
import 'package:trajan_food_app/features/promo/controller/promo_controller.dart';

class MainBainding extends Bindings {
  @override
  void dependencies() {
    Get.put(PromoController());
    Get.put(FavoriteController());
    Get.put(MainController());
  }
}
