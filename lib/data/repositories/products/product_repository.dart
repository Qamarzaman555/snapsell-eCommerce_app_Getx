import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/popups/loaders.dart';
import '../categories/firebase_storage_service.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all order related to current User
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final result = await _db.collection('Products').get();
      return result.docs
          .map(
              (documentSnapshot) => ProductModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Banners to the Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Upload all the products along with their Images
      final storage = Get.put(AppFirebaseStorageService());

      // loop though each product
      for (var product in products) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(product.brand!.image);

        // Upload Image and Get its URL
        final url = await storage.uploadImageData(
            'Products', file, product.brand!.image);

        // Assign URL to Banner.image attribute
        product.brand!.image = url;

        // Store Banner in Firebase
        await _db.collection("Products").doc().set(product.toJson());
      }
      AppLoaders.successSnackBar(title: 'Data Uploaded');
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      throw 'Something went wrong. Please try again';
    }
  }
}
