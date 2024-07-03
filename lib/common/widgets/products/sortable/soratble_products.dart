import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product_controller.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class AppSortableProducts extends StatelessWidget {
  const AppSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Column(
      children: [
        /// DropDown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: AppSizes.spaceBtwSections),

        ///Products
        AppGridLayout(
          itemCount: 8,
          minAxisExtent: AppDeviceUtils.getScreenHeight() * 0.33,
          itemBuilder: (_, index) => AppProductCardVertical(
              product: controller.featuredProducts[index]),
        )
      ],
    );
  }
}
