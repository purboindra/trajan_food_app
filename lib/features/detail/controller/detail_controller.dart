import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trajan_food_app/constant/constants_firebase_collections.dart';
import 'package:trajan_food_app/features/favourite/controller/favorite_controller.dart';
import 'package:trajan_food_app/features/models/order_model.dart';
import 'package:trajan_food_app/features/models/product_model.dart';
import 'package:trajan_food_app/features/models/resto_model.dart';
import 'package:trajan_food_app/features/models/user_model.dart';
import 'package:trajan_food_app/services/notif_service.dart';

class DetailController extends GetxController {
  final RxInt _itemCount = 1.obs;
  RxInt get itemCount => _itemCount;

  final FavoriteController _favoriteController = Get.find();

  String _productId = '0';

  CollectionReference productCollection =
      FirebaseCollectionConstants.getProductCollection();

  CollectionReference userCollection =
      FirebaseCollectionConstants.getUserCollection();

  CollectionReference orderCollection =
      FirebaseCollectionConstants.getOrdersCollection();

  final Rx<OrderModel> _orderModel = OrderModel(
          uid: '',
          email: '',
          productName: '',
          productId: 0,
          status: "",
          productImage: '',
          createdAt: 0,
          expiredAt: 0,
          restoModel: RestoModel(name: '', addres: '', rating: 0),
          price: 0,
          rating: 0,
          totalPrice: 0,
          quantity: 0)
      .obs;
  Rx<OrderModel> get orderModel => _orderModel;

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

  Future<void> _updateDataFavorite() async {
    await _favoriteController.getFavoriteProduct();
    await _favoriteController.getCurrentUser();
  }

  Future<void> addToFav(
      String productId, Map<String, dynamic> user, String userEmail) async {
    try {
      List<String> favList = List.from(user["productFavorite"]);
      favList.add(productId);
      await userCollection.doc(userEmail).update({"productFavorite": favList});
      await _updateDataFavorite();
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
    await _updateDataFavorite();
    _isLoadingFavorite.value = false;
  }

  Future<void> checkStatusOrder() async {
    try {
      final user = await getCurrentUser();
      final allDataOrder = await orderCollection
          .where("email", isEqualTo: user.email)
          .where("status", isEqualTo: "pending")
          .get();
      for (final dataOrder in allDataOrder.docs) {
        final data = dataOrder.data() as Map<String, dynamic>;
        final dateNow = DateTime.now();
        final expiredAt =
            DateTime.fromMillisecondsSinceEpoch(data["expiredAt"]);
        if (dateNow.isAfter(expiredAt)) {
          dataOrder.reference.update({"status": "fail"});
        }
      }
    } catch (e) {
      print("ERROR FROM CHECK STATUS ORDER $e");
    }
  }

  Future<void> createOrder() async {
    try {
      final user = await getCurrentUser();
      _orderModel.value = OrderModel(
        uid: user.uid,
        email: user.email,
        productName: _productModel.value.productName,
        productId: int.parse(_productModel.value.productId),
        productImage: _productModel.value.productImage,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        expiredAt: DateTime.now().millisecondsSinceEpoch + (15 * 60 * 1000),
        restoModel: _productModel.value.restoModel,
        price: int.parse(_productModel.value.price),
        rating: _productModel.value.rating.toInt(),
        totalPrice: totalPrice(_productModel.value).value,
        quantity: _itemCount.value,
        status: "pending",
      );
      orderCollection.add(_orderModel.value.toMap());
      NotificationService.showNotif(
          'Your order has been created!',
          'Your item is ${_productModel.value.productName}',
          'Product Name: ${_productModel.value.productName} Product Id: ${_productModel.value.productId}');
    } catch (e, st) {
      print('ERROR FROM CREATE ORDER $e $st');
    }
  }

  @override
  void onInit() async {
    _isLoading.value = true;
    await checkStatusOrder();
    runGetDetailProduct();
    super.onInit();
  }
}
