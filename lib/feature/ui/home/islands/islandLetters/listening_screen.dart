import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_image.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/home/islands/islandLetters/write_letter_screen.dart';
import 'package:akoun/feature/ui/widgets/lesson_widgets.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListeningScreen extends StatefulWidget {
  const ListeningScreen({super.key});

  @override
  State<ListeningScreen> createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  final List<String> options = const ['ت', 'ب', 'ج'];
  final String correctLetter = 'ب';

  String? selected; // null = لم يتم الاختيار بعد

  bool get isWrong => selected != null && selected != correctLetter;
  bool get isCorrect => selected == correctLetter;

  @override
  void initState() {
    super.initState();
    // تشغيل فويس الحرف تلقائياً عند فتح الشاشة في حالة عدم الاختيار
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _playLetterAudio();
    });
  }

  void _playLetterAudio() {
    // تشغيل صوت الحرف (Audio player hook)
  }

  void retry() {
    setState(() => selected = null);
    _playLetterAudio();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return LessonScaffold(
      title: l10n.listeningTraining,
      onClose: () => Navigator.pop(context),
      onBack: () => Navigator.maybePop(context),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                SizedBox(height: 6.h),
                Text(
                  l10n.listenAndChooseCorrectLetter,
                  style: AppStyle.semiBpld20Purble,
                ),
                SizedBox(height: 16.h),

                // اختيارات الحروف الثلاثة
                Row(
                  children: [
                    for (int i = 0; i < options.length; i++) ...[
                      Expanded(
                        child: _OptionCard(
                          letter: options[i],
                          isWrong: isWrong && selected == options[i],
                          isCorrect: isCorrect && selected == options[i],
                          onTap: () {
                            setState(() => selected = options[i]);
                          },
                        ),
                      ),
                      if (i != options.length - 1) SizedBox(width: 12.w),
                    ],
                  ],
                ),
                SizedBox(height: 18.h),

                // نص الإجابة الخاطئة أسفل الحروف
                if (isWrong)
                  Text(
                    l10n.wrongAnswerTryAgain,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.red,
                    ),
                  ),
              ],
            ),
          ),

          // الحالة 1: قبل الاختيار (السماعة المتوهجة + صورة الشخصية المفكرة)
          if (selected == null) ...[
            // زر السماعة الدائري مع التوهج في المنتصف
            Align(
              alignment: const Alignment(0, -0.15),
              child: GestureDetector(
                onTap: _playLetterAudio,
                child: Container(
                  width: 105.r,
                  height: 105.r,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blue.withValues(alpha: 0.25),
                        blurRadius: 36,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.volume_up_rounded,
                    size: 52.r,
                    color: AppColors.blue,
                  ),
                ),
              ),
            ),

            // فقاعة التفكير / علامة الاستفهام بجانب رأس الشخصية
            Positioned(
              bottom: 0.23.sh,
              left: 0.22.sw,
              child: Column(
                children: [
                  Icon(
                    Icons.help_outline_rounded,
                    color: AppColors.mediumGray.withValues(alpha: 0.55),
                    size: 24.r,
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    width: 6.r,
                    height: 6.r,
                    decoration: BoxDecoration(
                      color: AppColors.mediumGray.withValues(alpha: 0.45),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    width: 4.r,
                    height: 4.r,
                    decoration: BoxDecoration(
                      color: AppColors.mediumGray.withValues(alpha: 0.35),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),

            // صورة الشخصية وهو يفكر
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                AppImage.guideThinking,
                height: 0.28.sh,
                fit: BoxFit.contain,
              ),
            ),
          ],

          // الحالة 2: إجابة خاطئة (سهم الإعادة الأحمر فوق الشخصية + صورة الخطأ مع علامة X)
          if (isWrong)
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: retry,
                    child: Padding(
                      padding: EdgeInsets.all(4.r),
                      child: Icon(
                        Icons.replay_rounded,
                        color: AppColors.red,
                        size: 38.r,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Image.asset(
                    AppImage.guideSad,
                    height: 0.28.sh,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),

          // الحالة 3: إجابة صحيحة (صورة الشخصية السعيد مع علامة الصح + أحسنت أيها البطل + زر متابعة)
          if (isCorrect)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // اليمين: النص "أحسنت أيها البطل" وزر المتابعة
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${l10n.wellDone}\n${l10n.champion}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w800,
                                color: AppColors.darkBlue4,
                                height: 1.25,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            SizedBox(
                              width: 145.w,
                              height: 48.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.darkBlue4,
                                  foregroundColor: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.r),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const WriteLetterScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  l10n.continueText,
                                  style: AppStyle.bold20White.copyWith(
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    // اليسار: صورة الشخصية السعيد
                    Expanded(
                      flex: 5,
                      child: Image.asset(
                        AppImage.guideHappy,
                        height: 0.28.sh,
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.letter,
    required this.isWrong,
    required this.isCorrect,
    required this.onTap,
  });

  final String letter;
  final bool isWrong;
  final bool isCorrect;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = isCorrect
        ? AppColors.letterDone
        : isWrong
            ? AppColors.letterWrong
            : AppColors.letterCard;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 95.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          letter,
          style: TextStyle(
            fontSize: 48.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkBlue4,
          ),
        ),
      ),
    );
  }
}
