import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';
import 'package:trajan_food_app/features/detail/controller/detail_controller.dart';
import 'package:trajan_food_app/features/detail/widgets/chip_resto_widget.dart';
import 'package:trajan_food_app/features/detail/widgets/header_detail_widget.dart';
import 'package:trajan_food_app/features/detail/widgets/resto_information_widget.dart';
import 'package:trajan_food_app/route/route_name.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({
    super.key,
  });

  final DetailController detailController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Obx(
        () {
          if (detailController.isLoading.isTrue) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                HeaderDetailWidget(
                    detailController: detailController,
                    productModel: detailController.productModel.value),
                const SizedBox(
                  height: 17,
                ),
                RestoInformationWidget(
                    productModel: detailController.productModel.value),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    children: [
                      ChipRestoWidget(
                        imageUrl: 'assets/icons/rating_icon.png',
                        label: detailController.productModel.value.rating
                            .toString(),
                      ),
                      const ChipRestoWidget(
                        imageUrl: 'assets/icons/location_icon.png',
                        label: '1.1 KM',
                      ),
                      const ChipRestoWidget(
                        imageUrl: 'assets/icons/halal_icon.png',
                        label: 'Halal',
                      ),
                      const ChipRestoWidget(
                        imageUrl: 'assets/icons/thumb_icon.png',
                        label: '4.2',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 36),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          18,
                        ),
                        color: cardColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/store_voucher_icon.png',
                              width: 32,
                              height: 32,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Store Voucher',
                              style: ConstantTextStyle.stylePoppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.chevron_right,
                          size: 24,
                          color: whiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 36),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                      color: cardColor),
                  child: Row(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                              image: NetworkImage(
                                detailController
                                    .productModel.value.productImage,
                              ),
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
                              detailController.productModel.value.productName,
                              style: ConstantTextStyle.stylePoppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: tealColor,
                                          )),
                                      child: Center(
                                        child: Text(
                                          '${detailController.itemCount}',
                                          style: ConstantTextStyle.stylePoppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          detailController.incrementItem(),
                                      child: Container(
                                        width: 34,
                                        height: 34,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: tealColor),
                                        child: const Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 24,
                                            color: whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    InkWell(
                                      onTap: () =>
                                          detailController.decrementItem(),
                                      child: Container(
                                        width: 34,
                                        height: 34,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: tealColor),
                                        child: const Center(
                                          child: Icon(
                                            Icons.remove,
                                            size: 24,
                                            color: whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: ConstantTextStyle.stylePoppins(
                                    color: greyColor,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                    'Rp${detailController.totalPrice(detailController.productModel.value)}',
                                    style: ConstantTextStyle.stylePoppins(
                                      color: greyColor,
                                      fontSize: 16,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () =>
                          Get.toNamed(RouteName.orderScreen, arguments: {
                        'data': detailController.productModel.value.toJson(),
                        'totalPrice': detailController
                            .totalPrice(detailController.productModel.value)
                            .value,
                        'totalItem': detailController.itemCount.value,
                      }),
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(tealColor),
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 65, vertical: 12),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                      child: Text(
                        'Order',
                        style: ConstantTextStyle.stylePoppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
