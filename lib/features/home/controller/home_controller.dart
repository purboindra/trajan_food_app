import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';
import 'package:trajan_food_app/features/models/recommend_model.dart';

class HomeController extends GetxController {
  PageController? pageController;
  final RxInt _indexSlider = 0.obs;
  RxInt get indexSlider => _indexSlider;

  void changeIndex(int value) {
    _indexSlider.value = value;
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

  final favoriteList = [
    {
      'imageUrl': 'assets/images/favorite_1.png',
      'label': 'Cheese Burger',
      'rating': '4.7',
      'price': '28',
    },
    {
      'imageUrl': 'assets/images/favorite_2.png',
      'label': 'Cappucino',
      'rating': '4.6',
      'price': '32',
    },
  ];

  final List<RecommendModel> recomendList = [
    RecommendModel(
        imageUrl: 'assets/images/recomend_1.png',
        label: 'Spaghetti with berbaque sauce',
        price: '30',
        rating: '4.7',
        tag: 'Spagheeti, Egg'),
    RecommendModel(
        imageUrl: 'assets/images/recomend_2.png',
        label: 'Beef pizza with mushroom',
        price: '132',
        rating: '4.1',
        tag: 'Beef, Mushroom'),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(viewportFraction: 0.85);
  }
}
