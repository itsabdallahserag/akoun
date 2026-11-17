import 'package:akoun/core/app_style.dart';
import 'package:akoun/core/validators.dart';
import 'package:akoun/feature/ui/widgets/auth_card.dart';
import 'package:akoun/feature/ui/widgets/auth_parents_section.dart';
import 'package:akoun/feature/ui/widgets/custom_text_field.dart';
import 'package:akoun/feature/ui/widgets/dotted_divider.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const LoginFormCard({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AuthCard(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.heroName, style: AppStyle.bold16DarkBlue),
            SizedBox(height: 8.h),
            CustomTextField(
              hintText: l10n.whatIsYourName,
              prefixIcon: Icons.face_unlock_rounded,
              controller: nameController,
              validator: (val) => Validators.validateName(val, l10n),
            ),
            SizedBox(height: 23.h),
            const DottedDivider(),
            SizedBox(height: 25.h),
            AuthParentsSection(
              emailController: emailController,
              phoneController: phoneController,
            ),
          ],
        ),
      ),
    );
  }
}
