import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/app_rounded_image.dart';
import '../../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/banner_controller.dart';

class AppPromoSlider extends StatelessWidget {
  const AppPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return SizedBox(
      width: double.infinity,
      child: Obx(() {
        // Loader
        if (controller.isLoading.value) {
          return const AppShimmerEffect(
            width: double.infinity,
            height: 190,
          );
        }

        // No Data Found
        if (controller.banners.isEmpty) {
          return const Center(
            child: Text('No Data Found'),
          );
        }
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
              ),
              items: controller.banners
                  .map((banner) => AppRoundedImage(
                      imageurl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen)))
                  .toList(),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    AppCircularContainer(
                      width: 20,
                      height: 4,
                      backgroundColor:
                          controller.carousalCurrentIndex.value == i
                              ? AppColors.primary
                              : AppColors.grey,
                      margin: const EdgeInsets.only(right: 10),
                    ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
