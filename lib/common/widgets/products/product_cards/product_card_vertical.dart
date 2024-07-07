import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../features/shop/screens/product_details/product_details.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/app_circular_icon.dart';
import '../../images/app_rounded_image.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class AppProductCardVertical extends StatelessWidget {
  const AppProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = AppHelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius and shadow.
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: AppDeviceUtils.getScreenWidth(context) * 0.5,
        height: AppDeviceUtils.getScreenHeight() * 0.4,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [AppShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          color: dark ? AppColors.darkerGrey : AppColors.light,
        ),
        child: Column(
          children: [
            /// Thumnail, Wishlist Button, Discount Tag
            AppRoundedContainer(
              // height: 160,
              padding: const EdgeInsets.all(AppSizes.sm),
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  AppRoundedImage(
                    imageUrl: product.thumbnail,
                    // backgroundColor: dark ? AppColors.dark : AppColors .light,
                    applyImageRadius: true,
                    isNetworkImage: true,
                    height: AppDeviceUtils.getScreenHeight() * 0.2,
                    width: double.infinity,
                  ),

                  /// -- Sale Tag
                  Positioned(
                    top: 12,
                    child: AppRoundedContainer(
                      radius: AppSizes.sm,
                      backgroundColor: AppColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm, vertical: AppSizes.xs),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: AppColors.black),
                      ),
                    ),
                  ),

                  /// -- Favourite Icon Button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: AppCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            /// -- Details
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  AppBrandTitleWithVerifiedIcon(
                    title: product.brand!.name,
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: AppSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: AppSizes.sm),
                        child: AppProductPriceText(
                            price: controller.getProductsPrice(product)),
                      ),
                    ],
                  ),
                ),

                // Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.cardRadiusMd),
                      bottomRight: Radius.circular(AppSizes.productImageRadius),
                    ),
                    color: AppColors.dark,
                  ),
                  child: const SizedBox(
                      width: AppSizes.iconLg * 1.2,
                      height: AppSizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(Iconsax.add, color: AppColors.light))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
