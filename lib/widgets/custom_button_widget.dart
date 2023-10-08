import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.label,
    this.isFullButton = false,
    this.width = 200,
    this.height = 60,
    this.onPressed,
  });

  final String label;
  final bool isFullButton;
  final double width;
  final double height;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(
            vertical: 9,
            horizontal: 18,
          )),
          backgroundColor: const MaterialStatePropertyAll(tealColor),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          minimumSize: MaterialStatePropertyAll(
            Size(isFullButton ? Get.size.width : width, height),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: ConstantTextStyle.stylePoppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
