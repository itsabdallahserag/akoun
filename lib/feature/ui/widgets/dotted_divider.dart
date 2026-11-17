import 'package:akoun/core/app_colors.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DottedDivider extends StatelessWidget {
  final Color? color;
  final double? height;
  final double strokeWidth;
  final List<int> dash;

  const DottedDivider({
    super.key,
    this.color,
    this.height,
    this.strokeWidth = 1.5,
    this.dash = const <int>[6, 4],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 2.h,
      decoration: DottedDecoration(
        shape: Shape.line,
        linePosition: LinePosition.bottom,
        color: color ?? AppColors.disabled,
        strokeWidth: strokeWidth,
        dash: dash,
      ),
    );
  }
}
