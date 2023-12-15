import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';
import 'package:trajan_food_app/features/search/controller/search_controller.dart';
import 'package:trajan_food_app/route/route_name.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchFeatureController _searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.white),
                onChanged: (value) async =>
                    _searchController.searchProduct(value),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: ConstantTextStyle.stylePoppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: greyColor,
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 24,
                    color: greyColor,
                  ),
                  filled: true,
                  fillColor: const Color(0xff575B5C),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(
                        color: Color(0xff575B5C),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (_searchController.isLoading.isTrue) {
                  const Expanded(
                      child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ));
                }

                if (_searchController.isLoading.isFalse &&
                    _searchController.searchProducts.isNotEmpty) {
                  return Expanded(
                      child: ListView.builder(
                    itemCount: _searchController.searchProducts.length,
                    itemBuilder: (context, index) {
                      final product = _searchController.searchProducts[index];
                      return ListTile(
                        onTap: () => Get.toNamed(RouteName.detailScreen,
                            arguments: {"product_id": product["product_id"]}),
                        title: Text(
                          product["product_name"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        leading: Container(
                          width: 108,
                          height: 108,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(
                                  product["product_image"],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        subtitle: Text(
                          "\$${product["price"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade200,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.yellow,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${product["rating"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade100,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ));
                }
                return const Expanded(
                  child: Center(
                    child: Text(
                      "Find your some favorite food here...",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
