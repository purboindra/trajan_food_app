import 'package:get/get.dart';
import 'package:trajan_food_app/features/models/recommend_model.dart';

class DetailController extends GetxController {
  final RxInt _itemCount = 1.obs;
  RxInt get itemCount => _itemCount;

  RxInt totalPrice(ProductModel productModel) {
    return (_itemCount * int.parse(productModel.price)).toInt().obs;
  }

  void incrementItem() {
    _itemCount.value++;
  }

  void decrementItem() {
    if (_itemCount.value > 1) {
      _itemCount.value--;
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Maaf Anda Sudah Minimal Limit Item',
          message: 'Item minimal harus memiliki 1 item',
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
