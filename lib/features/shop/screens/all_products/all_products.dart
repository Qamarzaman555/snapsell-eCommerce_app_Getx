import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/soratble_products.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/product/all_products_controller.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
    required this.title,
    this.query,
    this.futureMethod,
  });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product fetching.
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: AppAppBar(
          showBackArrow: true,
          title: Text(title, style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: FutureBuilder<List<ProductModel>>(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                // Check the state of FutureBuilder snapshot
                const loader = AppVerticalProductShimmer();
                final widget = AppCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);

                // Return aprropriate widget on snapshot state
                if (widget != null) return widget;

                // Products found!
                final products = snapshot.data!;
                return AppSortableProducts(
                  products: products,
                );
              }),
        ),
      ),
    );
  }
}
