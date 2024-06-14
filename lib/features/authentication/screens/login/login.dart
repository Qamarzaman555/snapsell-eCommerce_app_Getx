import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: AppSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          children: [
            // Logo,Title and Sub-Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  height: 150,
                  image: AssetImage(
                      dark ? AppImages.darkAppLogo : AppImages.lightAppLogo),
                ),
                Text(AppText.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: AppSizes.sm),
                Text(AppText.loginSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),

            // Form
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.spaceBtwSections),
                child: Column(
                  children: [
                    // Email
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: AppText.email),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwInputFields),

                    // Password
                    TextFormField(
                      decoration: const InputDecoration(
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
                            onPressed: () {},
                            child: const Text(AppText.forgotPassword))
                      ],
                    ),
                    const SizedBox(height: AppSizes.spaceBtwSections),

                    // Sign In Button
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(AppText.signIn))),
                    const SizedBox(height: AppSizes.spaceBtwItems),

                    // Create Account Button
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () {},
                            child: const Text(AppText.createAccount))),
                    const SizedBox(height: AppSizes.spaceBtwSections),
                  ],
                ),
              ),
            ),

            // Divider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(
                  color: dark ? AppColors.darkGrey : AppColors.grey,
                  thickness: 0.5,
                  indent: 60,
                  endIndent: 5,
                ),
              ],
            )

            // Footer
          ],
        ),
      ),
    ));
  }
}
