import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'components/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      /// --  Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const AppCircularImage(
                      image: AppImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// -- Details
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),

              const AppSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwItems),

              // Heading Profile Indo
              AppProfileMenu(
                title: 'Name',
                value: 'Qamar Zaman',
                onPressed: () {},
              ),
              AppProfileMenu(
                title: 'Username',
                value: 'qamar_zk',
                onPressed: () {},
              ),

              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),

              // Heading Personal Info
              AppProfileMenu(
                title: 'User ID',
                value: '46678',
                onPressed: () {},
              ),
              AppProfileMenu(
                title: 'E-mail',
                value: 'qamar@gmail.com',
                onPressed: () {},
              ),
              AppProfileMenu(
                title: 'Phone Number',
                value: '03039811299',
                onPressed: () {},
              ),
              AppProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              AppProfileMenu(
                title: 'Date of Birth',
                value: '21 Jan, 1999',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),

              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
