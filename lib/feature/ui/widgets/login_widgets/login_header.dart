import 'package:akoun/core/app_style.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      children: [
        Text(
          l10n.welcomeTitle,
          textAlign: TextAlign.center,
          style: AppStyle.bold40DarkCerulean,
        ),
        SizedBox(height: 12.h),
        Text(
          l10n.welcomeSubtitle,
          textAlign: TextAlign.center,
          style: AppStyle.regular20Gray,
        ),
      ],
    );
  }
}
