import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'terms_and_conditions.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    label: Text(AppText.firstName),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    label: Text(AppText.lastName),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              label: Text(AppText.username),
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              label: Text(AppText.email),
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Password
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                label: Text(AppText.password),
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),

          AppTermsAndConditions(),
        ],
      ),
    );
  }
}
