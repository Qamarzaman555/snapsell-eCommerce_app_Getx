import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../utils/constants/sizes.dart';
import 'components/rating_progress_indicator.dart';
import 'components/user_review_card.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: AppAppBar(
          title: Text('Reviews & Ratings',
              style: Theme.of(context).textTheme.headlineMedium),
          showBackArrow: true),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people who use the same type od device that you use.'),
              const SizedBox(height: AppSizes.spaceBtwItems),

              /// Overall Product Ratings
              const AppOverallProductRating(),
              const AppRatingBarIndicator(rating: 4.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// User Reviews
              for (int i = 0; i < 4; i++) const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
