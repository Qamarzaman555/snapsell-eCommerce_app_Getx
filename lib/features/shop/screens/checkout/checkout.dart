import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';

import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/helpers/pricing_calculator.dart';
import '../../../../utils/popups/loaders.dart';
import '../../controllers/product/cart_controller.dart';
import '../../controllers/product/order_controller.dart';
import '../cart/components/cart_items.dart';
import 'components/billing_address_section.dart';
import 'components/billing_amount_section.dart';
import 'components/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount =
        AppPricingCalculator.calculateTotalPrice(subTotal, 'US');
    return Scaffold(
      appBar: AppAppBar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              const AppCartItems(showAddRemoveButton: false),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// -- Coupon TextField
              const AppCouponCode(),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// -- Billing Section
              AppRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(AppSizes.md),
                backgroundColor: dark ? AppColors.black : AppColors.white,
                child: const Column(
                  children: [
                    // Pricing
                    AppBillingAmountSection(),
                    SizedBox(height: AppSizes.spaceBtwItems),

                    // Divider
                    Divider(),
                    SizedBox(height: AppSizes.spaceBtwItems),

                    // Payment Methods
                    AppBillingPaymentSection(),
                    SizedBox(height: AppSizes.spaceBtwItems),

                    // Address
                    AppBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: AppSizes.md,
          top: 0,
          bottom: AppSizes.sm,
          right: AppSizes.md,
        ),
        child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => AppLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add  items in the cart in order to proceed.'),
            child: Text('Checkout \$$totalAmount')),
      ),
    );
  }
}
