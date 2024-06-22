import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapsell/features/shop/screens/brand/brand_products.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/sortable/soratble_products.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
          showBackArrow: true,
          title:
              Text('Brand', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const AppSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwItems),

              /// -- Brands
              AppGridLayout(
                itemCount: 9,
                minAxisExtent: AppDeviceUtils.getScreenWidth(context) * 0.2,
                itemBuilder: (_, index) => AppBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
