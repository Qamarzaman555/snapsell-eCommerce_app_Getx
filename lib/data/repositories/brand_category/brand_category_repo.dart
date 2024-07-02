import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_category_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/popups/loaders.dart';

class BrandCategoryRepository extends GetxController {
  static BrandCategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Upload Banners to the Cloud Firebase
  Future<void> uploadDummyData(List<BrandCategoryModel> brandCategories) async {
    try {
      // loop though each brandCategory
      for (var brandCategory in brandCategories) {
        await _db.collection("BrandCategory").doc().set(brandCategory.toJson());
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
