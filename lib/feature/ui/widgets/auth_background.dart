import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_image.dart';
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  final Color? gradientStartColor;

  const AuthBackground({
    super.key,
    required this.child,
    this.gradientStartColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الخلفية
        Positioned.fill(
          child: Image.asset(
            AppImage.bgAuthAkon,
            fit: BoxFit.cover,
          ),
        ),

        // التدرج الأبيض
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  gradientStartColor ?? AppColors.primary90,
                  AppColors.transparent,
                ],
              ),
            ),
          ),
        ),

        // المحتوى
        child,
      ],
    );
  }
}
