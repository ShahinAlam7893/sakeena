import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/custom_button.dart';

class BookFormatSelection extends StatelessWidget {
  final VoidCallback onReadBook;
  final VoidCallback onWatchVideo;
  final String bookTitle;

  const BookFormatSelection({
    super.key,
    required this.onReadBook,
    required this.onWatchVideo,
    required this.bookTitle,
  });

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose How to Learn',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Select your preferred format to get started',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 20.h),
          
          // Read Book Option
          _FormatCard(
            icon: Icons.book_rounded,
            title: 'Read Book',
            description: 'Access the complete PDF version',
            onTap: onReadBook,
            color: Colors.blue,
          ),
          SizedBox(height: 12.h),
          
          // Watch Video Option
          _FormatCard(
            icon: Icons.play_circle_outline_rounded,
            title: 'Watch Video',
            description: 'Learn through video content',
            onTap: onWatchVideo,
            color: teal,
          ),
        ],
      ),
    );
  }
}

class _FormatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;
  final Color color;

  const _FormatCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: Border.all(color: color.withOpacity(0.3), width: 1.5.w),
          borderRadius: BorderRadius.circular(12.r),
          color: color.withOpacity(0.05),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: color, size: 24.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14.sp,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}