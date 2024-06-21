import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/circular_image.dart';
import '../texts/brand_title_text_with_verified_icon.dart';

class AppBrandCard extends StatelessWidget {
  const AppBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: AppRoundedContainer(
        padding: const EdgeInsets.all(AppSizes.sm),
        showBorder: showBorder,
        backgroundColor: AppColors.transparent,
        child: Row(
          children: [
            /// -- Icon
            Flexible(
              child: AppCircularImage(
                image: AppImages.nikeLogo,
                overlayColor: dark ? AppColors.light : AppColors.dark,
                backgroundColor: AppColors.transparent,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            /// -- Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    ' 256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
