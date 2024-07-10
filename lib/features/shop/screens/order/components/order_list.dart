import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snapsell/utils/constants/sizes.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/order_controller.dart';

class AppOrderListItems extends StatelessWidget {
  const AppOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = AppHelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUsersOrders(),
        builder: (_, snapshot) {
          // Nothing Found Widget
          final emptyWidget = AppAnimationLoaderWidget(
            text: 'Whoops!, No Orders Yet!',
            animation: AppImages.orderCompletedAnimation,
            showAction: true,
            actionText: 'Let\s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          /// Helper Function: Handle Loader, No Recornd OR Error Message
          final response = AppCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          /// Records Found!
          final orders = snapshot.data!;

          return ListView.separated(
            itemCount: orders.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: AppSizes.spaceBtwItems),
            itemBuilder: (_, index) {
              final order = orders[index];
              return AppRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? AppColors.dark : AppColors.light,
                padding: const EdgeInsets.all(AppSizes.md),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Row 1
                    Row(
                      children: [
                        /// 1 - Icon
                        const Icon(Iconsax.ship),
                        const SizedBox(width: AppSizes.spaceBtwItems / 2),

                        /// 2 - Status & Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(order.orderStatusText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(
                                          color: AppColors.primary,
                                          fontWeightDelta: 1)),
                              Text(order.formattedOrderDate,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall)
                            ],
                          ),
                        ),

                        /// 3 - Icon
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.arrow_right_34,
                            size: AppSizes.iconSm,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBtwItems),

                    /// Row 2
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              /// 1 - Icon
                              const Icon(Iconsax.tag),
                              const SizedBox(width: AppSizes.spaceBtwItems / 2),

                              /// 2 - Status & Date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Order',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                    Text(order.id,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              /// 1 - Icon
                              const Icon(Iconsax.calendar),
                              const SizedBox(width: AppSizes.spaceBtwItems / 2),

                              /// 2 - Status & Date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Shipping Date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                    Text(order.formattedDeliveryDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}
