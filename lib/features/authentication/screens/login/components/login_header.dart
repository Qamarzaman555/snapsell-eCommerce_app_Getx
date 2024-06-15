import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AppLoginHeader extends StatelessWidget {
  const AppLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 120,
          image:
              AssetImage(dark ? AppImages.darkAppLogo : AppImages.lightAppLogo),
        ),
        Text(AppText.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: AppSizes.sm),
        Text(AppText.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
