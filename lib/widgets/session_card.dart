import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/custom_button.dart';

class SessionCardForTeacher extends StatelessWidget {
  final String title;
  final String time;
  final int studentCount;

  const SessionCardForTeacher({
    super.key,
    required this.title,
    required this.time,
    required this.studentCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  '$time • $studentCount students',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Color(0xFF2C7A7B).withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              'upcoming',
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFF2C7A7B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final String title;
  final String dateTime;
  final String topic;
  final bool isUpcoming;
  final VoidCallback onAction;

  const SessionCard({
    super.key,
    required this.title,
    required this.dateTime,
    required this.topic,
    required this.isUpcoming,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.all(16.0.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Color(0xFF3B8F97),
            ),
            child: Icon(
              Icons.calendar_today_rounded,
              size: 36.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 16.w),
          // Session Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              // Date and Time
              Text(
                dateTime,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
              ),
              SizedBox(height: 8.h),
              // Topic
              Text(
                'Topic: $topic',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
              ),
              SizedBox(height: 16.h),
              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (!isUpcoming)
                    CustomButton(
                      text: 'Join Session',
                      onPressed: () {},
                      height: 36.h,
                      width: 100.w,
                      isGradient: false,
                      isOutlined: true,
                      textColor: Colors.white,
                    ),
                  if (isUpcoming) ...[
                    SizedBox(width: 8.w),
                    CustomButton(
                      text: 'Join Session',
                      onPressed: () {},
                      height: 36.h,
                      width: 100.w,
                      isGradient: true,
                      textColor: Colors.white,
                    ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(
                    //     vertical: 6.h,
                    //     horizontal: 12.w,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     color: Colors.teal,
                    //     borderRadius: BorderRadius.circular(8.r),
                    //   ),
                    //   child: Text(
                    //     'Join Session',
                    //     style: TextStyle(
                    //       fontSize: 14.sp,
                    //       fontWeight: FontWeight.w600,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
