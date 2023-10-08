import 'package:get/get.dart';
import 'package:trajan_food_app/features/models/favorite_model.dart';

class FavoriteController extends GetxController {
  final RxBool _isGrid = false.obs;
  RxBool get isGrid => _isGrid;

  void toggleIsGrid() {
    _isGrid.toggle();
  }

  void addToFavorite(int index) {
    late String title;
    late String message;
    final favorite = favoriteList[index].copyWith(
      isFavorite: !favoriteList[index].isFavorite,
    );
    favoriteList[index] = favorite;
    if (favorite.isFavorite) {
      title = 'Success Add Item To Favorite';
      message = '${favorite.menuTitle} sucessfully add to your favorite';
    } else {
      title = 'Success Remove Item From Favorite';
      message = '${favorite.menuTitle} sucessfully remove from your favorite';
    }
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  final RxList<FavoriteModel> favoriteList = [
    FavoriteModel(
        imageUrl: 'assets/images/favorite_screen_1.png',
        address: 'Jl. Raden Prabu Siliwangi, Tangerang',
        isFavorite: false,
        restoName: 'Hasta La Vista Cafe',
        rating: '4.3',
        menuTitle: 'Burger With French Fries',
        price: '54.000'),
    FavoriteModel(
        imageUrl: 'assets/images/favorite_screen_2.png',
        address: 'Jl. Cofeenary Citra-Raya, Tangerang ',
        isFavorite: false,
        restoName: 'Cofeenary',
        rating: '4.3',
        menuTitle: 'Iced Coffee Milk',
        price: '18.000'),
    FavoriteModel(
        imageUrl: 'assets/images/favorite_screen_3.png',
        address: 'Jl. Kentucky, Tangerang',
        isFavorite: false,
        restoName: 'Boba Master',
        rating: '4.7',
        menuTitle: 'Boba Brown Sugar',
        price: '22.000'),
    FavoriteModel(
        imageUrl: 'assets/images/favorite_screen_4.png',
        address: 'Jl. Steve Jobs, Tangerang',
        isFavorite: false,
        restoName: 'Warung Mama John',
        rating: '4.1',
        menuTitle: 'Spaghetme',
        price: '27.000'),
  ].obs;
}
