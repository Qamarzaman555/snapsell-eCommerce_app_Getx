import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/address_controller.dart';
import '../../../models/address_model.dart';

class AppSingleAddress extends StatelessWidget {
  const AppSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = AppHelperFunctions.isDarkMode(context);
    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;
        return InkWell(
          onTap: onTap,
          child: AppRoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(AppSizes.md),
            width: double.infinity,
            backgroundColor: selectedAddress
                ? AppColors.primary.withOpacity(0.5)
                : Colors.transparent,
            borderColor: selectedAddress
                ? Colors.transparent
                : dark
                    ? AppColors.darkerGrey
                    : AppColors.grey,
            margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  top: 0,
                  child: Icon(
                    selectedAddress ? Iconsax.tick_circle5 : null,
                    color: selectedAddress
                        ? dark
                            ? AppColors.light
                            : AppColors.dark.withOpacity(0.6)
                        : null,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: AppSizes.sm / 2),
                    Text(
                      address.formattedPhoneNo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSizes.sm / 2),
                    Text(
                      address.toString(),
                      softWrap: true,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
