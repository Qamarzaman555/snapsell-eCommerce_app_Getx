import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../personalization/controllers/address_controller.dart';

class AppBillingAddressSection extends StatelessWidget {
  const AppBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    final selectedAddressId = addressController.selectedAddress.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () => addressController.selectNewAddressPopup(context),
        ),
        if (addressController.selectedAddress.value.id.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(selectedAddressId.name,
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              Row(
                children: [
                  const Icon(Icons.phone, color: AppColors.grey, size: 16),
                  const SizedBox(width: AppSizes.spaceBtwItems),
                  Text(selectedAddressId.formattedPhoneNo,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              Row(
                children: [
                  const Icon(Icons.location_history,
                      color: AppColors.grey, size: 16),
                  const SizedBox(width: AppSizes.spaceBtwItems),
                  Text(
                    selectedAddressId.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                    softWrap: true,
                  ),
                ],
              ),
            ],
          )
        else
          Text('Select Address', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
