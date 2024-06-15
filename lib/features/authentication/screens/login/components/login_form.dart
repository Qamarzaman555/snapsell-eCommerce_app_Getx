import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class AppLoginForm extends StatelessWidget {
  const AppLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                  labelStyle: TextStyle(fontWeight: FontWeight.w600),
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: AppText.email),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),

            // Password
            TextFormField(
              decoration: const InputDecoration(
                  labelStyle: TextStyle(fontWeight: FontWeight.w600),
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: AppText.password,
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields / 2),

            // Remember Me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(AppText.rememberMe)
                  ],
                ),

                // Forget Password

                TextButton(
                    onPressed: () {}, child: const Text(AppText.forgotPassword))
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            // Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text(AppText.signIn))),
            const SizedBox(height: AppSizes.spaceBtwItems),

            // Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(AppText.createAccount))),
          ],
        ),
      ),
    );
  }
}
