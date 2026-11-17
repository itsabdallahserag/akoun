import 'package:akoun/core/app_colors.dart';
import 'package:akoun/feature/ui/widgets/auth_floating_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthCard extends StatelessWidget {
  final Widget child;

  const AuthCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 15.h),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 35.h),
          decoration: BoxDecoration(
            color: AppColors.softCream,
            border: Border.all(color: AppColors.white, width: 6),
            borderRadius: BorderRadius.circular(48.r),
          ),
          child: child,
        ),
        Positioned(
          top: -10.r,
          right: -10.r,
          child: const AuthFloatingBadge(),
        ),
      ],
    );
  }
}
