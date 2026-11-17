import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/widgets/register_widgets/language_chip.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterLanguageSection extends StatelessWidget {
  final int selectedLanguage;
  final ValueChanged<int> onLanguageSelected;

  const RegisterLanguageSection({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.chooseLanguage, style: AppStyle.bold16darkCerulean),
        SizedBox(height: 12.h),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 12.w,
          runSpacing: 12.h,
          children: [
            LanguageChip(
              label: l10n.languageArabic,
              isSelected: selectedLanguage == 0,
              onTap: () => onLanguageSelected(0),
            ),
            LanguageChip(
              label: l10n.languageEnglish,
              isSelected: selectedLanguage == 1,
              onTap: () => onLanguageSelected(1),
            ),
            LanguageChip(
              label: l10n.languageTurkish,
              isSelected: selectedLanguage == 2,
              onTap: () => onLanguageSelected(2),
            ),
            LanguageChip(
              label: l10n.languageUrdu,
              isSelected: selectedLanguage == 3,
              onTap: () => onLanguageSelected(3),
            ),
          ],
        ),
      ],
    );
  }
}
