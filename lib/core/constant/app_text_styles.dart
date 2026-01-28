// app_text_styles.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/core/constant/app_colors.dart';

class AppTextStyles {
  static TextStyle greeting({double? size}) => TextStyle(
        fontSize: size?.sp ?? 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      );

  static TextStyle subtitle({double? size}) => TextStyle(
        fontSize: size?.sp ?? 14.sp,
        color: AppColors.textGrey,
        fontWeight: FontWeight.w400,
      );

  static TextStyle cardTitle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static TextStyle cardNumber = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static TextStyle buttonText = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}