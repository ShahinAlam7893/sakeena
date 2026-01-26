import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseTaughtCard extends StatelessWidget {
  final String title;
  final String type; // Live Course / Recorded
  final Color typeColor;
  final double rating;
  final int students;

  const CourseTaughtCard({
    super.key,
    required this.title,
    required this.type,
    required this.typeColor,
    required this.rating,
    required this.students,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: typeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              type,
              style: TextStyle(
                fontSize: 11.sp,
                color: typeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 8.h),

          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 10.h),

          // Rating & Students
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 14.sp),
              SizedBox(width: 4.w),
              Text(
                rating.toString(),
                style: TextStyle(fontSize: 12.sp),
              ),
              const Spacer(),
              Icon(Icons.group, size: 14.sp, color: Colors.grey),
              SizedBox(width: 4.w),
              Text(
                students.toString(),
                style: TextStyle(fontSize: 12.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
