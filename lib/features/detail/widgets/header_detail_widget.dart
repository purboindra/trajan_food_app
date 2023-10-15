import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';
import 'package:trajan_food_app/features/models/recommend_model.dart';

class HeaderDetailWidget extends StatelessWidget {
  const HeaderDetailWidget({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
            image: DecorationImage(
                image: AssetImage(productModel.imageUrl), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 36),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    productModel.label,
                    style: ConstantTextStyle.stylePoppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productModel.tag,
                        style: ConstantTextStyle.stylePoppins(
                            color: const Color(0xffDCDBDB)),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 24,
                            color: Color(0xffFFCE31),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            productModel.rating,
                            style: ConstantTextStyle.stylePoppins(
                              fontWeight: FontWeight.w600,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: 25,
          child: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: whiteColor,
              size: 36,
            ),
          ),
        ),
      ],
    );
  }
}
