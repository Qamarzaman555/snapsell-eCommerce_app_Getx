import 'package:flutter/material.dart';
import 'package:snapsell/common/widgets/layouts/grid_layout.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class AppCategoryTab extends StatelessWidget {
  const AppCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const AppBrandShowcase(images: [
                AppImages.productImage3,
                AppImages.productImage2,
                AppImages.productImage1,
              ]),
              const AppBrandShowcase(images: [
                AppImages.productImage3,
                AppImages.productImage2,
                AppImages.productImage1,
              ]),
              const SizedBox(height: AppSizes.spaceBtwItems),

              /// -- Products
              AppSectionHeading(
                  title: 'You might like',
                  showActionButton: true,
                  onPressed: () {}),
              const SizedBox(height: AppSizes.spaceBtwItems),

              AppGridLayout(
                itemCount: 4,
                minAxisExtent: MediaQuery.sizeOf(context).height * 0.333,
                itemBuilder: (_, index) => const AppProductCardVertical(),
              ),

              const SizedBox(height: AppSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
