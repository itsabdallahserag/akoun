import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef OnValidator = String? Function(String?);

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.prefixImage,
    this.isPassword = false,
    this.keyboardType,
    this.radius = 48,
  });

  final String hintText;
  final TextEditingController? controller;
  final OnValidator? validator;
  final IconData? prefixIcon;
  final String? prefixImage; // مسار PNG
  final bool isPassword;
  final TextInputType? keyboardType;
  final double radius;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: _isObscured,
      style: AppStyle.regular18TextSecondry,
      cursorColor: AppColors.textSecondary,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hintText: widget.hintText,
        hintStyle: AppStyle.regular18Grey,

        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),

        prefixIcon: _buildIcon(),

        prefixIconConstraints: BoxConstraints(minWidth: 45.w, minHeight: 48.h),

        enabledBorder: _border(AppColors.disabled),
        focusedBorder: _border(AppColors.disabled),
        errorBorder: _border(AppColors.red),
        focusedErrorBorder: _border(AppColors.red),
      ),
    );
  }

  Widget? _buildIcon() {
    if (widget.isPassword) {
      return IconButton(
        onPressed: () => setState(() => _isObscured = !_isObscured),
        icon: Icon(
          _isObscured ? Icons.visibility_off : Icons.visibility,
          color: AppColors.grey,
          size: 22.r,
        ),
      );
    }
    if (widget.prefixImage != null) {
      return Padding(
        padding: EdgeInsets.all(14.r),
        child: Image.asset(
          color: AppColors.grey,
          widget.prefixImage!,
          width: 20.r,
          height: 20.r,
          fit: BoxFit.contain,
        ),
      );
    }
    if (widget.prefixIcon != null) {
      return Icon(widget.prefixIcon, color: AppColors.grey, size: 22.r);
    }
    return null;
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius.r),
      borderSide: BorderSide(width: 1, color: color),
    );
  }
}
