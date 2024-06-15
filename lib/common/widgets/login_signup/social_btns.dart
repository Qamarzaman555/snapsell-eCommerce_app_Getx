import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class AppSocialButtons extends StatelessWidget {
  const AppSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: dark ? AppColors.darkGrey : AppColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: AppSizes.iconMd,
                height: AppSizes.iconMd,
                image: AssetImage(AppImages.google),
              )),
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: dark ? AppColors.darkGrey : AppColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: AppSizes.iconMd,
                height: AppSizes.iconMd,
                image: AssetImage(AppImages.facebook),
              )),
        ),
      ],
    );
  }
}
