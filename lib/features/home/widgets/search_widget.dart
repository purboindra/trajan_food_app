import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';
import 'package:trajan_food_app/route/route_name.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: TextFormField(
        onTap: () => Get.toNamed(RouteName.searchScreen),
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
    );
  }
}
