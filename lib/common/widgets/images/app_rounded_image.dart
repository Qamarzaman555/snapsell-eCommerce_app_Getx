import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class AppRoundedImage extends StatelessWidget {
  const AppRoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width,
    this.height,
    this.applyImageRadius = true,
    required this.imageurl,
    this.fit = BoxFit.contain,
    this.backgroundColor,
    this.isNetworkImage = false,
    this.borderRadius = AppSizes.md,
  });

  final double? width, height;
  final String imageurl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
              image: isNetworkImage
                  ? NetworkImage(imageurl)
                  : AssetImage(imageurl) as ImageProvider,
              fit: fit,
            )),
      ),
    );
  }
}
