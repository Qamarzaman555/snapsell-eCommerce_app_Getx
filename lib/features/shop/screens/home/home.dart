import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'components/home_appbar.dart';
import 'components/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  AppHomeAppBar(),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  /// -- SearchBar
                  AppSearchContainer(text: "Search in store"),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  /// -- Categories
                  Padding(
                    padding: EdgeInsets.only(left: AppSizes.defaultSpace),
                    child: Column(
                      children: [
                        // -- Heading
                        AppSectionHeading(
                          title: "Popular Categories",
                          textColor: AppColors.light,
                          showActionButton: false,
                        ),
                        SizedBox(height: AppSizes.spaceBtwItems),

                        /// Scrollable Categories
                        AppHomeCatergories(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
