import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class AppCouponCode extends StatelessWidget {
  const AppCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return AppRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? AppColors.dark : AppColors.light,
      padding: const EdgeInsets.only(
        top: AppSizes.sm,
        bottom: AppSizes.sm,
        right: AppSizes.sm,
        left: AppSizes.md,
      ),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a promo code? Enter Here',
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: dark ? AppColors.light : AppColors.dark),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Buttons
          SizedBox(
            width: AppDeviceUtils.getScreenWidth(context) * 0.2,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: dark
                        ? AppColors.light.withOpacity(0.5)
                        : AppColors.dark.withOpacity(0.5),
                    backgroundColor: AppColors.grey.withOpacity(0.2),
                    side: BorderSide(color: AppColors.grey.withOpacity(0.1))),
                onPressed: () {},
                child: const Text('Apply')),
          )
        ],
      ),
    );
  }
}
