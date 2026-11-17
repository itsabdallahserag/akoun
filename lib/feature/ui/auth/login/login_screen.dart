import 'package:akoun/config/di.dart';
import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_route.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/auth/login/cubit/login_states.dart';
import 'package:akoun/feature/ui/auth/login/cubit/login_view_model.dart';
import 'package:akoun/feature/ui/widgets/app_button.dart';
import 'package:akoun/feature/ui/widgets/auth_background.dart';
import 'package:akoun/feature/ui/widgets/login_widgets/login_form_card.dart';
import 'package:akoun/feature/ui/widgets/login_widgets/login_header.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    context.read<LoginViewModel>().login(email: _emailController.text.trim());
  }

  void _goToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, AppRoute.home, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocProvider(
      create: (_) => getIt<LoginViewModel>(),
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
                  child: BlocConsumer<LoginViewModel, LoginStates>(
                    listener: (context, state) {
                      if (state is LoginErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else if (state is LoginSuccessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.loginResponce.message ??
                                  'تم تسجيل الدخول بنجاح!',
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                        _goToHome(context);
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          const LoginHeader(),
                          SizedBox(height: 36.h),
                          LoginFormCard(
                            formKey: _formKey,
                            nameController: _nameController,
                            emailController: _emailController,
                            phoneController: _phoneController,
                          ),
                          SizedBox(height: 32.h),
                          AppButton(
                            label: l10n.letsStart,
                            icon: Icons.rocket_launch_outlined,
                            isLoading: state is LoginLoadingState,
                            onPressed: () => _submit(context),
                          ),
                          SizedBox(height: 16.h),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoute.register,
                              );
                            },
                            child: Text(
                              'ليس لديك حساب؟ إنشاء حساب جديد',
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
