import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';
import '../product_reviews/product_reviews.dart';
import 'components/bottom_add_to_cart_widget.dart';
import 'components/product_attributes.dart';
import 'components/product_detail_image_slider.dart';
import 'components/product_meta_data.dart';
import 'components/rating_and_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            AppProductImageSlider(product: product),

            /// 1 - Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
                left: AppSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Rating & Share Button
                  const AppRatingAndShare(),

                  /// -- Price,Title, Stock & Brand
                  AppProductMetaData(product: product),

                  /// -- Attributes
                  if (product.productType == ProductType.variable.toString())
                    AppProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(height: AppSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  ),

                  /// -- Description
                  const AppSectionHeading(title: 'Description'),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' show more',
                    trimExpandedText: ' show less',
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// -- Reviews
                  const Divider(),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppSectionHeading(
                        title: 'Reviews(199)',
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewsScreen()),
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
