import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class AppCartItems extends StatelessWidget {
  const AppCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: 2,
        separatorBuilder: (_, __) =>
            const SizedBox(height: AppSizes.spaceBtwSections),
        itemBuilder: (_, index) => Column(
              children: [
                /// Card Item
                const AppCartItem(),
                if (showAddRemoveButton)
                  const SizedBox(height: AppSizes.spaceBtwItems),

                /// Add Remove Button Row with total Price
                if (showAddRemoveButton)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          /// Extra Space
                          SizedBox(width: 70),

                          /// Add Remove Button
                          AppProductQuantityWithAddRemoveButton(),
                        ],
                      ),

                      /// Product Total Price
                      AppProductPriceText(
                        price: '256',
                      )
                    ],
                  )
              ],
            ));
  }
}
