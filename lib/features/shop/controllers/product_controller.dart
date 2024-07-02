import 'package:get/get.dart';

import '../../../data/repositories/products/product_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/product_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final isLoading = false.obs;
  final _productRepository = Get.put(ProductRepository());
  RxList<ProductModel> allProducts = <ProductModel>[].obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  /// -- Load catergory data
  Future<void> fetchProducts() async {
    try {
      // Show loader while loading products
      isLoading.value = true;

      //  Fetch products from data source (Firestore,API etc)
      final products = await _productRepository.getAllProducts();

      // Update the products list
      allProducts.assignAll(products);

      // filter featured products
      featuredProducts.assignAll(
        featuredProducts
            .where((product) => product.isFeatured ?? false)
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

  /// -- Load selected product data
  /// Get Category or Sub-Category Products
}
