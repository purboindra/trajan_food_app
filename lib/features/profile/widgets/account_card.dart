import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:trajan_food_app/constant/constant_color.dart';
import 'package:trajan_food_app/constant/constant_text_style.dart';
import 'package:trajan_food_app/features/profile/controller/profile_controller.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.profileController,
  });

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
      child: GlassContainer.clearGlass(
        height: 450,
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
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Your Account',
              style: ConstantTextStyle.stylePoppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: profileController.accountFeatureList.length,
              itemBuilder: (context, index) {
                final data = profileController.accountFeatureList[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          data['icon'],
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          data['label'],
                          style: ConstantTextStyle.stylePoppins(),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: whiteColor,
                      ),
                    ),
                  ],
                );
              },
            )),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async => await profileController.singOut(),
              child: Row(
                children: [
                  const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Logout',
                    style: ConstantTextStyle.stylePoppins(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
