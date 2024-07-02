import 'package:get/get.dart';

import '../../../data/repositories/brands/brand_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/brands_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final isLoading = false.obs;
  final _brandRepository = Get.put(BrandRepository());
  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  @override
  void onInit() {
    fetchBrands();
    super.onInit();
  }

  /// -- Load catergory data
  Future<void> fetchBrands() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      //  Fetch categories from data source (Firestore,API etc)
      final categories = await _brandRepository.getAllBrands();

      // Update the categories list
      allBrands.assignAll(categories);

      // filter featured categories
      featuredBrands.assignAll(
        featuredBrands
            .where((category) => category.isFeatured)
            .take(8)
            .toList(),
      );
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  /// -- Load selected category data
  /// Get Category or Sub-Category Products
}
