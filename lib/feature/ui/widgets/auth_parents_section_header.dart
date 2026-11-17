import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_image.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthParentsSectionHeader extends StatelessWidget {
  const AuthParentsSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Row(
      children: [
        ImageIcon(
          AssetImage(AppImage.iconPerson),
          color: AppColors.brown,
          size: 24.r,
        ),
        SizedBox(width: 8.w),
        Text(
          l10n.parentsSection,
          style: AppStyle.bold16TextPrimay,
        ),
      ],
    );
  }
}
