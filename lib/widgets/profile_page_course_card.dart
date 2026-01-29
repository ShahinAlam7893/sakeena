import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/custom_button.dart';

class CourseProgressCard extends StatelessWidget {
  final String title;
  final String instructor;
  final String category;
  final double progress;
  final String courseThumbImage;

  const CourseProgressCard({
    super.key,
    required this.title,
    required this.instructor,
    required this.category,
    required this.progress,
    required this.courseThumbImage,
  });

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          /// 🔝 TOP SECTION
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Thumbnail
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      courseThumbImage,
                      width: 80.w,
                      height: 80.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              SizedBox(width: 12.w),

              /// Right Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Category pill
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: teal,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arimo',
                      ),
                    ),

                    SizedBox(height: 2.h),

                    Text(
                      'Dr. $instructor',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey.shade600,
                        fontFamily: 'Arimo',
                      ),
                    ),

                    SizedBox(height: 8.h),

                    /// Buttons
                    Row(
                      children: [
                        CustomButton(
                          text: "Certificate",
                          onPressed: () {},
                          isGradient: false,
                          textColor: Colors.black,
                          isOutlined: true,
                          width: 100.w,
                          height: 36.h,
                        ),
                        SizedBox(width: 8.w),
                        CustomButton(
                          text: "Continue",
                          onPressed: () {},
                          isGradient: true,
                          textColor: Colors.white,
                          width: 100.w,
                          height: 36.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          /// 🔽 PROGRESS SECTION
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Progress', style: TextStyle(fontSize: 11.sp)),
              Text(
                '${(progress * 100).round()}%',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: teal,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          SizedBox(height: 6.h),

          LinearProgressIndicator(
            value: progress,
            minHeight: 6.h,
            backgroundColor: Colors.grey.shade200,
            color: teal,
            borderRadius: BorderRadius.circular(12.r),
          ),

          SizedBox(height: 6.h),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '8 of 12 lessons completed',
              style: TextStyle(fontSize: 10.sp, color: Colors.grey.shade600),
            ),
          ),
        ],
      ),
    );
  }
}
