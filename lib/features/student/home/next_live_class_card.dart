import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextLiveClassCard extends StatelessWidget {
  final String title;
  final String courseName;
  final String instructor;
  final String dateTime;
  final VoidCallback onJoin;

  const NextLiveClassCard({
    super.key,
    required this.title,
    required this.courseName,
    required this.instructor,
    required this.dateTime,
    required this.onJoin,
  });

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6F4),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // -------- Left Content --------
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 6.h),

                Text(
                  courseName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4.h),

                Text(
                  'with $instructor',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 10.h),

                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined,
                        size: 14.sp, color: Colors.grey.shade600),
                    SizedBox(width: 6.w),
                    Text(
                      dateTime,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // -------- Join Button --------
          ElevatedButton(
            onPressed: onJoin,
            style: ElevatedButton.styleFrom(
              backgroundColor: teal,
              elevation: 0,
              padding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            child: Text(
              'Join Class',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
