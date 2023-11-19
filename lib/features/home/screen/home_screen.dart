import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';
import 'package:trajan_food_app/features/home/controller/home_controller.dart';
import 'package:trajan_food_app/features/home/widgets/category_widget.dart';
import 'package:trajan_food_app/features/home/widgets/favorite_card.dart';
import 'package:trajan_food_app/features/home/widgets/header_widget.dart';
import 'package:trajan_food_app/features/home/widgets/recommended_cart.dart';
import 'package:trajan_food_app/features/home/widgets/search_widget.dart';
import 'package:trajan_food_app/features/home/widgets/slider.dart';
import 'package:trajan_food_app/route/route_name.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Obx(
        () {
          if (_homeController.isLoading.isTrue) {
            return SizedBox(
              height: Get.size.height,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    if (_homeController.isLoadingGetUser.isTrue) {
                      return const SizedBox();
                    }
                    return HeaderWidget(
                      userModel: _homeController.userModel.value,
                    );
                  }),
                  const SizedBox(
                    height: 22,
                  ),
                  const SearchWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  CarouselSlider(homeController: _homeController),
                  const SizedBox(
                    height: 20,
                  ),
                  CategoryWidget(homeController: _homeController),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Favorite',
                          style: ConstantTextStyle.stylePoppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 155,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                _homeController.favoriteProductList.length,
                            itemBuilder: (context, index) {
                              final data =
                                  _homeController.favoriteProductList[index];
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(RouteName.detailScreen,
                                      arguments: {
                                        'product_id': data.productId,
                                      });
                                },
                                child: FavoriteCard(
                                  imageUrl: data.productImage,
                                  label: data.productName,
                                  price: data.price,
                                  rating: data.rating.toString(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recommended',
                          style: ConstantTextStyle.stylePoppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              _homeController.recommendedProductList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final data =
                                _homeController.recommendedProductList[index];
                            return InkWell(
                              onTap: () {
                                Get.toNamed(RouteName.detailScreen, arguments: {
                                  'product_id': data.productId,
                                });
                              },
                              child: RecommendedCard(
                                label: data.productName,
                                rating: data.rating.toString(),
                                price: data.price,
                                tag: '',
                                imageUrl: data.productImage,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
