import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/app_rounded_image.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
          showBackArrow: true,
          title: Text('Sports Shirt',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const AppRoundedImage(
                width: double.infinity,
                imageurl: AppImages.promoBanner4,
                applyImageRadius: true,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// Sub-Catergies
              Column(
                children: [
                  /// Heading
                  AppSectionHeading(
                    title: 'Sports shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) =>
                          const AppProductCarHorizontal(),
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: AppSizes.spaceBtwItems),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
