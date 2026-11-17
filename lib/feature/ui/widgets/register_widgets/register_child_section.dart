import 'package:akoun/core/app_image.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/core/validators.dart';
import 'package:akoun/feature/ui/widgets/custom_text_field.dart';
import 'package:akoun/feature/ui/widgets/register_widgets/gender_option_button.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterChildSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final String? selectedGender;
  final ValueChanged<String> onGenderSelected;

  const RegisterChildSection({
    super.key,
    required this.nameController,
    required this.ageController,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.childName, style: AppStyle.bold16DarkBlue),
        SizedBox(height: 8.h),
        CustomTextField(
          hintText: l10n.enterChildName,
          prefixIcon: Icons.person_outline_outlined,
          controller: nameController,
          validator: (val) => Validators.validateChildName(val, l10n),
        ),
        SizedBox(height: 23.h),
        Text(l10n.age, style: AppStyle.bold16DarkBlue),
        SizedBox(height: 8.h),
        CustomTextField(
          hintText: l10n.howOldAreYou,
          prefixImage: AppImage.iconBirthDay,
          keyboardType: TextInputType.number,
          controller: ageController,
          validator: (val) => Validators.validateChildAge(val, l10n),
        ),
        SizedBox(height: 8.h),
        Text(l10n.gender, style: AppStyle.bold16LightBlack),
        SizedBox(height: 8.h),
        Row(
          children: [
            GenderOptionButton(
              text: l10n.girl,
              icon: AppImage.iconGirl,
              isSelected: selectedGender == 'girl',
              onTap: () => onGenderSelected('girl'),
            ),
            SizedBox(width: 8.w),
            GenderOptionButton(
              text: l10n.boy,
              icon: AppImage.iconBoy,
              isSelected: selectedGender == 'boy',
              onTap: () => onGenderSelected('boy'),
            ),
          ],
        ),
      ],
    );
  }
}
