
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/core/app_theme.dart';
import 'package:sakeena/widgets/custom_button.dart';

void showQuizResultDialog(
  BuildContext context,
  int score,
  int total,
  String moduleTitle,
) {
  final percentage = (score / total * 100).toStringAsFixed(0);
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundColor: AppTheme.successColor.withOpacity(0.15),
              child: Icon(
                Icons.check_circle,
                color: AppTheme.successColor,
                size: 48.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Congratulations!',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 8.h),
            Text(
              'You scored $score/$total ($percentage%)',
              style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade700),
            ),
            SizedBox(height: 24.h),
            CustomButton(
              text: 'Back to Course',
              height: 48.h,
              width: double.infinity,
              textColor: Colors.white,
              isGradient: true,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    ),
  );
}


