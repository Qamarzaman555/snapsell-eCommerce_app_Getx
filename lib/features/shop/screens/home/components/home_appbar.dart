import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class AppHomeAppBar extends StatelessWidget {
  const AppHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppText.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: AppColors.white)),
          Text(AppText.homeAppbarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: AppColors.light)),
        ],
      ),
      actions: const [
        AppCartCounter(iconColor: AppColors.light),
      ],
    );
  }
}
