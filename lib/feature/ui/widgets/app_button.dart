import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isLoading;

  static const double _height = 80;
  static const double _depth = 8; // سمك الحافة السفلية
  static const double _radius = 48;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: _depth),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(_radius),
          boxShadow: const [
            BoxShadow(color: AppColors.brown, offset: Offset(0, _depth)),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isLoading ? null : onPressed,
            borderRadius: BorderRadius.circular(_radius),
            child: SizedBox(
              height: _height,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isLoading)
                    const SizedBox(
                      width: 32,
                      height: 32,
                      child: CircularProgressIndicator(
                        color: AppColors.brown,
                        strokeWidth: 3.5,
                      ),
                    )
                  else ...[
                    Text(label, style: AppStyle.bold30Brown),
                    SizedBox(width: 16.w),
                    if (icon != null) ...[
                      Icon(icon, size: 30, color: AppColors.brown),
                    ],
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
