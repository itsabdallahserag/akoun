import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/home/islands/islandLetters/listening_screen.dart';
import 'package:akoun/feature/ui/widgets/custom_elevated_button.dart';
import 'package:akoun/feature/ui/widgets/lesson_widgets.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PronunciationScreen extends StatefulWidget {
  const PronunciationScreen({super.key});

  @override
  State<PronunciationScreen> createState() => _PronunciationScreenState();
}

class _PronunciationScreenState extends State<PronunciationScreen> {
  // false = أحمر (لسه)، true = أخضر (نطق صح)
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final micColor = isDone ? AppColors.green : AppColors.red;

    return LessonScaffold(
      title: l10n.pronunciationTraining,
      bottom: isDone
          ? SizedBox(
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
                    MaterialPageRoute(builder: (_) => ListeningScreen()),
                  );
                },
              ),
            )
          : null,
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Text(
            l10n.letsPracticePronunciation,
            style: AppStyle.semiBold32DarkBlue4,
          ),
          SizedBox(height: 24.h),
          const LetterBox(letter: 'ب', width: 130),
          SizedBox(height: 24.h),

          // الموجات + الميكروفون
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WaveBars(color: micColor),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () => setState(() => isDone = true), // TODO: تسجيل حقيقي
                child: CircleAvatar(
                  radius: 37.5.r,
                  backgroundColor: micColor,
                  child: Icon(Icons.mic, color: AppColors.white, size: 45.r),
                ),
              ),
              SizedBox(width: 8.w),
              WaveBars(color: micColor),
            ],
          ),
        ],
      ),
    );
  }
}
