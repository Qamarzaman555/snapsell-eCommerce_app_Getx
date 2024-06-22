import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../common/widgets/texts/product_price_text.dart';
import '../../../../utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: 8,
            separatorBuilder: (_, __) =>
                const SizedBox(height: AppSizes.spaceBtwSections),
            itemBuilder: (_, index) => const Column(
                  children: [
                    AppCartItem(),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 70),

                            /// Add Remove Button
                            AppProductQuantityWithAddRemoveButton(),
                          ],
                        ),
                        AppProductPriceText(
                          price: '256',
                        )
                      ],
                    )
                  ],
                )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: AppSizes.md,
          top: 0,
          bottom: AppSizes.sm,
          right: AppSizes.md,
        ),
        child: ElevatedButton(
            onPressed: () {}, child: const Text('Checkout \$256')),
      ),
    );
  }
}
