import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PastConsultationCard extends StatelessWidget {
  final String name;
  final String date;
  final String topic;
  final String imagePath; // Image of the counselor
  final VoidCallback onAction;

  const PastConsultationCard({
    super.key,
    required this.name,
    required this.date,
    required this.topic,
    required this.imagePath,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
      ),
      child: Row(
        children: [
          // Profile Image
          ClipOval(
            child: Image.asset(
              imagePath,
              width: 48.w,
              height: 48.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          // Consultation Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Counselor Name
              Text(
                name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              // Consultation Date
              Text(
                date,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
              ),
              SizedBox(height: 8.h),
              // Consultation Topic
              Text(
                'Topic: $topic',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
