import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoDetailsSection extends StatefulWidget {
  const VideoDetailsSection({super.key});

  @override
  State<VideoDetailsSection> createState() => _VideoDetailsSectionState();
}

class _VideoDetailsSectionState extends State<VideoDetailsSection> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF205A60);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------ Video Thumbnail ------------------
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/demo_video_image.png',
                    height: 190.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 56.w,
                    height: 56.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.play_arrow,
                        size: 32.sp, color: teal),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ------------------ Title ------------------
                  Text(
                    'Student Success Stories',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Arimo',
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  // ------------------ Short Description ------------------
                  Text(
                    'Hear from students who have transformed their lives through our comprehensive programs.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // ------------------ About ------------------
                  Text(
                    'About this video',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  Text(
                    expanded
                        ? 'Welcome to Sakeena Institute, where we bridge the gap between authentic Islamic wisdom and modern psychological practices.\n\nIn this introductory video, Dr. Fatima Rahman shares the vision behind Sakeena and how our programs support holistic healing.'
                        : 'Welcome to Sakeena Institute, where we bridge the gap between authentic Islamic wisdom and modern psychological practices.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade700,
                      height: 1.6,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  // ------------------ Show More ------------------
                  GestureDetector(
                    onTap: () => setState(() => expanded = !expanded),
                    child: Text(
                      expanded ? 'Show less' : 'Show more',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: teal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
