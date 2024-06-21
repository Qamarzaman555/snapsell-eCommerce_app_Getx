import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';

class AppSettingMenuTile extends StatelessWidget {
  const AppSettingMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: AppColors.primary,
      ),
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(color: AppColors.white)),
      subtitle: Text(subtitle,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .apply(color: AppColors.white)),
      trailing: trailing,
    );
  }
}
