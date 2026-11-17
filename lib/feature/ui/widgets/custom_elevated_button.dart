
import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? imageIconName;
  final IconData? iconData;
  final String? text;
  final TextStyle? textStyle;

  final Color? bgColor;
  final Color? borderColor;
  final Color? iconColor;

  final VoidCallback? onPressed;

  final bool hasIcon;
  final bool hasBorder;

  final double? radius;
  final double? iconSize;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.imageIconName,
    this.iconData,
    this.bgColor,
    this.radius,
    this.borderColor,
    this.iconColor,
    this.iconSize,
    this.hasBorder = false,
    this.hasIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? AppColors.transparent,
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 15.r),
          side: hasBorder
              ? BorderSide(
                  color: borderColor ?? Colors.transparent,
                  width: 2,
                )
              : BorderSide.none,
        ),
      ),
      child: hasIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (imageIconName != null)
                  Image.asset(
                    imageIconName!,
                    width: iconSize ?? 22.r,
                    height: iconSize ?? 22.r,
                    fit: BoxFit.contain,
                  )
                else if (iconData != null)
                  Icon(
                    iconData,
                    size: iconSize ?? 22.r,
                    color: iconColor,
                  ),

                if (imageIconName != null || iconData != null)
                  SizedBox(width: 10.w),

                Text(
                  text ?? '',
                  style: textStyle ?? AppStyle.bold16LightBlack,
                ),
              ],
            )
          : Text(
              text ?? '',
              style: textStyle ?? AppStyle.bold16LightBlack,
            ),
    );
  }
}
