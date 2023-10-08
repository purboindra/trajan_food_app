import 'package:flutter/material.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';

class OnlyForYouCard extends StatelessWidget {
  const OnlyForYouCard({
    super.key,
    required this.restoName,
    required this.menuTitle,
    required this.discount,
    required this.isDiscount,
    required this.addres,
    required this.imageUrl,
    required this.rating,
  });

  final String restoName;
  final String menuTitle;
  final String discount;
  final bool isDiscount;
  final String addres;
  final String imageUrl;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 170,
            height: 100,
            child: Stack(
              children: [
                Container(
                  width: 170,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 3,
                    ),
                    width: 75,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: tealColor,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 24,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          rating,
                          style: ConstantTextStyle.stylePoppins(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5).copyWith(
              bottom: 13,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restoName,
                  style: ConstantTextStyle.stylePoppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  menuTitle,
                  style: ConstantTextStyle.stylePoppins(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  addres,
                  style: ConstantTextStyle.stylePoppins(
                    color: const Color(0xffE3E3E3),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                if (isDiscount == true || int.parse(discount) > 0)
                  InkWell(
                    child: Container(
                      width: 100,
                      height: 30,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: tealColor),
                      child: Center(
                        child: Text(
                          '$discount% OFF',
                          style: ConstantTextStyle.stylePoppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
