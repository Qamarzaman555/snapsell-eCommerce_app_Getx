import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/app_circular_icon.dart';
import '../../../../../common/widgets/images/app_rounded_image.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AppProductImageSlider extends StatelessWidget {
  const AppProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return AppCurvedEdgeWidget(
      child: Container(
        color: dark ? AppColors.darkerGrey : AppColors.light,
        child: Stack(
          children: [
            // Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(AppImages.productImage5),
                  ),
                ),
              ),
            ),

            // Image SLider
            Positioned(
              right: 0,
              bottom: 30,
              left: AppSizes.defaultSpace,
              child: SizedBox(
                height: AppDeviceUtils.getScreenWidth(context) * 0.2,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (_, index) => AppRoundedImage(
                    width: AppDeviceUtils.getScreenWidth(context) * 0.2,
                    fit: BoxFit.contain,
                    backgroundColor: dark ? AppColors.dark : AppColors.light,
                    border: Border.all(color: AppColors.primary),
                    padding: const EdgeInsets.all(AppSizes.sm),
                    imageurl: AppImages.productImage3,
                  ),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: AppSizes.spaceBtwItems),
                ),
              ),
            ),

            /// Appbar Icons
            const AppAppBar(
              showBackArrow: true,
              actions: [
                AppCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
