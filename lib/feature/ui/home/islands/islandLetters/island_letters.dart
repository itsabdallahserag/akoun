import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/home/islands/islandLetters/learn_letter_screen.dart';
import 'package:akoun/feature/ui/widgets/custom_elevated_button.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IslandLetters extends StatefulWidget {
  const IslandLetters({super.key});

  @override
  State<IslandLetters> createState() => _IslandLettersState();
}

class _IslandLettersState extends State<IslandLetters> {
  // الحروف بالترتيب (أول حرف على اليمين في RTL)
  final List<String> letters = const [
    'أ', 'ب', 'ت', 'ث', 'ج', 'ح', 'خ', 'د', 'ذ', 'ر',
    'ز', 'س', 'ش', 'ص', 'ض', 'ط', 'ظ', 'ع', 'غ', 'ف',
    'ق', 'ك', 'ل', 'م', 'ن', 'ه', 'و', 'ي',
  ];

  // عدد الحروف المكتملة (أول N حرف). TODO: من بيانات المستخدم
  final int completedCount = 1;

  // الحرف المختار (null = مفيش اختيار)
  int? selectedIndex;

  void onLetterTap(int index) {
    if (index < completedCount) return; // المكتمل مش بيتختار
    setState(() => selectedIndex = index);
  }

  void onContinue() {
    // TODO: Navigator.push(... شاشة تعلّم الحرف letters[selectedIndex!])
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LearnLetterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: AppColors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(l10n.islandLetters, style: AppStyle.semiBold32DarkBlue4),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: 20.w),
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 16.r,
                child: Icon(
                  Icons.close,
                  size: 18.r,
                  color: AppColors.darkBlue4,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // شبكة الحروف
          GridView.builder(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 110.h),
            itemCount: letters.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1.03,
            ),
            itemBuilder: (context, index) {
              return LetterCard(
                letter: letters[index],
                isCompleted: index < completedCount,
                isSelected: index == selectedIndex,
                onTap: () => onLetterTap(index),
              );
            },
          ),

          // زرار متابعة (بيظهر لما تختار حرف)
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 24.h,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: selectedIndex == null
                  ? const SizedBox.shrink()
                  : SizedBox(
                    width: double.infinity,
                    height: 80.h,
                    child: CustomElevatedButton(
                        bgColor: AppColors.darkBlue4,
                        radius: 40.r,
                        text: l10n.continueText,
                        textStyle: AppStyle.bold20White,
                        onPressed: onContinue,
                      ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// كارت الحرف: عادي / مكتمل (أخضر + علامة صح) / مختار (أزرق)
// -----------------------------------------------------------------------------
class LetterCard extends StatelessWidget {
  const LetterCard({
    super.key,
    required this.letter,
    required this.isCompleted,
    required this.isSelected,
    required this.onTap,
  });

  final String letter;
  final bool isCompleted;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Color bgColor = AppColors.letterCard;
    Color? borderColor;

    if (isCompleted) {
      bgColor = AppColors.letterDone;
      borderColor = AppColors.successGreen;
    } else if (isSelected) {
      bgColor = AppColors.letterSelected;
      borderColor = AppColors.darkBlue4;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.r),
          border: borderColor == null
              ? null
              : Border.all(color: borderColor, width: 1),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              letter,
              style: AppStyle.regular48DarkBlue4
            ),
            if (isCompleted)
              PositionedDirectional(
                top: 8.h,
                end: 8.w,
                child: Icon(
                  Icons.check_circle,
                  size: 20.r,
                  color: AppColors.successGreen,
                ),
              ),
          ],
        ),
      ),
    );
  }
}