import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';
import 'components/home_appbar.dart';
import 'components/home_categories.dart';
import 'components/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  AppHomeAppBar(),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  /// -- SearchBar
                  AppSearchContainer(text: AppText.searchinStore),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  /// -- Categories
                  Padding(
                    padding: EdgeInsets.only(left: AppSizes.defaultSpace),
                    child: Column(
                      children: [
                        // -- Heading
                        AppSectionHeading(
                          title: "Popular Categories",
                          textColor: AppColors.light,
                          showActionButton: false,
                        ),
                        SizedBox(height: AppSizes.spaceBtwItems),

                        /// Scrollable Categories
                        AppHomeCatergories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider
                  const AppPromoSlider(
                    banners: [
                      AppImages.promoBanner1,
                      AppImages.promoBanner2,
                      AppImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// -- Heading
                  AppSectionHeading(
                    title: 'Popular Products',
                    onPressed: () {},
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  /// --  Popular Products
                  AppGridLayout(
                      itemCount: 2,
                      minAxisExtent: AppDeviceUtils.getScreenHeight() * 0.33,
                      itemBuilder: (BuildContext context, int index) {
                        return const AppProductCardVertical();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
