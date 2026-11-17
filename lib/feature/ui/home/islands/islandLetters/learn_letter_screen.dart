import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_image.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/home/islands/islandLetters/remember_screen.dart';
import 'package:akoun/feature/ui/widgets/custom_elevated_button.dart';
import 'package:akoun/feature/ui/widgets/lesson_widgets.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LearnLetterScreen extends StatelessWidget {
  const LearnLetterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return LessonScaffold(
      title: l10n.learnLetter,
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
              MaterialPageRoute(builder: (_) => RememberScreen()),
            );
          },
        ),
      ),

      /*  */
      // TODO: Navigator.push(... RememberScreen)
      body: Padding(
        padding: EdgeInsets.only(top: 60.h),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            // بطاقة الكلمة والصورة
            Container(
              width: double.infinity,
              height: 285.h,
              padding: EdgeInsets.only(
                top: 50.h,
                bottom: 2.h,
                left: 24.w,
                right: 24.w,
              ),
              decoration: BoxDecoration(
                color: AppColors.letterCard,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.accent, width: 1.5),
              ),
              child: Row(
                children: [
                  // الكلمة (يمين في RTL)
                  Expanded(
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'بَ', style: AppStyle.regular55Red),
                            TextSpan(
                              text: 'طَّة',
                              style: AppStyle.regular55DarkBlue4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(width: 1.5, height: 160.h, color: AppColors.red),
                  // الصورة (شمال في RTL)
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        AppImage.duck,
                        height: 180.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // زر الصوت في أعلى يسار البطاقة
            PositionedDirectional(
              top: 14.h,
              end: 14.w,
              child: const SoundButton(size: 18),
            ),

            // كارت الحرف - نصه برة البطاقة ونصه جواها
            Positioned(
              top: -60.h,
              child: const LetterBox(letter: 'ب'),
            ),
          ],
        ),
      ),
    );
  }
}
