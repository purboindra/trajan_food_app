import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constants_firebase_collections.dart';
import 'package:trajan_food_app/features/models/product_model.dart';

class PromoController extends GetxController {
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final RxList<ProductModel> _onlyForYouProductList = <ProductModel>[].obs;
  RxList<ProductModel> get onlyForYouProductList => _onlyForYouProductList;

  final RxList<ProductModel> _blackFridayProductList = <ProductModel>[].obs;
  RxList<ProductModel> get blackFridayProductList => _blackFridayProductList;

  CollectionReference productCollection =
      FirebaseCollectionConstants.getProductCollection();

  Future<void> getOnlyForYouProduct() async {
    try {
      final data = await productCollection
          .where("product_type", isEqualTo: "favorite")
          .get();
      for (final product in data.docs) {
        _onlyForYouProductList
            .add(ProductModel.fromJson(product.data() as Map<String, dynamic>));
      }
    } catch (e, st) {
      print("ERROR FROM GET FAVORITE PRODUCT $e $st");
    }
  }

  Future<void> getBlackFridayProduct() async {
    try {
      final data = await productCollection
          .where("product_type", isEqualTo: "blackFriday")
          .get();
      for (final product in data.docs) {
        _blackFridayProductList
            .add(ProductModel.fromJson(product.data() as Map<String, dynamic>));
      }
    } catch (e, st) {
      print("ERROR FROM GET FAVORITE PRODUCT $e $st");
    }
  }

  Future<void> runGetProduct() async {
    _isLoading.value = true;
    try {
      await getBlackFridayProduct();
      await getOnlyForYouProduct();
    } catch (e) {
      print('ERROR FROM RUN GET PRODUCT $e');
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    await runGetProduct();
    super.onInit();
  }
}
