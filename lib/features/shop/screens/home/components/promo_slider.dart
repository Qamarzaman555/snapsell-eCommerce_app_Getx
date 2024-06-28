import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/app_rounded_image.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/home_controller.dart';

class AppPromoSlider extends StatelessWidget {
  const AppPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => AppRoundedImage(imageurl: url)).toList(),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                AppCircularContainer(
                  width: 20,
                  height: 4,
                  backgroundColor: controller.carousalCurrentIndex.value == i
                      ? AppColors.primary
                      : AppColors.grey,
                  margin: const EdgeInsets.only(right: 10),
                ),
            ],
          ),
        )
      ],
    );
  }
}
