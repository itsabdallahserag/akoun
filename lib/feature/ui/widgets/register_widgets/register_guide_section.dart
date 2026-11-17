import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_image.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/widgets/dotted_divider.dart';
import 'package:akoun/feature/ui/widgets/register_widgets/guide_option_card.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterGuideSection extends StatelessWidget {
  final bool isFemale;
  final ValueChanged<bool> onGuideSelected;

  const RegisterGuideSection({
    super.key,
    required this.isFemale,
    required this.onGuideSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const DottedDivider(),
            Container(
              color: AppColors.softCream,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImage.iconProfile, width: 22.r, height: 22.r),
                  SizedBox(width: 8.w),
                  Text(l10n.guideData, style: AppStyle.bold16LightBlue2),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        Center(
          child: Text(l10n.chooseGuide, style: AppStyle.regular10LightGray),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: GuideOptionCard(
                image: AppImage.femaleTeacher,
                title: l10n.femaleTeacher,
                subtitle: l10n.female,
                color: AppColors.pink,
                isSelected: isFemale,
                onTap: () => onGuideSelected(true),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: GuideOptionCard(
                image: AppImage.maleTeacher,
                title: l10n.maleTeacher,
                subtitle: l10n.male,
                color: AppColors.blue,
                isSelected: !isFemale,
                onTap: () => onGuideSelected(false),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
