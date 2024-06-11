import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/authentication/screens/onboarding.dart';
import 'utils/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
