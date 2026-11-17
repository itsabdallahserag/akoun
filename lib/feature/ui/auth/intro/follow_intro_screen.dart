import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_image.dart';
import 'package:akoun/core/app_route.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/widgets/custom_elevated_button.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowIntroScreen extends StatelessWidget {
  final bool isFemale;

  const FollowIntroScreen({
    super.key,
    this.isFemale = false,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Stack(
        children: [
          // 1) الخلفية (الصحراء)
          Positioned.fill(
            child: Image.asset(AppImage.introBg, fit: BoxFit.cover),
          ),

          // 2) الشخصية في آخر الشاشة على الشمال
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              isFemale ? AppImage.introFemale : AppImage.introMale,
              height: 0.45.sh,
              fit: BoxFit.contain,
            ),
          ),

          // 3) فقاعة الكلام + الزرار
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.w, 140.h, 24.w, 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(14.w, 33.h, 4.w, 33.h),
                    decoration: BoxDecoration(
                      color: AppColors.white65,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Text(
                      l10n.guideWelcome,
                      style: AppStyle.regular24Shadow,
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 120.w,
                      child: CustomElevatedButton(
                        bgColor: AppColors.accent,
                        radius: 20.r,
                        text: l10n.next,
                        textStyle: AppStyle.bold16TextPrimay,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoute.home,
                            (route) => false,
                          );
                        },
                      ),
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
