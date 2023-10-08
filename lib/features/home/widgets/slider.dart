import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/features/home/controller/home_controller.dart';

import 'card_slider_widget.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({super.key, required this.homeController});

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 218,
          child: PageView.builder(
            onPageChanged: (value) => homeController.changeIndex(value),
            controller: homeController.pageController,
            itemCount: homeController.cardList.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: CardSlider(
                imageUrl: homeController.cardList[index]['imageUrl'],
                contentWidget: homeController.cardList[index]['contentWidget'],
                isCenter: homeController.cardList[index]['isCenter'],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(left: 36),
          alignment: Alignment.topLeft,
          child: Wrap(
            spacing: 8,
            children: List.generate(
              homeController.cardList.length,
              (index) => Obx(
                () => Container(
                  width: 45,
                  height: 5,
                  color: homeController.indexSlider.value == index
                      ? greenColor
                      : greyColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
