import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../sub_category/sub_category.dart';

class AppHomeCatergories extends StatelessWidget {
  const AppHomeCatergories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (_, index) {
            return AppVerticalImageText(
              onTap: () => Get.to(() => const SubCategoriesScreen()),
              image: AppImages.shoeIcon,
              title: "Shoes Catergory",
            );
          }),
    );
  }
}
