import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassCard extends StatelessWidget {
  final String courseName;
  final String instructorName;
  final String status;  // e.g., "Enrolled", "Not Enrolled"
  final VoidCallback onJoinClass;

  const ClassCard({
    super.key,
    required this.courseName,
    required this.instructorName,
    required this.status,
    required this.onJoinClass,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              courseName,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Instructor: $instructorName',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Status: $status',
              style: TextStyle(
                fontSize: 12.sp,
                color: status == 'Enrolled' ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: onJoinClass,
              style: ElevatedButton.styleFrom(
                iconColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Join Class',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
