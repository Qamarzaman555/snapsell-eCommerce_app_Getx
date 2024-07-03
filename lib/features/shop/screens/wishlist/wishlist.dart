import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snapsell/common/widgets/layouts/grid_layout.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/icons/app_circular_icon.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../controllers/product_controller.dart';
import '../home/home.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Scaffold(
      appBar: AppAppBar(
        title: Text('Widhlist', style: Theme.of(context).textTheme.labelMedium),
        actions: [
          AppCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(
              const HomeScreen(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              AppGridLayout(
                  minAxisExtent: AppDeviceUtils.getScreenHeight() * 0.34,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return AppProductCardVertical(
                        product: controller.featuredProducts[index]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
