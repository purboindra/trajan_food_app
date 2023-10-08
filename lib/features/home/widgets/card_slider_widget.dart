import 'package:flutter/material.dart';
import 'package:trajan_food_app/constant/constant_color.dart';

class CardSlider extends StatelessWidget {
  const CardSlider({
    super.key,
    required this.imageUrl,
    required this.contentWidget,
    this.isCenter = false,
  });

  final String imageUrl;
  final Widget contentWidget;
  final bool? isCenter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 218,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                color: tealColor,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: isCenter == true ? 60 : null,
            child: Image.asset(
              imageUrl,
              width: 145,
            ),
          ),
          Positioned(
            top: 70,
            left: 145,
            child: contentWidget,
          ),
        ],
      ),
    );
  }
}
