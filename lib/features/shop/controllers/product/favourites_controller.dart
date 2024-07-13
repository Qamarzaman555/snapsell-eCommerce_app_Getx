import 'dart:convert';

import 'package:get/get.dart';

import '../../../../data/repositories/products/product_repository.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/product_model.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  /// Variables
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  // Method to initialize favourites by reading from storages
  void initFavourites() {
    final json = AppLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      AppLoaders.customToast(
          message: 'Product has been added to the wishlist.');
    } else {
      AppLocalStorage.instance().readData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      AppLoaders.customToast(
          message: 'Product has been removed to the wishlist.');
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    AppLocalStorage.instance().writeData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    if (favourites.isEmpty) return [];
    return await ProductRepository.instance
        .getFavouriteProducts(favourites.keys.toList());
  }
}
