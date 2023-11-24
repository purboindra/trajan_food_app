import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trajan_food_app/constant/constants_firebase_collections.dart';
import 'package:trajan_food_app/features/models/product_model.dart';
import 'package:trajan_food_app/features/models/user_model.dart';

class FavoriteController extends GetxController {
  final RxBool _isGrid = false.obs;
  RxBool get isGrid => _isGrid;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final RxList<ProductModel> _favoriteProduct = <ProductModel>[].obs;
  RxList<ProductModel> get favoriteProduct => _favoriteProduct;

  CollectionReference userCollection =
      FirebaseCollectionConstants.getUserCollection();

  CollectionReference productCollection =
      FirebaseCollectionConstants.getProductCollection();

  UserModel? userModel;

  Future<void> getFavoriteProduct() async {
    _favoriteProduct.clear();
    _isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final userPrefs = jsonDecode(prefs.getString("user")!);
      final user = await userCollection.doc(userPrefs["email"]).get();
      final userData = user.data() as Map<String, dynamic>;
      List<String> favList = List<String>.from(userData["productFavorite"]);

      final querySnapshot = await productCollection
          .where(FieldPath.documentId, whereIn: favList)
          .get();

      for (final product in querySnapshot.docs) {
        _favoriteProduct
            .add(ProductModel.fromJson(product.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print('ERROR FROM GET FAVORITE PRODUCT $e');
    } finally {
      _isLoading.value = false;
    }
  }

  Future<UserModel> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userPrefs = jsonDecode(prefs.getString("user")!);
    final user = await userCollection.doc(userPrefs["email"]).get();
    userModel = UserModel.fromJson(user.data() as Map<String, dynamic>);
    return userModel!;
  }

  void toggleIsGrid() {
    _isGrid.toggle();
  }

  Future<void> removeFromFav(String productId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userPrefs = jsonDecode(prefs.getString("user")!);
      final user = await userCollection.doc(userPrefs["email"]).get();
      List<String> favList = List.from(user["productFavorite"]);
      favList.remove(productId);
      await userCollection
          .doc(user["email"])
          .update({"productFavorite": favList});
      await getCurrentUser();
      await getFavoriteProduct();
    } catch (e) {
      print('ERROR FROM REMOVE FROM FAV $e');
    }
  }

  @override
  void onInit() async {
    _isLoading.value = true;
    // TODO: implement onInit
    super.onInit();
    await getCurrentUser();
    await getFavoriteProduct();
    _isLoading.value = false;
  }
}
