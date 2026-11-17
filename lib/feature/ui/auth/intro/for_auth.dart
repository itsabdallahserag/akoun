import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_image.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/auth/login/login_screen.dart';
import 'package:akoun/feature/ui/auth/register/register_screen.dart';
import 'package:akoun/feature/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForAuth extends StatelessWidget {
  const ForAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 358.h, left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomElevatedButton(
                bgColor: AppColors.blue,
                radius: 25.r,
                text: localization.createAccount,
                textStyle: AppStyle.bold20White,
                onPressed: () => _goTo(context, const RegisterScreen()),
              ),

              SizedBox(height: 21.h),

              CustomElevatedButton(
                bgColor: AppColors.accent,
                radius: 25.r,
                text: localization.login,
                textStyle: AppStyle.bold20White,
                onPressed: () => _goTo(context, const LoginScreen()),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    AppImage.avatarForAuth,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }
}
