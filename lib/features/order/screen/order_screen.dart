import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';
import 'package:trajan_food_app/features/models/recommend_model.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen(
      {super.key,
      required this.productModel,
      required this.totalPrice,
      required this.totalItem});

  final ProductModel productModel;
  final int totalPrice;
  final int totalItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: Text(
          'My Steak',
          style: ConstantTextStyle.stylePoppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            size: 36,
            color: whiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/home_location_icon.png',
                  width: 48,
                  height: 48,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Your Address',
                  style: ConstantTextStyle.stylePoppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Home',
                  style: ConstantTextStyle.stylePoppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Jl. Paguyuban Kentucky, No 01, Tangerang.',
                  style: ConstantTextStyle.stylePoppins(),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(tealColor),
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 13, horizontal: 23),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    child: Text(
                      'Add Note',
                      style: ConstantTextStyle.stylePoppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(tealColor),
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(
                            vertical: 13,
                          ),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      child: Text(
                        'Change Address',
                        style: ConstantTextStyle.stylePoppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: cardColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/delivery_icon.png',
                            width: 32,
                            height: 32,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Delivery',
                            style: ConstantTextStyle.stylePoppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/time_delivery_icon.png',
                            width: 32,
                            height: 32,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '18 Mins',
                            style: ConstantTextStyle.stylePoppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(tealColor),
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(
                            vertical: 13,
                            horizontal: 18,
                          ),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      child: Text(
                        'Change',
                        style: ConstantTextStyle.stylePoppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Order',
                  style: ConstantTextStyle.stylePoppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                              image: AssetImage(''),
                              fit: BoxFit.cover,
                            )),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'testt',
                              style: ConstantTextStyle.stylePoppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Rp32',
                              style: ConstantTextStyle.stylePoppins(),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 10),
                                      hintText: 'No Note',
                                      hintStyle: ConstantTextStyle.stylePoppins(
                                        fontSize: 12,
                                      ),
                                      fillColor: const Color(0xff7C7E7E),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: const BorderSide(
                                          color: cardColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: const BorderSide(
                                          color: cardColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 23,
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              tealColor),
                                      padding: const MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(
                                          vertical: 13,
                                          horizontal: 14,
                                        ),
                                      ),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Change',
                                          style: ConstantTextStyle.stylePoppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Icon(
                                          Icons.note,
                                          size: 14,
                                          color: whiteColor,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(
                          Size(MediaQuery.of(context).size.width, 60)),
                      backgroundColor:
                          const MaterialStatePropertyAll(tealColor),
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(
                          vertical: 13,
                        ),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    child: Text(
                      'Order',
                      style: ConstantTextStyle.stylePoppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
