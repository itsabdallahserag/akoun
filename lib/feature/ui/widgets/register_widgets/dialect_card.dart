import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialectCard extends StatelessWidget {
  const DialectCard({
    super.key,
    required this.image,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String image;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 7.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.green : AppColors.white,
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(
            color: isSelected ? AppColors.forestGreen : AppColors.disabled,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.lightWhite,
              radius: 32.r,
              backgroundImage: AssetImage(image),
            ),
            SizedBox(height: 8.h),
            Text(label, style: AppStyle.bold14TextPrimary),
          ],
        ),
      ),
    );
  }
}
