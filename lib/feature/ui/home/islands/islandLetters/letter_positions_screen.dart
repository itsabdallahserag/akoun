import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_image.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/home/islands/islandLetters/matching_screen.dart';
import 'package:akoun/feature/ui/widgets/lesson_widgets.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LetterPositionsScreen extends StatefulWidget {
  const LetterPositionsScreen({super.key});

  @override
  State<LetterPositionsScreen> createState() => _LetterPositionsScreenState();
}

class _LetterPositionsScreenState extends State<LetterPositionsScreen> {
  int _currentIndex = 0;

  void _onNext() {
    if (_currentIndex < 2) {
      setState(() => _currentIndex++);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MatchingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final positionsData = [
      _PositionItem(
        title: l10n.beginningOfWord,
        letterForm: 'بـ',
        wordPrefix: '',
        highlightedPart: 'بَ',
        wordSuffix: 'قرة',
        imagePath: AppImage.cow,
      ),
      _PositionItem(
        title: l10n.middleOfWord,
        letterForm: 'ـبـ',
        wordPrefix: 'حَ',
        highlightedPart: 'بْ',
        wordSuffix: 'ل',
        imagePath: AppImage.rope,
      ),
      _PositionItem(
        title: l10n.endOfWord,
        letterForm: 'ـب',
        wordPrefix: 'مركـ',
        highlightedPart: 'ب',
        wordSuffix: '',
        imagePath: AppImage.boat,
      ),
    ];

    final currentItem = positionsData[_currentIndex];

    return LessonScaffold(
      title: l10n.letterPositions,
      onClose: () => Navigator.pop(context),
      onBack: () {
        if (_currentIndex > 0) {
          setState(() => _currentIndex--);
        } else {
          Navigator.maybePop(context);
        }
      },
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 12.h),

            // البطاقة الرئيسية
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blue.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // الصف العلوي: [ شكل الحرف ] <-- [ موضع الحرف ]
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // كارت موضع الحرف (مثل "أول الكلمة")
                      _MiniBox(text: currentItem.title, fontSize: 16.sp),
                      SizedBox(width: 14.w),
                      // سهم أحمر يشير لليسار
                      Icon(
                        Icons.arrow_back_rounded,
                        color: AppColors.red,
                        size: 32.r,
                      ),
                      SizedBox(width: 14.w),
                      // كارت الحرف
                      _MiniBox(
                        text: currentItem.letterForm,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(height: 28.h),

                  // الصف الأوسط: الكلمة مع الحرف الملون بالفاصل الرأسي + الصورة
                  Row(
                    children: [
                      // يمين: مثال والكلمة
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'مثال',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text.rich(
                              TextSpan(
                                children: [
                                  if (currentItem.wordPrefix.isNotEmpty)
                                    TextSpan(
                                      text: currentItem.wordPrefix,
                                      style: TextStyle(
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.darkBlue4,
                                      ),
                                    ),
                                  TextSpan(
                                    text: currentItem.highlightedPart,
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.red,
                                    ),
                                  ),
                                  if (currentItem.wordSuffix.isNotEmpty)
                                    TextSpan(
                                      text: currentItem.wordSuffix,
                                      style: TextStyle(
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.darkBlue4,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // فاصل رأسي
                      Container(
                        width: 1.5,
                        height: 70.h,
                        color: AppColors.lightGray.withValues(alpha: 0.5),
                      ),
                      // يسار: الصورة
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            currentItem.imagePath,
                            height: 75.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // زرار الصوت باللون الكحلي
                  GestureDetector(
                    onTap: () {
                      // تشغيل نطق الكلمة
                    },
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: AppColors.darkBlue4,
                      child: Icon(
                        Icons.volume_up,
                        color: AppColors.white,
                        size: 20.r,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // زر المتابعة / الانتقال للموضع التالي
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue4,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  elevation: 0,
                ),
                onPressed: _onNext,
                child: Text(
                  l10n.continueText,
                  style: AppStyle.bold20White.copyWith(fontSize: 18.sp),
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}

class _PositionItem {
  const _PositionItem({
    required this.title,
    required this.letterForm,
    required this.wordPrefix,
    required this.highlightedPart,
    required this.wordSuffix,
    required this.imagePath,
  });

  final String title;
  final String letterForm;
  final String wordPrefix;
  final String highlightedPart;
  final String wordSuffix;
  final String imagePath;
}

class _MiniBox extends StatelessWidget {
  const _MiniBox({
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.w600,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFC7D7E8),
          width: 1.5,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: AppColors.darkBlue4,
        ),
      ),
    );
  }
}
