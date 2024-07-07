import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/variation_controller.dart';
import '../../../models/product_model.dart';

class AppProductAttributes extends StatelessWidget {
  const AppProductAttributes({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = AppHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// -- Selected Attribute Pricing & Description
        // Display variation price and stock when some variation is selected
        Obx(
          () {
            if (controller.selectedVariation.value.id.isNotEmpty) {
              return AppRoundedContainer(
                padding: const EdgeInsets.all(AppSizes.md),
                backgroundColor: dark
                    ? AppColors.darkerGrey
                    : AppColors.darkGrey.withOpacity(0.3),
                child: Column(
                  children: [
                    // Title, Price & Stock Status
                    Row(
                      children: [
                        const AppSectionHeading(
                            title: 'Variation', showActionButton: false),
                        const SizedBox(width: AppSizes.spaceBtwItems),
                        Column(
                          children: [
                            Row(
                              children: [
                                const AppProductTitleText(
                                    title: 'Price : ', smallSize: true),

                                // Actual Price
                                if (controller
                                        .selectedVariation.value.salePrice >
                                    0)
                                  Text(
                                      "\$${controller.selectedVariation.value.price}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .apply(
                                              decoration:
                                                  TextDecoration.lineThrough)),
                                const SizedBox(width: AppSizes.spaceBtwItems),

                                // Actual Price
                                AppProductPriceText(
                                    price: controller.getVariationPrice()),
                              ],
                            ),

                            /// Stock
                            Row(
                              children: [
                                const AppProductTitleText(
                                    title: 'Stock : ', smallSize: true),
                                Text(controller.variationStockStatus.value,
                                    style:
                                        Theme.of(context).textTheme.titleMedium)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    // Variation Description
                    AppProductTitleText(
                      title: product.description ?? '',
                      smallSize: true,
                      maxLines: 4,
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!
              .map((attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSectionHeading(
                          title: attribute.name ?? '', showActionButton: false),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map(
                            (attributeValue) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;
                              final available = controller
                                  .getAttributeAvailablilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);
                              return AppChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                              product,
                                              attribute.name ?? '',
                                              attributeValue);
                                        }
                                      }
                                    : null,
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ],
    );
  }
}
