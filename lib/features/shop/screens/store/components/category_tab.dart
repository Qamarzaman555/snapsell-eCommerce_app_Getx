import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapsell/common/widgets/layouts/grid_layout.dart';

import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../controllers/category_controller.dart';
import '../../../models/category_model.dart';
import '../../all_products/all_products.dart';
import 'category_brands.dart';

class AppCategoryTab extends StatelessWidget {
  const AppCategoryTab({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              CategoryBrands(category: category),
              const SizedBox(height: AppSizes.spaceBtwItems),

              /// -- Products
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    // Handle Loader, No Record, OR Error Message
                    final response =
                        AppCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: const AppVerticalProductShimmer());
                    if (response != null) return response;

                    // Record Found!
                    final products = snapshot.data!;

                    return Column(
                      children: [
                        AppSectionHeading(
                          title: 'You might like',
                          showActionButton: true,
                          onPressed: () => Get.to(
                            () => AllProducts(
                              title: category.name,
                              futureMethod: controller.getCategoryProducts(
                                  categoryId: category.id, limit: -1),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        AppGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => AppProductCardVertical(
                            product: products[index],
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
