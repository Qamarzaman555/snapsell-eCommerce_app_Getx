import 'package:flutter/material.dart';

import '../../../features/shop/screens/store/store.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class AppBrandShowcase extends StatelessWidget {
  const AppBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      showBorder: true,
      borderColor: AppColors.darkGrey,
      backgroundColor: AppColors.transparent,
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      padding: const EdgeInsets.all(AppSizes.md),
      child: Column(
        children: [
          /// Brand with Products Count
          const AppBrandCard(showBorder: false),
          const SizedBox(height: AppSizes.spaceBtwItems),

          /// Brand Top 3 Images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }
}
