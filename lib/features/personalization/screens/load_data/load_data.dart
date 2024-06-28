import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/list_tiles/setting_menu_tiles.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../data/repositories/categories/category_repository.dart';
import '../../../../data/repositories/categories/dummy_data.dart';
import '../../../../utils/constants/sizes.dart';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryRepository.instance;
    return Scaffold(
      appBar: AppAppBar(
          showBackArrow: true,
          title: Text('Upload Data',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Upload Data
                  const AppSectionHeading(
                    title: 'Main Record',
                    showActionButton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  AppSettingMenuTile(
                    icon: Iconsax.category,
                    title: 'Upload Category',
                    trailing: const Icon(
                      Iconsax.arrow_circle_up,
                      color: Colors.blue,
                    ),
                    onTap: () =>
                        controller.uploadDummyData(AppDummyData.categories),
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.shop,
                    title: 'Upload Brands',
                    trailing: const Icon(
                      Iconsax.arrow_circle_up,
                      color: Colors.blue,
                    ),
                    onTap: () {},
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'Upload products',
                    trailing: const Icon(
                      Iconsax.arrow_circle_up,
                      color: Colors.blue,
                    ),
                    onTap: () {},
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.image,
                    title: 'Upload Banners',
                    trailing: const Icon(
                      Iconsax.arrow_circle_up,
                      color: Colors.blue,
                    ),
                    onTap: () {},
                  ),

                  /// -- Upload Relationship between data
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  const AppSectionHeading(
                    title: 'Relationships ',
                    showActionButton: false,
                  ),
                  Text(
                      'Make sure you have already uploaded all the content above.',
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  AppSettingMenuTile(
                    icon: Iconsax.link,
                    title: 'Upload Brands & Categories Relation Data',
                    trailing: const Icon(
                      Iconsax.arrow_circle_up,
                      color: Colors.blue,
                    ),
                    onTap: () {},
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.link,
                    title: 'Upload Product Categories Relational Data',
                    trailing: const Icon(
                      Iconsax.arrow_circle_up,
                      color: Colors.blue,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
