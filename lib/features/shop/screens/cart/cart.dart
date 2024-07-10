import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/cart_controller.dart';
import '../checkout/checkout.dart';
import 'components/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: AppAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(
        () {
          /// Nothing Found Widget
          final emptyWidget = AppAnimationLoaderWidget(
            text: 'Whoops! Cart is EMPTY.',
            animation: AppImages.cartAnimation,
            showAction: true,
            actionText: 'Let\s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );
          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(AppSizes.defaultSpace),

                /// -- Items in cart
                child: AppCartItems(),
              ),
            );
          }
        },
      ),

      /// Checkout Button
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.md,
                top: 0,
                bottom: AppSizes.sm,
                right: AppSizes.md,
              ),
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckoutScreen()),
                  child: Obx(() =>
                      Text('Checkout \$${controller.totalCartPrice.value}'))),
            ),
    );
  }
}
