import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';

class SaldoCard extends StatelessWidget {
  const SaldoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer.clearGlass(
      height: 110,
      width: 400,
      gradient: LinearGradient(
        colors: [
          const Color(0xff435055).withOpacity(0.7),
          const Color(0xff9A9B9C).withOpacity(0.1)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(18),
      blur: 15.0,
      borderWidth: 0.0,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: tealColor,
                    ),
                    child: const Icon(
                      Icons.attach_money,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Your Saldo',
                    style: ConstantTextStyle.stylePoppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11)),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(tealColor),
                  ),
                  child: Text(
                    'Top Up',
                    style: ConstantTextStyle.stylePoppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 30,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Rp',
                    style: ConstantTextStyle.stylePoppins(
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '998.887.554',
                  style: ConstantTextStyle.stylePoppins(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
