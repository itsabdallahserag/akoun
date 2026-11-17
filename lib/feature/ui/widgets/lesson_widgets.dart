import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// هيكل الشاشة: خلفية + AppBar (رجوع + عنوان + إغلاق) + محتوى + زرار سفلي اختياري
class LessonScaffold extends StatelessWidget {
  const LessonScaffold({
    super.key,
    required this.title,
    required this.body,
    this.bottom,
    this.onBack,
    this.onClose,
  });

  final String title;
  final Widget body;
  final Widget? bottom;
  final VoidCallback? onBack;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      appBar: AppBar(
        toolbarHeight: 65.h,
        backgroundColor: AppColors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(title, style: AppStyle.semiBold32DarkBlue4.copyWith(fontSize: 26.sp)),
        // في RTL الـ leading على اليمين
        leadingWidth: 68.w,
        leading: _CircleButton(
          icon: Icons.arrow_forward_ios_rounded,
          onTap: onBack ?? () => Navigator.maybePop(context),
        ),
        // والـ actions على الشمال
        actions: [
          _CircleButton(
            icon: Icons.close_rounded,
            onTap: onClose ?? () => Navigator.pop(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 4.h,
            bottom: 8.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Column(
            children: [
              Expanded(child: body),
              ?bottom,
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 20.w, start: 20.w),
        child: CircleAvatar(
          radius: 16.r,
          backgroundColor: AppColors.white,
          child: Icon(icon, size: 18.r, color: AppColors.darkBlue4),
        ),
      ),
    );
  }
}

/// بطاقة الحرف الكبيرة (بإطار أصفر أو أزرق)
class LetterBox extends StatelessWidget {
  const LetterBox({
    super.key,
    required this.letter,
    this.width = 150,
    this.useBlueStyle = false,
  });

  final String letter;
  final double width;
  final bool useBlueStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 53, vertical: 7),
      decoration: BoxDecoration(
        color: useBlueStyle ? AppColors.darkBlue4 : AppColors.letterCard,
        borderRadius: BorderRadius.circular(20.r),
        border: useBlueStyle ? null : Border.all(color: AppColors.accent),
      ),
      child: Text(letter, style: AppStyle.regular128DarkBlue4),
    );
  }
}

/// زرار الصوت الدائري (السماعة)
class SoundButton extends StatelessWidget {
  const SoundButton({super.key, this.size = 28, this.onTap});

  final double size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // TODO: تشغيل الصوت
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.accent),
        ),
        child: CircleAvatar(
          radius: size.r,
          backgroundColor: AppColors.lightBlue3,
          child: Icon(Icons.volume_up, size: size.r, color: AppColors.blue),
        ),
      ),
    );
  }
}

/// أعمدة الموجة الصوتية (شكل فقط)
class WaveBars extends StatelessWidget {
  const WaveBars({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    const heights = [8.0, 16.0, 26.0, 14.0, 22.0, 10.0, 6.0];

    return Row(
      children: [
        for (final h in heights)
          Container(
            width: 2.w,
            height: h.h,
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
      ],
    );
  }
}
