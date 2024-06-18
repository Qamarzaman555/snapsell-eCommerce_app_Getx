import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapsell/utils/constants/sizes.dart';
import 'package:snapsell/utils/constants/text_strings.dart';

import '../../../../common/widgets/login_signup/app_form_divider.dart';
import '../../../../common/widgets/login_signup/social_btns.dart';
import 'components/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // Title
              Text(AppText.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Form
              const SignUpForm(),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Terms&Conditions Checkbox

              // Sign Up Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(AppText.createAccount))),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Divider
              AppFormDivider(dividerText: AppText.orSignInWith.capitalize!),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Footer
              const AppSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
