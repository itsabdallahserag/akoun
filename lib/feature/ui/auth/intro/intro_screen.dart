import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/auth/intro/for_auth.dart';
import 'package:akoun/feature/ui/widgets/app_button.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(38.w, 472.h, 38.w, 64.h),
          child: Column(
            children: [
              Text(
                l10n.appTagline,
                textAlign: TextAlign.center,
                style: AppStyle.extaBold32SecondryColor,
              ),
              const Spacer(),
              AppButton(
                label: l10n.startAdventure,
                icon: Icons.rocket_launch_outlined,
                onPressed: () => _goToWelcome(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToWelcome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ForAuth()),
    );
  }
}
