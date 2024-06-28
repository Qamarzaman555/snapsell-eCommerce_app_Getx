import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../common/widgets/shimmers/category_shimmer.dart';
import '../../../controllers/category_controller.dart';
import '../../sub_category/sub_category.dart';

class AppHomeCatergories extends StatelessWidget {
  const AppHomeCatergories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(
      () {
        if (categoryController.isLoading.value) {
          return const AppCategoryShimmer();
        }

        if (categoryController.featuredCategories.isEmpty) {
          return Center(
            child: Text('No Data Found!',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.white)),
          );
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoryController.featuredCategories.length,
              itemBuilder: (_, index) {
                final category = categoryController.featuredCategories[index];
                return AppVerticalImageText(
                  onTap: () => Get.to(() => const SubCategoriesScreen()),
                  image: category.image,
                  title: category.name,
                );
              }),
        );
      },
    );
  }
}
