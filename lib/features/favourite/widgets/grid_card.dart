import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';
import 'package:trajan_food_app/features/favourite/controller/favorite_controller.dart';
import 'package:trajan_food_app/route/route_name.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    super.key,
    required this.index,
    required this.favoriteController,
  });

  final int index;
  final FavoriteController favoriteController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteName.detailScreen, arguments: {
          'product_id': favoriteController.favoriteProduct[index].productId,
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              18,
            ),
            color: cardColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(
                      favoriteController.favoriteProduct[index].productImage,
                      width: 150,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
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
                            favoriteController.favoriteProduct[index].rating
                                .toString(),
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
            Text(
              favoriteController.favoriteProduct[index].restoModel.name,
              style: ConstantTextStyle.stylePoppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              favoriteController.favoriteProduct[index].productName,
              style: ConstantTextStyle.stylePoppins(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              favoriteController.favoriteProduct[index].restoModel.addres,
              style: ConstantTextStyle.stylePoppins(
                color: greyColor,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              'Rp${favoriteController.favoriteProduct[index].price}',
              style: ConstantTextStyle.stylePoppins(
                fontWeight: FontWeight.w300,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => favoriteController.removeFromFav(
                    favoriteController.favoriteProduct[index].productId),
                icon: Icon(
                  favoriteController.userModel!.productFavorite.contains(
                          favoriteController.favoriteProduct[index].productId)
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  size: 24,
                  color: const Color(0xffFF0000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
