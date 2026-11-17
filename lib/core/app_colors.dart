import 'package:flutter/material.dart';

abstract final class AppColors {
  // ===========================================================================
  // 1. أسماء الألوان الحقيقية بناءً على قيمتها في فيجما بعد 0xFF
  // (Real Color Names based on hex values from Figma)
  // ===========================================================================

  /// #FCFAED - Floral White / Off-white (أوف وايت كريمي)
  static const Color floralWhite = Color(0xFFFCFAED);
  static const Color floralWhite2 = Color(0xFFE4E3D6);

  /// #2670AD - Steel Blue / Lapis Lazuli (أزرق ستيل)
  static const Color steelBlue = Color(0xFF2670AD);
  static const Color steelBlue2 = Color(0xFF00AEEF);

  /// #FCD400 - Vivid Yellow / School Bus Yellow (أصفر ذهبي ساطع)
  static const Color vividYellow = Color(0xFFFCD400);
  static const Color grey = Color(0xFF6B7280);

  /// #6E5C00 - Dark Goldenrod / Olive Gold (ذهبي بني داكن)
  static const Color darkGoldenrod = Color(0xFF6E5C00);

  /// #BBEAFD - Light Sky Blue / Anakiwa (أزرق سماوي فاتح)
  static const Color lightSkyBlue = Color(0xFFBBEAFD);

  /// #1978CD - Dodger Blue / Vibrant Blue (أزرق حيوي)
  static const Color dodgerBlue = Color(0xFF1978CD);

  /// #FCD248 - Sunglow Amber (أصفر عنبري مشرق)
  static const Color sunglowAmber = Color(0xFFFCD248);

  /// #FFFFFF - Pure White (أبيض نقي)
  static const Color pureWhite = Color(0xFFFFFFFF);

  /// #00658D - Dark Cerulean / Deep Teal Blue (أزرق سيرولين بترولي داكن)
  static const Color darkCerulean = Color(0xFF00658D);

  /// #3E4850 - Charcoal / Slate Gray (رمادي فحمي غامق)
  static const Color charcoal = Color(0xFF3E4850);

  /// #F6F4E7 - Soft Cream / Ecru White (كريمي ناعم)
  static const Color softCream = Color(0xFFF6F4E7);

  /// #BDC8D1 - Light Slate Gray / Heather (رمادي سليت فاتح للحدود والتعطيل)
  static const Color lightSlateGray = Color(0xFFBDC8D1);

  /// #1B1C15 - Eerie Black (أسود داكن للنصوص الرئيسية)
  static const Color eerieBlack = Color(0xFF1B1C15);
  static const Color primary90 = Color(0xE5FCFAED);

  /// #1E73BE - Celtic Blue (أزرق سيلتيك متوسط)
  static const Color celticBlue = Color(0xFF1E73BE);

  /// #9CA3AF - Cool Gray / Aluminum (رمادي ألومنيوم للنصوص الفرعية)
  static const Color coolGray = Color(0xFF9CA3AF);

  /// #EC4899 - Hot Pink / Strawberry (وردي مميز)
  static const Color hotPink = Color(0xFFEC4899);

  /// #3B82F6 - Bright Blue / Blue Ribbon (أزرق ساطع تفاعلي)
  static const Color brightBlue = Color(0xFF3B82F6);

  /// #004C6B - Midnight Teal / Deep Sea (أزرق بترولي بحري داكن)
  static const Color midnightTeal = Color(0xFF004C6B);

  /// #003E58 - Prussian Blue / Deep Ocean (أزرق كحلي داكن)
  static const Color prussianBlue = Color(0xFF003E58);

  /// #54B757 - Apple Green / Fern (أخضر تفاحي طبيعي للنجاح)
  static const Color appleGreen = Color(0xFF54B757);

  /// #006E1C - Forest Green / Dark Green (أخضر غابي داكن)
  static const Color forestGreen = Color(0xFF006E1C);

