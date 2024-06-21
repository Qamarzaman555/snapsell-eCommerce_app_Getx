import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class AppRatingAndShare extends StatelessWidget {
  const AppRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Rating
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: AppSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '5.0 ',
                      style: Theme.of(context).textTheme.bodyMedium),
                  TextSpan(
                      text: '(199)',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            )
          ],
        ),

        // Share Button
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.share, size: AppSizes.md)),
      ],
    );
  }
}
