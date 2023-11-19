import 'package:flutter/material.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';
import 'package:trajan_food_app/features/models/product_model.dart';

class RestoInformationWidget extends StatelessWidget {
  const RestoInformationWidget({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                    color: whiteColor,
                  ),
                ),
                child: Image.asset(
                  'assets/icons/logo_store_icon.png',
                  width: 39,
                  height: 46,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.restoModel.name,
                      style: ConstantTextStyle.stylePoppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      productModel.restoModel.addres,
                      style: ConstantTextStyle.stylePoppins(color: greyColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(tealColor),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                )),
            child: Text(
              'Visit Resto',
              style: ConstantTextStyle.stylePoppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
