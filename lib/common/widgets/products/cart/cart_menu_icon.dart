import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class AppCartCounter extends StatelessWidget {
  const AppCartCounter({
    super.key,
    required this.onPressed,
    this.iconColor,
  });

  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: AppSizes.xs),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor ?? (!dark ? AppColors.dark : AppColors.light),
            ),
          ),
        ),
        Positioned(
          right: 6,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: dark ? AppColors.light : AppColors.dark.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                    color: dark ? AppColors.dark : AppColors.light,
                    fontSizeFactor: 0.7),
              ),
            ),
          ),
        )
      ],
    );
  }
}
