import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';
import 'package:trajan_food_app/features/favourite/controller/favorite_controller.dart';
import 'package:trajan_food_app/features/favourite/widgets/grid_card.dart';
import 'package:trajan_food_app/features/favourite/widgets/list_card.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});

  final FavoriteController _favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 36,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Buy Again',
                        style: ConstantTextStyle.stylePoppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 90,
                        height: 3,
                        color: tealColor,
                      ),
                    ],
                  ),
                  Obx(() => IconButton(
                      onPressed: () => _favoriteController.toggleIsGrid(),
                      icon: Icon(
                        _favoriteController.isGrid.isTrue
                            ? Icons.grid_view
                            : Icons.list,
                        size: 32,
                        color: whiteColor,
                      )))
                ],
              ),
              const SizedBox(
                height: 31,
              ),
              Obx(() {
                if (_favoriteController.isGrid.isTrue) {
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: _favoriteController.favoriteList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 300,
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      final data = _favoriteController.favoriteList[index];
                      return GridCard(
                        addres: data.address,
                        imageUrl: data.imageUrl,
                        favoriteController: _favoriteController,
                        index: index,
                        isFavorite: data.isFavorite,
                        menuTitle: data.menuTitle,
                        price: data.price,
                        rating: data.rating,
                        restoName: data.restoName,
                      );
                    },
                  );
                }
                return ListView.builder(
                  itemCount: _favoriteController.favoriteList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final data = _favoriteController.favoriteList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListCard(
                        addres: data.address,
                        imageUrl: data.imageUrl,
                        favoriteController: _favoriteController,
                        index: index,
                        isFavorite: data.isFavorite,
                        menuTitle: data.menuTitle,
                        price: data.price,
                        rating: data.rating,
                        restoName: data.restoName,
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
