
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/core/app_theme.dart';
import 'package:sakeena/widgets/custom_button.dart';

void showAssignmentDialog(
  BuildContext context,
  String moduleTitle,
  String description,
) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Assignment • $moduleTitle',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 16.h),
            Text(
              description,
              style: TextStyle(
                fontSize: 13.sp,
                height: 1.5,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(height: 24.h),
            Center(
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.upload_file,
                      size: 40.sp,
                      color: AppTheme.primaryColor,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Click to upload or drag & drop\nPDF, DOCX (max 50MB)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Write your comment here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: 'Cancel',
                  height: 42.h,
                  width: 100.w,
                  isOutlined: true,
                  onPressed: () => Navigator.pop(context),
                ),
                CustomButton(
                  text: 'Submit',
                  height: 42.h,
                  width: 140.w,
                  isGradient: true,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Assignment submitted successfully!'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
