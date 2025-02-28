import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/shimmers/boxes_shimmer.dart';
import '../../../../../common/widgets/shimmers/list_tile_shimmer.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../controllers/brand_controller.dart';
import '../../../models/category_model.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          // Handle Loader, Nor Record, OR Error Message
          const loader = Column(
            children: [
              AppListTileShimmer(),
              SizedBox(height: AppSizes.spaceBtwItems),
              AppBoxesShimmer(),
              SizedBox(height: AppSizes.spaceBtwItems),
            ],
          );
          final widget = AppCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader, text: 'No Brand Card Found!');
          if (widget != null) return widget;

          // Record Found!
          final brands = snapshot.data!;
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (_, index) {
                final brand = brands[index];
                return FutureBuilder(
                    future: controller.getBrandProducts(
                        brandId: brand.id, limit: 3),
                    builder: (context, snapshot) {
                      // Handle Loader, Nor Record, OR Error Message
                      final widget =
                          AppCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: loader,
                              text: 'No Product Found!');
                      if (widget != null) return widget;

                      // Records found!
                      final products = snapshot.data!;

                      return AppBrandShowcase(
                        images: products.map((e) => e.thumbnail).toList(),
                        brand: brand,
                      );
                    });
              });
        });
  }
}
