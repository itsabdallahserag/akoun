import 'package:akoun/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyle {
  // ===========================================================================
  // 1. ستايلات مسمّاة بالأسماء الحقيقية للألوان (Real Color Name Styles)
  // ===========================================================================

  // Steel Blue (#2670AD)
  static const TextStyle extraBold32SteelBlue = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: AppColors.steelBlue,
  );
  static const TextStyle bold40DarkCerulean = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.darkCerulean,
  );
  static const TextStyle bold24SteelBlue = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.steelBlue,
  );

  // Dark Cerulean (#00658D)
  static const TextStyle bold16DarkCerulean = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.darkCerulean,
  );
  static const TextStyle bold20DarkCerulean = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.darkCerulean,
  );

  // Midnight Teal (#004C6B)
  static const TextStyle bold18MidnightTeal = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.midnightTeal,
  );

  // Prussian Blue (#003E58)
  static const TextStyle bold20PrussianBlue = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.prussianBlue,
  );

  // Dark Navy (#0B0B74)
  static const TextStyle semiBold32DarkNavy = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.darkNavy,
  );
  static const TextStyle regular48DarkNavy = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    color: AppColors.darkNavy,
  );
  static const TextStyle regular55DarkNavy = TextStyle(
    fontSize: 55,
    fontWeight: FontWeight.w400,
    color: AppColors.darkNavy,
  );
  static const TextStyle regular128DarkNavy = TextStyle(
    fontSize: 128,
    fontWeight: FontWeight.w400,
    color: AppColors.darkNavy,
  );

  // Dodger Blue (#1978CD)
  static const TextStyle bold20DodgerBlue = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.dodgerBlue,
  );
  static const TextStyle bold16DodgerBlue = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.dodgerBlue,
  );

  // Celtic Blue (#1E73BE)
  static const TextStyle bold16CelticBlue = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.celticBlue,
  );

  // Eerie Black (#1B1C15)
  static const TextStyle bold16EerieBlack = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.eerieBlack,
  );
  static const TextStyle bold14TextPrimary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  static const TextStyle bold16darkCerulean = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.darkCerulean,
  );

  // Charcoal (#3E4850)
  static const TextStyle regular20Charcoal = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.charcoal,
  );
  static const TextStyle regular14Charcoal = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.charcoal,
  );

  // Cool Gray (#9CA3AF)
  static const TextStyle regular18CoolGray = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.coolGray,
  );
  static const TextStyle regular14CoolGray = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.coolGray,
  );
  static const TextStyle regular10CoolGray = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.coolGray,
  );
  static const TextStyle medium14CoolGray = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.coolGray,
  );

  // Light Slate Gray (#BDC8D1)
  static const TextStyle regular16SlateGray = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.lightSlateGray,
  );

  // Apple Green (#54B757)
  static const TextStyle bold16AppleGreen = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.appleGreen,
  );

  // Forest Green (#006E1C)
  static const TextStyle bold16ForestGreen = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.forestGreen,
  );

  // Dark Goldenrod (#6E5C00)
  static const TextStyle bold16DarkGold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.darkGoldenrod,
  );

  // Vivid Yellow (#FCD400)
  static const TextStyle bold16VividYellow = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.vividYellow,
  );

  // Oxford Blue (#0D3253)
  static const TextStyle regular24OxfordBlue = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AppColors.oxfordBlue,
  );

  // Pure White (#FFFFFF)
  static const TextStyle bold20PureWhite = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.pureWhite,
  );
  static const TextStyle medium14PureWhite = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.pureWhite,
  );
  static const TextStyle regular18Grey = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static const TextStyle bold30Brown = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.brown,
  );
  static const TextStyle bold14LightBlack = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.lightBlack,
  );
  // ===========================================================================
  // 2. ستايلات مسمّاة مباشرة بقيمة الـ Hex بعد 0xFF (Hex-based Styles)
  // ===========================================================================
  static const TextStyle bold32Color2670AD = extraBold32SteelBlue;
  static const TextStyle bold40Color2670AD = bold40DarkCerulean;
  static const TextStyle bold24Color2670AD = bold24SteelBlue;
  static const TextStyle bold16Color00658D = bold16DarkCerulean;
  static const TextStyle bold20Color00658D = bold20DarkCerulean;
  static const TextStyle bold18Color004C6B = bold18MidnightTeal;
  static const TextStyle bold20Color003E58 = bold20PrussianBlue;
  static const TextStyle semiBold32Color0B0B74 = semiBold32DarkNavy;
  static const TextStyle regular48Color0B0B74 = regular48DarkNavy;
  static const TextStyle regular55Color0B0B74 = regular55DarkNavy;
  static const TextStyle regular128Color0B0B74 = regular128DarkNavy;
  static const TextStyle bold20Color1978CD = bold20DodgerBlue;
  static const TextStyle bold16Color1978CD = bold16DodgerBlue;
  static const TextStyle bold16Color1E73BE = bold16CelticBlue;
  static const TextStyle bold16Color1B1C15 = bold16EerieBlack;
  static const TextStyle regular20Color3E4850 = regular20Charcoal;
  static const TextStyle regular14Color3E4850 = regular14Charcoal;
  static const TextStyle regular18Color9CA3AF = regular18CoolGray;
  static const TextStyle regular14Color9CA3AF = regular14CoolGray;
  static const TextStyle regular10Color9CA3AF = regular10CoolGray;
  static const TextStyle medium14Color9CA3AF = medium14CoolGray;
  static const TextStyle regular16ColorBDC8D1 = regular16SlateGray;
  static const TextStyle bold16Color54B757 = bold16AppleGreen;
  static const TextStyle bold16Color006E1C = bold16ForestGreen;
  static const TextStyle bold16Color6E5C00 = bold16DarkGold;
  static const TextStyle bold16ColorFCD400 = bold16VividYellow;
  static const TextStyle regular24Color0D3253 = regular24OxfordBlue;
  static const TextStyle bold20ColorFFFFFF = bold20PureWhite;
  static const TextStyle medium14ColorFFFFFF = medium14PureWhite;

  // ===========================================================================
  // 3. التسميات السابقة في المشروع (مرتبطة بالستايلات الجديدة لعدم كسر الكود)
  // (Legacy Style Names preserved for backward compatibility)
  // ===========================================================================
  static const TextStyle extaBold32SecondryColor = extraBold32SteelBlue;
  static const TextStyle extraBold32SecondaryColor = extraBold32SteelBlue;
  static const TextStyle bold20White = bold20PureWhite;
  static const TextStyle bold40SecondryColor = bold40DarkCerulean;
  static const TextStyle bold40SecondaryColor = bold40DarkCerulean;
  static const TextStyle bold24Secondary = bold24SteelBlue;
  static const TextStyle regular20Gray = regular20Charcoal;
  static const TextStyle regular14Gray = regular14Charcoal;
  static const TextStyle regular18TextSecondry = regular18CoolGray;
  static const TextStyle regular18TextSecondary = regular18CoolGray;
  static const TextStyle medium14TextSecondary = medium14CoolGray;
  static const TextStyle bold16DarkBlue = bold16DarkCerulean;
  static const TextStyle bold20DarkBlue = bold20DarkCerulean;
  static const TextStyle bold18DarkBlueSecondary = bold18MidnightTeal;
  static const TextStyle bold16TextPrimay = bold16EerieBlack;
  static const TextStyle bold16TextPrimary = bold16EerieBlack;
  static const TextStyle bold16LightBlue2 = bold16CelticBlue;
  static const TextStyle bold20Blue = bold20DodgerBlue;
  static const TextStyle bold16Blue = bold16DodgerBlue;
  static const TextStyle bold16Green = bold16AppleGreen;
  static const TextStyle bold16DarkGreen = bold16ForestGreen;
  static const TextStyle bold16Brown = bold16DarkGold;
  static const TextStyle bold16Accent = bold16VividYellow;
  static const TextStyle medium14white = medium14PureWhite;
  static const TextStyle bold20DarkBlue3 = bold20PrussianBlue;
  static const TextStyle semiBold32DarkBlue4 = semiBold32DarkNavy;
  static const TextStyle regular48DarkBlue4 = regular48DarkNavy;
  static const TextStyle regular55DarkBlue4 = regular55DarkNavy;
  static const TextStyle regular128DarkBlue4 = regular128DarkNavy;
  static const TextStyle regular10LightGray = regular10CoolGray;
  static const TextStyle regular14LightGray = regular14CoolGray;
  static const TextStyle regular16Disabled = regular16SlateGray;
  static const TextStyle regular24Shadow = regular24OxfordBlue;

  // ستايلات متبقية تستخدم ألواناً عامة
  static const TextStyle regular55Red = TextStyle(
    fontSize: 55,
    fontWeight: FontWeight.w400,
    color: AppColors.red,
  );
  static const TextStyle regular36Black = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static const TextStyle semiBpld20Purble = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.purpule,
  );
  static const TextStyle semiBold20Purple = semiBpld20Purble;
  static const TextStyle bold16LightBlack = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.lightBlack,
  );
}
