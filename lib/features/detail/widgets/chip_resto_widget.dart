import 'package:flutter/material.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';

class ChipRestoWidget extends StatelessWidget {
  const ChipRestoWidget({
    super.key,
    required this.imageUrl,
    required this.label,
  });

  final String imageUrl;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: tealColor,
          )),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            label,
            style: ConstantTextStyle.stylePoppins(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
