import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import 'components/order_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: AppAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child:

            /// -- Orders
            AppOrderListItems(),
      ),
    );
  }
}
