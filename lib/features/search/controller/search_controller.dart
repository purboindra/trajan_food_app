import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constants_firebase_collections.dart';

class SearchFeatureController extends GetxController {
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final RxList<Map<String, dynamic>> _searchProducts =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> get searchProducts => _searchProducts;

  CollectionReference productCollection =
      FirebaseCollectionConstants.getProductCollection();

  Future<void> searchProduct(String query) async {
    _searchProducts.clear();
    try {
      _isLoading.value = true;

      final newQuery = query
          .split(" ")
          .map((word) => word[0].toUpperCase() + word.substring(1))
          .join(" ");

      final data = await productCollection
          .where("product_name", isGreaterThanOrEqualTo: newQuery)
          .where("product_name", isLessThan: "${newQuery}z")
          .get();

      for (final product in data.docs) {
        _searchProducts.add(product.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print("Error Search Product $e");
    } finally {
      _isLoading.value = false;
    }
  }
}
