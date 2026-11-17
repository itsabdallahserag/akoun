import 'package:akoun/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageChip extends StatelessWidget {
  const LanguageChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.steelBlue2 : AppColors.floralWhite2,
          borderRadius: BorderRadius.circular(9999.r),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppColors.midnightTeal
                  : AppColors.lightSlateGray,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: isSelected ? AppColors.prussianBlue : AppColors.lightBlack2,
          ),
        ),
      ),
    );
  }
}
