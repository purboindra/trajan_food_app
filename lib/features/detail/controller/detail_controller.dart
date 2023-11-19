import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trajan_food_app/constant/constants_firebase_collections.dart';
import 'package:trajan_food_app/features/models/product_model.dart';
import 'package:trajan_food_app/features/models/resto_model.dart';
import 'package:trajan_food_app/features/models/user_model.dart';

class DetailController extends GetxController {
  final RxInt _itemCount = 1.obs;
  RxInt get itemCount => _itemCount;

  String _productId = '0';

  CollectionReference productCollection =
      FirebaseCollectionConstants.getProductCollection();

  CollectionReference userCollection =
      FirebaseCollectionConstants.getUserCollection();

  final Rx<ProductModel> _productModel = ProductModel(
          price: '0',
          productId: '',
          productImage: '',
          productName: '',
          productType: ProductType.other,
          rating: 0,
          restoModel: RestoModel(name: '', addres: '', rating: 0),
          isHalal: true)
      .obs;
  Rx<ProductModel> get productModel => _productModel;

  UserModel? userModel;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final RxBool _isLoadingFavorite = false.obs;
  RxBool get isLoadingFavorite => _isLoadingFavorite;

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

  Future<void> addToFav(
      String productId, Map<String, dynamic> user, String userEmail) async {
    try {
      List<String> favList = List.from(user["productFavorite"]);
      favList.add(productId);
      await userCollection.doc(userEmail).update({"productFavorite": favList});
    } catch (e) {
      print('ERROR FROM ADD TO FAV $e');
    }
  }

  Future<void> removeFromFav(
      String productId, Map<String, dynamic> user, String userEmail) async {
    try {
      List<String> favList = List.from(user["productFavorite"]);
      favList.remove(productId);
      await userCollection.doc(userEmail).update({"productFavorite": favList});
    } catch (e) {
      print('ERROR FROM REMOVE FROM FAV $e');
    }
  }

  void handleFavorite(String productId) async {
    _isLoadingFavorite.value = true;
    final prefs = await SharedPreferences.getInstance();
    final userPrefs = jsonDecode(prefs.getString("user")!);
    final user = await userCollection.doc(userPrefs["email"]).get();
    final userData = user.data() as Map<String, dynamic>;
    List<String> favList = List.from(userData["productFavorite"]);
    if (favList.contains(productId)) {
      await removeFromFav(productId, userData, userPrefs["email"]);
    } else {
      await addToFav(productId, userData, userPrefs["email"]);
    }
    await getCurrentUser();
    _isLoadingFavorite.value = false;
  }

  Future<UserModel> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userPrefs = jsonDecode(prefs.getString("user")!);
    final user = await userCollection.doc(userPrefs["email"]).get();
    final userData = user.data() as Map<String, dynamic>;
    userModel = UserModel.fromJson(userData);
    return userModel!;
  }

  Future<void> getDetailProduct() async {
    _isLoading.value = true;
    try {
      final response = await productCollection.doc(_productId).get();
      _productModel.value =
          ProductModel.fromJson(response.data() as Map<String, dynamic>);
    } catch (e, st) {
      log('ERROR FROM GET DETAIL PRODUCT $e $st');
    } finally {
      _isLoading.value = false;
    }
  }

  void runGetDetailProduct() async {
    final args = Get.arguments as Map<String, dynamic>;
    await getCurrentUser();
    if (args.isNotEmpty) {
      if (args.containsKey("product_id")) {
        _productId = args["product_id"];
      }
      await getDetailProduct();
    }
  }

  @override
  void onInit() {
    _isLoading.value = true;
    runGetDetailProduct();
    super.onInit();
  }
}
