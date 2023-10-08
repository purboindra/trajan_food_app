import 'package:get/get.dart';
import 'package:trajan_food_app/features/models/only_for_you_model.dart';

class PromoController extends GetxController {
  final List<OnlyForYouModel> onlyForYouList = [
    OnlyForYouModel(
      address: 'Jl. Nusa Indah IV No.2,Tangerang',
      menuTitle: 'Ramen Teriyaki',
      discount: '40',
      isDiscount: true,
      restoName: 'Ramen Ngab',
      imageUrl: 'assets/images/only_for_you_1.png',
      rating: '4.7',
    ),
    OnlyForYouModel(
        address: 'Socrate, Citra-Raya',
        menuTitle: 'Cappucino',
        discount: '0',
        isDiscount: false,
        imageUrl: 'assets/images/only_for_you_2.png',
        rating: '4.3',
        restoName: 'Hafee'),
  ];

  final List<OnlyForYouModel> blackFridayList = [
    OnlyForYouModel(
      address: 'Jl. Veteran 2, Amsterdam',
      menuTitle: 'Chichen Prek',
      discount: '32',
      isDiscount: true,
      restoName: 'Chicken Food',
      imageUrl: 'assets/images/black_friday_1.png',
      rating: '4.2',
    ),
    OnlyForYouModel(
        address: 'Aristoteles, Citra-Raya',
        menuTitle: 'Steak With Cheese',
        discount: '24',
        isDiscount: true,
        imageUrl: 'assets/images/black_friday_2.png',
        rating: '4.5',
        restoName: 'My Steak'),
  ];
}
