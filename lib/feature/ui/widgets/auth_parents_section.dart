import 'package:akoun/core/validators.dart';
import 'package:akoun/feature/ui/widgets/auth_parents_section_header.dart';
import 'package:akoun/feature/ui/widgets/custom_text_field.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthParentsSection extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const AuthParentsSection({
    super.key,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AuthParentsSectionHeader(),
        SizedBox(height: 16.h),
        CustomTextField(
          hintText: l10n.email,
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          validator: (val) => Validators.validateEmail(val, l10n),
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          hintText: l10n.phoneNumber,
          prefixIcon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
          controller: phoneController,
          validator: (val) => Validators.validatePhoneNumber(val, l10n),
        ),
      ],
    );
  }
}
