import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/home/islands/islandLetters/pronunciation_screen.dart';
import 'package:akoun/feature/ui/widgets/custom_elevated_button.dart';
import 'package:akoun/feature/ui/widgets/lesson_widgets.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberScreen extends StatelessWidget {
  const RememberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return LessonScaffold(
      title: l10n.remember,
      bottom: SizedBox(
        width: double.infinity,
        height: 80.h,
        child: CustomElevatedButton(
          bgColor: AppColors.darkBlue4,
          radius: 40.r,
          text: l10n.continueText,
          textStyle: AppStyle.bold20White,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => PronunciationScreen()),
            );
          },
        ),
      ),
      // TODO: Navigator.push(... PronunciationScreen)
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: double.infinity,
              height: 315.w,
              padding: EdgeInsets.fromLTRB(16.w, 45.h, 16.w, 36.h),
              decoration: BoxDecoration(
                color: AppColors.letterCard,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.accent),
              ),
              child: Text(l10n.rememberText, style: AppStyle.regular36Black),
            ),
            // زرار الصوت على الحافة السفلية للبطاقة
            Positioned(bottom: 240.h, child: SoundButton()),
          ],
        ),
      ),
    );
  }
}
