import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../utils/device/device_utility.dart';
import 'components/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  const AppHomeAppBar(),

                  /// -- SearchBar
                  Container(
                    width: AppDeviceUtils.getScreenWidth(context),
                  ),

                  /// -- Categories
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
