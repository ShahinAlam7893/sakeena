import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogAuthorInfoCard extends StatelessWidget {
  const BlogAuthorInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF3A6E73);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Title
          Text(
            "Finding Peace Through Islamic Mindfulness Practices",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              height: 1.28,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: 24.h),

          // Author block
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar circle
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: teal,
                ),
                child: Center(
                  child: Text(
                    "D",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 16.w),

              // Author info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Dr. Fatima Rahman",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      "Clinical Psychologist & Islamic Scholar specializing in mindfulness-based therapy",
                      style: TextStyle(
                        fontSize: 13.sp,
                        height: 1.5,
                        color: Colors.grey.shade800,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Responsive row for name, date, read time
                    Wrap(
                      spacing: 16.w,
                      runSpacing: 8.h,
                      children: [
                        // Author name
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.person_outline_rounded, size: 16.sp, color: teal),
                            SizedBox(width: 6.w),
                            Text(
                              "Dr. Fatima Rahman",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: teal,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        // Date
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.calendar_today_outlined, size: 16.sp, color: teal),
                            SizedBox(width: 6.w),
                            Text(
                              "Dec 28, 2025",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: teal,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        // Read time
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.timer_outlined, size: 16.sp, color: teal),
                            SizedBox(width: 6.w),
                            Text(
                              "5 min read",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: teal,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // Category tag
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: teal.withOpacity(0.08),
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(color: teal.withOpacity(0.3), width: 1),
            ),
            child: Text(
              "Spiritual Growth",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: teal,
              ),
            ),
          ),

          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}