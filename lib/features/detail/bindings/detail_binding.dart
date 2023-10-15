import 'package:get/get.dart';
import 'package:trajan_food_app/features/detail/controller/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailController());
  }
}
