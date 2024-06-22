import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AppBillingPaymentSection extends StatelessWidget {
  const AppBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        AppSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            AppRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? AppColors.light : AppColors.white,
              padding: const EdgeInsets.all(AppSizes.sm),
              child: const Image(
                image: AssetImage(AppImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems / 2),
            Text('PayPal', style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
