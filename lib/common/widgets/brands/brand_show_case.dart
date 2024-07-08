import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brands_model.dart';
import '../../../features/shop/screens/brand/brand_products.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../shimmers/shimmer.dart';
import 'brand_card.dart';

class AppBrandShowcase extends StatelessWidget {
  const AppBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: AppRoundedContainer(
        showBorder: true,
        borderColor: AppColors.darkGrey,
        backgroundColor: AppColors.transparent,
        margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          children: [
            /// Brand with Products Count
            AppBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: AppSizes.spaceBtwItems),

            /// Brand Top 3 Images
            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: AppRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(AppSizes.md),
      margin: const EdgeInsets.only(right: AppSizes.sm),
      backgroundColor: AppHelperFunctions.isDarkMode(context)
          ? AppColors.darkerGrey
          : AppColors.light,
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const AppShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ),
  );
}
