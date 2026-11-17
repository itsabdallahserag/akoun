import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthFloatingBadge extends StatelessWidget {
  const AuthFloatingBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50.r,
      height: 50.r,
      decoration: const BoxDecoration(
        color: AppColors.accent,
        shape: BoxShape.circle,
      ),
      child: Transform.rotate(
        angle: 12 * (3.1415926535 / 180),
        child: Image.asset(
          AppImage.iconFace,
          color: AppColors.brown,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
