import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'add_new_address.dart';
import 'components/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          child: const Icon(Iconsax.add, color: AppColors.white),
          onPressed: () => Get.to(() => const AddNewAddressScreen())),
      appBar: AppAppBar(
          title: Text('Addresses',
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              AppSingleAddress(selectedAddress: false),
              AppSingleAddress(selectedAddress: true),
            ],
          ),
        ),
      ),
    );
  }
}
