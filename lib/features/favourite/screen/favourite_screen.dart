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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'My Favorite',
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
                        _favoriteController.isGrid.isFalse
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
                  return Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: _favoriteController.favoriteProduct.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 300,
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16),
                      itemBuilder: (context, index) {
                        return GridCard(
                          favoriteController: _favoriteController,
                          index: index,
                        );
                      },
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: _favoriteController.favoriteProduct.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListCard(
                        favoriteController: _favoriteController,
                        index: index,
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
