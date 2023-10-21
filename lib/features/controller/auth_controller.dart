import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';
import 'package:trajan_food_app/constant/constants_firebase_collections.dart';
import 'package:trajan_food_app/features/models/location_model.dart';
import 'package:trajan_food_app/features/models/user_model.dart';
import 'package:trajan_food_app/route/route_name.dart';
import 'package:trajan_food_app/services/location_service.dart';

class AuthController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  CollectionReference userCollection =
      FirebaseCollectionConstants.getUserCollection();

  final RxBool _isObsecure = false.obs;
  RxBool get isObsecure => _isObsecure;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final RxString _userLocation = ''.obs;
  RxString get userLocation => _userLocation;

  Future<bool> _isDuplicateEmail() async {
    final users = await userCollection.get();
    return users.docs
        .any((element) => element['email'] == emailController.text);
  }

  Future<void> signUpUser() async {
    try {
      _isLoading.value = true;

      if (await _isDuplicateEmail()) throw Exception('Email Already Use!');

      final currentLocation = await LocationService.getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentLocation!.latitude, currentLocation.longitude);

      _userLocation.value =
          "${placemarks[0].street}, ${placemarks[0].subAdministrativeArea}, ${placemarks[0].postalCode}";

      final location = LocationModel(
          address: _userLocation.value,
          latitude: currentLocation.latitude.toString(),
          longitude: currentLocation.longitude.toString());

      final userModel = UserModel(
        id: '1',
        userName: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        location: location,
        productFavorite: [],
      );

      final user = await userCollection.add(userModel.toJson());

      await userCollection.doc(user.id).update({'id': user.id});

      Get.showSnackbar(const GetSnackBar(
        title: 'Register Successfully',
        message: 'Success register to trajan food app, enjoy!',
        duration: Duration(seconds: 3),
      )).future.then((value) => Get.offAllNamed(RouteName.mainScreen));
    } catch (e, st) {
      print('Error From Sign Up $e, Stack Trace: $st');
      Get.showSnackbar(GetSnackBar(
        title: 'Something Went Wrong',
        message: 'Sorry, $e',
        duration: const Duration(seconds: 3),
      ));
    } finally {
      _isLoading.value = false;
    }
  }

  void changeIsObsecure() {
    _isObsecure.value = !_isObsecure.value;
  }

  RxInt idxBottomNavbar = 0.obs;

  void changeIndex(int val) {
    idxBottomNavbar.value = val;
  }

  List<BottomNavigationBarItem> iconList = [
    BottomNavigationBarItem(
        activeIcon: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Text(
                'Home',
                style: ConstantTextStyle.stylePoppins(color: whiteColor),
              ),
              Container(
                width: 3,
                height: 3,
                color: whiteColor,
              ),
            ],
          ),
        ),
        label: '',
        icon: const Icon(
          Icons.home,
          color: whiteColor,
        )),
    BottomNavigationBarItem(
        activeIcon: Column(
          children: [
            Text('Promo',
                style: ConstantTextStyle.stylePoppins(color: whiteColor)),
            const SizedBox(
              height: 3,
            ),
            Container(
              width: 3,
              height: 3,
              color: whiteColor,
            ),
          ],
        ),
        label: '',
        icon: const Icon(
          Icons.discount,
          color: whiteColor,
        )),
    BottomNavigationBarItem(
        activeIcon: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Text('Favorite',
                  style: ConstantTextStyle.stylePoppins(color: whiteColor)),
              const SizedBox(
                height: 3,
              ),
              Container(
                width: 3,
                height: 3,
                color: whiteColor,
              ),
            ],
          ),
        ),
        label: '',
        icon: const Icon(
          Icons.favorite,
          color: whiteColor,
        )),
    BottomNavigationBarItem(
      activeIcon: Container(
        color: greenColor,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text('Person',
                style: ConstantTextStyle.stylePoppins(color: whiteColor)),
            const SizedBox(
              height: 3,
            ),
            Container(
              width: 3,
              height: 3,
              color: whiteColor,
            ),
          ],
        ),
      ),
      label: '',
      icon: Container(
        color: greenColor,
        child: const Icon(
          Icons.person,
          color: whiteColor,
        ),
      ),
    ),
  ];
}
