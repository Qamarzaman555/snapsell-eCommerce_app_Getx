import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/text_strings.dart';
import '../controllers.onboarding/onboarding_controller.dart';
import 'components/onboarding_navigation.dart';
import 'components/onboarding_next.dart';
import 'components/onboarding_page.dart';
import 'components/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: AppImageStrings.onBoardingImage1,
                title: AppTextStrings.onBoardingTitle1,
                subTitle: AppTextStrings.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: AppImageStrings.onBoardingImage2,
                title: AppTextStrings.onBoardingTitle2,
                subTitle: AppTextStrings.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: AppImageStrings.onBoardingImage3,
                title: AppTextStrings.onBoardingTitle3,
                subTitle: AppTextStrings.onBoardingSubTitle3,
              ),
            ],
          ),
          // Skip Button
          const OnBoardingSkip(),
          // Dot Navigation SmoothPageIndicator
          const OnBoardingNavigation(),
          // Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