  /// #0D3253 - Oxford Blue / Midnight Navy (كحلي منتصف الليل للظلال)
  static const Color oxfordBlue = Color(0xFF0D3253);

  /// #0B0B74 - Dark Navy Blue (أزرق كحلي عميق للأزرار)
  static const Color darkNavy = Color(0xFF0B0B74);

  // ===========================================================================
  // 2. أسماء الألوان مباشرة بناءً على كود الـ Hex بعد 0xFF
  // (Hex-code Color Identifiers)
  // ===========================================================================
  static const Color colorFCFAED = floralWhite;
  static const Color color2670AD = steelBlue;
  static const Color colorFCD400 = vividYellow;
  static const Color color6E5C00 = darkGoldenrod;
  static const Color colorBBEAFD = lightSkyBlue;
  static const Color color1978CD = dodgerBlue;
  static const Color colorFCD248 = sunglowAmber;
  static const Color colorFFFFFF = pureWhite;
  static const Color color00658D = darkCerulean;
  static const Color color3E4850 = charcoal;
  static const Color colorF6F4E7 = softCream;
  static const Color colorBDC8D1 = lightSlateGray;
  static const Color color1B1C15 = eerieBlack;
  static const Color color1E73BE = celticBlue;
  static const Color color9CA3AF = coolGray;
  static const Color colorEC4899 = hotPink;
  static const Color color3B82F6 = brightBlue;
  static const Color color004C6B = midnightTeal;
  static const Color color003E58 = prussianBlue;
  static const Color color54B757 = appleGreen;
  static const Color color006E1C = forestGreen;
  static const Color color0D3253 = oxfordBlue;
  static const Color color0B0B74 = darkNavy;

  // ===========================================================================
  // 3. التسميات الوظيفية السابقة في المشروع (مرتبطة بالأسماء الحقيقية لعدم كسر الكود)
  // (Semantic Aliases preserved for full backward compatibility)
  // ===========================================================================
  static const Color primary = floralWhite;
  static const Color secondary = steelBlue;
  static const Color accent = vividYellow;
  static const Color accent2 = sunglowAmber;
  static const Color brown = darkGoldenrod;
  static const Color lightBlue = lightSkyBlue;
  static const Color blue = dodgerBlue;
  static const Color white = pureWhite;
  static const Color darkBlue = darkCerulean;
  static const Color gray = charcoal;
  static const Color surface = softCream;
  static const Color disabled = lightSlateGray;
  static const Color textPrimary = eerieBlack;
  static const Color lightBlue2 = celticBlue;
  static const Color lightGray = coolGray;
  static const Color textSecondary = coolGray;
  static const Color pink = hotPink;
  static const Color darkBlueSecondary = midnightTeal;
  static const Color darkBlue3 = prussianBlue;
  static const Color green = appleGreen;
  static const Color darkGreen = forestGreen;
  static const Color shadow = oxfordBlue;
  static const Color darkBlue4 = darkNavy;

  // ألوان إضافية مستخدمة في الشاشات
  static const Color darkBlue2 = Color(0xFF09579A);
  static const Color lightBlue3 = Color(0xFFDEEEFF);
  static const Color purpule = Color(0xFF5150B5);
  static const Color mediumGray = Color(0xFF6E7881);
  static const Color lightBlack = Color(0xFF374151);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;
  static const Color red = Colors.red;
  static const Color white65 = Color(0xA6FFFFFF);
  static const Color white52 = Color(0x85FFFFFF);

  // أنشطة الدروس والحروف
  static const Color letterCard = Color(0xFFF8FAFD);
  static const Color letterSelected = Color(0xFFB0CDDE);
  static const Color letterDone = Color(0xFFAEDDB4);
  static const Color letterWrong = Color(0xFFEF6B6B);
  static const Color successGreen = Color(0xFF2E9A3E);
  static const Color lightBlack2 = Color(0xFF3E4850);
  static const Color lightWhite = Color(0xFFF0EEE1);
}
