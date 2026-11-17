import 'package:akoun/config/di.dart';
import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_route.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/auth/intro/follow_intro_screen.dart';
import 'package:akoun/feature/ui/auth/register/cubit/register_states.dart';
import 'package:akoun/feature/ui/auth/register/cubit/register_view_model.dart';
import 'package:akoun/feature/ui/widgets/app_button.dart';
import 'package:akoun/feature/ui/widgets/auth_background.dart';
import 'package:akoun/feature/ui/widgets/auth_card.dart';
import 'package:akoun/feature/ui/widgets/auth_parents_section.dart';
import 'package:akoun/feature/ui/widgets/dotted_divider.dart';
import 'package:akoun/feature/ui/widgets/register_widgets/register_child_section.dart';
import 'package:akoun/feature/ui/widgets/register_widgets/register_dialect_section.dart';
import 'package:akoun/feature/ui/widgets/register_widgets/register_guide_section.dart';
import 'package:akoun/feature/ui/widgets/register_widgets/register_language_section.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  String? selectedGender; // 'girl' أو 'boy'
  bool isFemale = true; // المعلمة افتراضيًا
  int selectedLanguage = 0; // 0 عربي، 1 English، 2 Türkçe، 3 اردو
  int selectedDialect = 0; // 0 خليجي، 1 مصري، 2 فصحى

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context, AppLocalizations l10n) {
    if (!_formKey.currentState!.validate()) return;

    if (selectedGender == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.gender)));
      return;
    }

    final fullName = _nameController.text.trim().isNotEmpty
        ? _nameController.text.trim()
        : 'ولي الأمر';

    context.read<RegisterViewModel>().register(
      fullName: fullName,
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocProvider(
      create: (_) => getIt<RegisterViewModel>(),
      child: Scaffold(
        body: AuthBackground(
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 16.h,
                  right: 16.w,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.white,
                    ),
                    onPressed: () => Navigator.maybePop(context),
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(24.w, 120.h, 24.w, 40.h),
                  child: BlocConsumer<RegisterViewModel, RegisterStates>(
                    listener: (context, state) {
                      if (state is RegisterErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else if (state is RegisterSuccessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.registerResponse.message ??
                                  'تم إنشاء الحساب بنجاح!',
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                FollowIntroScreen(isFemale: isFemale),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Text(
                            l10n.welcomeTitle,
                            textAlign: TextAlign.center,
                            style: AppStyle.bold40SecondryColor,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            l10n.welcomeSubtitle,
                            textAlign: TextAlign.center,
                            style: AppStyle.regular20Gray,
                          ),
                          SizedBox(height: 36.h),
                          AuthCard(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  RegisterChildSection(
                                    nameController: _nameController,
                                    ageController: _ageController,
                                    selectedGender: selectedGender,
                                    onGenderSelected: (gender) {
                                      setState(() => selectedGender = gender);
                                    },
                                  ),
                                  SizedBox(height: 24.h),
                                  RegisterGuideSection(
                                    isFemale: isFemale,
                                    onGuideSelected: (female) {
                                      setState(() => isFemale = female);
                                    },
                                  ),
                                  SizedBox(height: 24.h),
                                  RegisterLanguageSection(
                                    selectedLanguage: selectedLanguage,
                                    onLanguageSelected: (lang) {
                                      setState(() => selectedLanguage = lang);
                                    },
                                  ),
                                  SizedBox(height: 24.h),
                                  RegisterDialectSection(
                                    selectedDialect: selectedDialect,
                                    onDialectSelected: (dial) {
                                      setState(() => selectedDialect = dial);
                                    },
                                  ),
                                  SizedBox(height: 23.h),
                                  const DottedDivider(),
                                  SizedBox(height: 25.h),
                                  AuthParentsSection(
                                    emailController: _emailController,
                                    phoneController: _phoneController,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 32.h),
                          AppButton(
                            label: l10n.letsStart,
                            icon: Icons.rocket_launch_outlined,
                            isLoading: state is RegisterLoadingState,
                            onPressed: () => _submit(context, l10n),
                          ),
                          SizedBox(height: 16.h),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoute.login,
                              );
                            },
                            child: Text(
                              'لديك حساب بالفعل؟ تسجيل الدخول',
                              style: AppStyle.bold16DarkBlue.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
