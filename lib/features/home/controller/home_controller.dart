import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';
import 'package:trajan_food_app/constant/constants_firebase_collections.dart';
import 'package:trajan_food_app/features/models/location_model.dart';
import 'package:trajan_food_app/features/models/product_model.dart';
import 'package:trajan_food_app/features/models/user_model.dart';

class HomeController extends GetxController {
  PageController? pageController;

  final Rx<UserModel> _userModel = UserModel(
          id: '',
          uid: '',
          accessToken: '',
          token: '',
          userName: '',
          email: '',
          password: '',
          createdAt: DateTime.now(),
          location: LocationModel(address: '', latitude: '', longitude: ''),
          productFavorite: [],
          photoUrl: '')
      .obs;
  Rx<UserModel> get userModel => _userModel;

  final RxList<ProductModel> _favoriteProductList = <ProductModel>[].obs;
  RxList<ProductModel> get favoriteProductList => _favoriteProductList;

  final RxList<ProductModel> _recommendedProductList = <ProductModel>[].obs;
  RxList<ProductModel> get recommendedProductList => _recommendedProductList;

  final RxBool _isLoadingGetUser = false.obs;
  RxBool get isLoadingGetUser => _isLoadingGetUser;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final RxInt _indexSlider = 0.obs;
  RxInt get indexSlider => _indexSlider;

  CollectionReference userCollection =
      FirebaseCollectionConstants.getUserCollection();

  CollectionReference productCollection =
      FirebaseCollectionConstants.getProductCollection();

  void changeIndex(int value) {
    _indexSlider.value = value;
  }

  Future<void> getFavoriteProduct() async {
    try {
      final data = await productCollection
          .where("product_type", isEqualTo: "favorite")
          .get();
      for (final product in data.docs) {
        _favoriteProductList
            .add(ProductModel.fromJson(product.data() as Map<String, dynamic>));
      }
    } catch (e, st) {
      print("ERROR FROM GET FAVORITE PRODUCT $e $st");
    }
  }

  Future<void> getRecommendedProduct() async {
    try {
      final data = await productCollection
          .where("product_type", isEqualTo: "recommended")
          .get();

      for (final product in data.docs) {
        _recommendedProductList
            .add(ProductModel.fromJson(product.data() as Map<String, dynamic>));
      }
    } catch (e) {
      log("ERROR FROM GET RECOMMENDED PRODUCT $e");
    }
  }

  final List<Map<String, dynamic>> cardList = [
    {
      'imageUrl': 'assets/images/image_slider_1.png',
      'contentWidget': Column(
        children: [
          Text(
            'Icelicious',
            style: ConstantTextStyle.stylePoppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Only for you!',
            style: ConstantTextStyle.stylePoppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Discount Up To',
            style: ConstantTextStyle.stylePoppins(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '75%',
            style: ConstantTextStyle.stylePoppins(
                fontWeight: FontWeight.w700, fontSize: 48),
          ),
        ],
      ),
      'isCenter': false,
    },
    {
      'imageUrl': 'assets/images/image_slider_2.png',
      'isCenter': true,
      'contentWidget': Column(
        children: [
          Text(
            'Icelicious 2',
            style: ConstantTextStyle.stylePoppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Only for you!',
            style: ConstantTextStyle.stylePoppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Discount Up To',
            style: ConstantTextStyle.stylePoppins(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '75%',
            style: ConstantTextStyle.stylePoppins(
                fontWeight: FontWeight.w700, fontSize: 48),
          ),
        ],
      ),
    },
  ];

  final categoryList = [
    {'imageUrl': 'assets/icons/hamburger_icon.png', 'label': 'Burgers'},
    {'imageUrl': 'assets/icons/spaghetti_icon.png', 'label': 'Spaghetti'},
    {'imageUrl': 'assets/icons/coffee_icon.png', 'label': 'Coffee'},
    {'imageUrl': 'assets/icons/milkshake_icon.png', 'label': 'Milkshake'},
    {'imageUrl': 'assets/icons/pizza_icon.png', 'label': 'Pizza'},
  ];

  Future<UserModel> getCurrentUser() async {
    _isLoadingGetUser.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final user = prefs.getString('user');
      final userDecode = jsonDecode(user!);
      _userModel.value = UserModel.fromJson(userDecode);
      print('CURRENT USER ${_userModel.toJson()}');
      return _userModel.value;
    } catch (e) {
      print("ERROR GET CURRENT USER $e");
      return _userModel.value;
    } finally {
      _isLoadingGetUser.value = false;
    }
  }

  Future<void> runGetProduct() async {
    _isLoading.value = true;
    try {
      await getFavoriteProduct();
      await getRecommendedProduct();
    } catch (e) {
      log('ERROR FROM RUN GET PRODUCT');
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    pageController = PageController(viewportFraction: 0.85);
    await getCurrentUser();
    await runGetProduct();
  }
}
