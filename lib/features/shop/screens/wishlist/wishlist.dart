import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snapsell/common/widgets/layouts/grid_layout.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/icons/app_circular_icon.dart';
import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/product/favourites_controller.dart';
import '../home/home.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
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
              Obx(
                () => FutureBuilder(
                    future: controller.favouriteProducts(),
                    builder: (context, snapshot) {
                      // Nothing Found Widget
                      final emptyWidget = AppAnimationLoaderWidget(
                        text: 'Whoops! Wishlist is Empty...',
                        animation: AppImages.pencilAnimation,
                        showAction: true,
                        actionText: 'Let\'s add some',
                        onActionPressed: () =>
                            Get.off(() => const NavigationMenu()),
                      );
                      const loader = AppVerticalProductShimmer(itemCount: 6);
                      final widget =
                          AppCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: loader,
                              nothingFound: emptyWidget);
                      if (widget != null) return widget;

                      // Records Found!
                      final products = snapshot.data!;
                      return AppGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) {
                            return AppProductCardVertical(
                                product: products[index]);
                          });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
