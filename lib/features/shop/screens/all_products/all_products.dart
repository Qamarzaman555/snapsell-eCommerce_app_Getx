import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
          showBackArrow: true,
          title: Text('Popular Products',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// DropDown
              DropdownButtonFormField(
                decoration:
                    const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
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
                itemBuilder: (_, index) => const AppProductCardVertical(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
