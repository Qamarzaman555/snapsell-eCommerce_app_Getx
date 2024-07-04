import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/product/product_controller.dart';
import '../all_products/all_products.dart';
import 'components/home_appbar.dart';
import 'components/home_categories.dart';
import 'components/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
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
                        SizedBox(height: AppSizes.spaceBtwSections),
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
                  const AppPromoSlider(),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// -- Heading
                  AppSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  /// --  Popular Products
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const AppVerticalProductShimmer();
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                          child: Text('No Data Found!',
                              style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return AppGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AppProductCardVertical(
                              product: controller.featuredProducts[index]);
                        });
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
