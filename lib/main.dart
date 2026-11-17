import 'package:akoun/config/di.dart';
import 'package:akoun/core/app_route.dart';
import 'package:akoun/core/app_theme.dart';
import 'package:akoun/feature/ui/auth/intro/for_auth.dart';
import 'package:akoun/feature/ui/auth/intro/intro_screen.dart';
import 'package:akoun/feature/ui/auth/login/login_screen.dart';
import 'package:akoun/feature/ui/auth/register/register_screen.dart';
import 'package:akoun/feature/ui/home/home_screen.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852), // مقاس الفريم في Figma
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          locale: const Locale('ar'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: AppRoute.introduction,
          routes: {
            AppRoute.introduction: (context) => const IntroScreen(),
            AppRoute.forAuth: (context) => const ForAuth(),
            AppRoute.login: (context) => const LoginScreen(),
            AppRoute.register: (context) => const RegisterScreen(),
            AppRoute.home: (context) => const HomeScreen(),
          },
        );
      },
    );
  }
}
