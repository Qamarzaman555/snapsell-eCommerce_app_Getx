import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/cart_controller.dart';

class AppCartItems extends StatelessWidget {
  const AppCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
          shrinkWrap: true,
          itemCount: cartController.cartItems.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: AppSizes.spaceBtwSections),
          itemBuilder: (_, index) => Obx(
                () {
                  final item = cartController.cartItems[index];
                  return Column(
                    children: [
                      /// Card Item
                      AppCartItem(cartItem: item),
                      if (showAddRemoveButton)
                        const SizedBox(height: AppSizes.spaceBtwItems),

                      /// Add Remove Button Row with total Price
                      if (showAddRemoveButton)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                /// Extra Space
                                const SizedBox(width: 70),

                                /// Add Remove Button
                                AppProductQuantityWithAddRemoveButton(
                                  quantity: item.quantity,
                                  add: () => cartController.addOneToCart(item),
                                  remove: () =>
                                      cartController.removeOneFromCart(item),
                                ),
                              ],
                            ),

                            /// Product Total Price
                            AppProductPriceText(
                              price: (item.price * item.quantity)
                                  .toStringAsFixed(1),
                            )
                          ],
                        )
                    ],
                  );
                },
              )),
    );
  }
}
