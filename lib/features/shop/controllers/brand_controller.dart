import 'package:get/get.dart';

import '../../../data/repositories/brands/brand_repository.dart';
import '../../../data/repositories/products/product_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/brands_model.dart';
import '../models/product_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final isLoading = false.obs;
  final _brandRepository = Get.put(BrandRepository());
  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// -- Load brand data
  Future<void> getFeaturedBrands() async {
    try {
      // Show loader while loading brand
      isLoading.value = true;

      //  Fetch brand from data source (Firestore,API etc)
      final brands = await _brandRepository.getAllBrands();

      // Update the brand list
      allBrands.assignAll(brands);

      // filter featured brand
      featuredBrands.assignAll(
        allBrands.where((brand) => brand.isFeatured ?? false).take(4).toList(),
      );
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  /// Get Brand For Category
  /// Get Brand Specific Products from your data source
  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrand(brandId: brandId);
      return products;
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
