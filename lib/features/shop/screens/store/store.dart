import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/category_controller.dart';
import '../brand/all_brands.dart';
import 'components/category_tab.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final dark = AppHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: const [
            AppCartCounter(),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrollable) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? AppColors.dark : AppColors.light,
                expandedHeight: 448,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(AppSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search bar
                      const SizedBox(height: AppSizes.spaceBtwItems),
                      const AppSearchContainer(
                        text: AppText.searchinStore,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: AppSizes.spaceBtwSections),

                      /// -- Featured Brands
                      AppSectionHeading(
                          title: 'Featured Brands',
                          onPressed: () =>
                              Get.to(() => const AllBrandsScreen())),
                      const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

                      /// -- Brands Grid
                      AppGridLayout(
                        itemCount: 4,
                        minAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const AppBrandCard(showBorder: true);
                        },
                      ),
                    ],
                  ),
                ),

                /// -- Tabs
                bottom: AppTabBar(
                  tabs: categories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories
                .map((category) => AppCategoryTab(
                      category: category,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: AppRoundedContainer(
      height: 100,
      backgroundColor: AppHelperFunctions.isDarkMode(context)
          ? AppColors.darkerGrey
          : AppColors.light,
      margin: const EdgeInsets.only(right: AppSizes.sm),
      padding: const EdgeInsets.all(AppSizes.md),
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
