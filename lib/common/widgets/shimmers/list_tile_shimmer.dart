import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'shimmer.dart';

class AppListTileShimmer extends StatelessWidget {
  const AppListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            AppShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: AppSizes.spaceBtwItems),
            Column(
              children: [
                AppShimmerEffect(width: 100, height: 15),
                SizedBox(width: AppSizes.spaceBtwItems / 2),
                AppShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
