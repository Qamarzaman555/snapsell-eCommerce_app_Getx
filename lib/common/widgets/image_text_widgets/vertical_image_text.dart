import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../images/circular_image.dart';

class AppVerticalImageText extends StatelessWidget {
  const AppVerticalImageText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.textColor = AppColors.light,
    this.isNetworkImage = true,
    this.backgroundColor,
  });

  final Color textColor;
  final String image, title;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            AppCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: AppSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? AppColors.light : AppColors.dark,
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            /// Text
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
