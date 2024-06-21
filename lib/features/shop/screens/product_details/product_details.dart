import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../common/widgets/icons/app_circular_icon.dart';
import '../../../../common/widgets/images/app_rounded_image.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'components/product_detail_image_slider.dart';
import 'components/product_meta_data.dart';
import 'components/rating_and_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            AppProductImageSlider(),

            /// 1 - Product Details
            Padding(
              padding: EdgeInsets.only(
                right: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
                left: AppSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// -- Rating & Share Button
                  AppRatingAndShare(),

                  /// -- Price,Title, Stock & Brand
                  AppProductMetaData()

                  /// -- Attributes
                  /// -- Checkout Button
                  /// -- Description
                  /// -- Reviews
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
