import 'package:flutter/material.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    super.key,
    required this.label,
    required this.rating,
    required this.price,
    required this.tag,
    required this.imageUrl,
  });

  final String label;
  final String rating;
  final String imageUrl;
  final String price;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 115,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: whiteColor, width: 2),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: ConstantTextStyle.stylePoppins(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  tag,
                  style: ConstantTextStyle.stylePoppins(
                    fontWeight: FontWeight.w300,
                    color: greyColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.yellow,
                    ),
                    Text(
                      rating,
                      style: ConstantTextStyle.stylePoppins(),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Rp${price}K',
                  style: ConstantTextStyle.stylePoppins(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: greenColor),
              child: const Center(
                child: Icon(
                  Icons.add,
                  size: 16,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
