import 'package:akoun/core/app_image.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/widgets/register_widgets/dialect_card.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterDialectSection extends StatelessWidget {
  final int selectedDialect;
  final ValueChanged<int> onDialectSelected;

  const RegisterDialectSection({
    super.key,
    required this.selectedDialect,
    required this.onDialectSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.chooseDialect, style: AppStyle.bold16darkCerulean),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: DialectCard(
                image: AppImage.avatarGulf,
                label: l10n.dialectGulf,
                isSelected: selectedDialect == 0,
                onTap: () => onDialectSelected(0),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: DialectCard(
                image: AppImage.avatarEgyptian,
                label: l10n.dialectEgyptian,
                isSelected: selectedDialect == 1,
                onTap: () => onDialectSelected(1),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: DialectCard(
                image: AppImage.avatarStandard,
                label: l10n.dialectStandard,
                isSelected: selectedDialect == 2,
                onTap: () => onDialectSelected(2),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
