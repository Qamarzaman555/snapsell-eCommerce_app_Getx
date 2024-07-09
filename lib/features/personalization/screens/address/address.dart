import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/address_controller.dart';
import 'add_new_address.dart';
import 'components/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: AppAppBar(
          title: Text('Addresses',
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                // Use key to trigger refresh
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  // Handle Loader, No Record, OR Error Message
                  final reponse = AppCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot);
                  if (reponse != null) return reponse;

                  // Record Found!
                  final addresses = snapshot.data!;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (_, index) {
                        return AppSingleAddress(
                          address: addresses[index],
                          onTap: () =>
                              controller.selectAddress(addresses[index]),
                        );
                      });
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          child: const Icon(Iconsax.add, color: AppColors.white),
          onPressed: () => Get.to(() => const AddNewAddressScreen())),
    );
  }
}
