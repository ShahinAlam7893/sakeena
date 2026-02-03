// lib/widgets/testimonial_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TestimonialCard extends StatelessWidget {
  final String quote;
  final String authorName;
  final String authorLocation;

  const TestimonialCard({
    super.key,
    required this.quote,
    required this.authorName,
    required this.authorLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Opening quote icon
          SvgPicture.asset(
            'assets/icons/quote_open.svg', // ← add your quote SVG or use Icon
            width: 32.w,
            height: 32.h,
            colorFilter: const ColorFilter.mode(
              Color(0xFF2C7A7B), // your teal color
              BlendMode.srcIn,
            ),
          ),
          SizedBox(height: 12.h),

          // Quote text
          Text(
            quote,
            style: TextStyle(
              fontSize: 15.sp,
              height: 1.58,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade800,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 20.h),

          // Author info
          Row(
            children: [
              Container(
                width: 4.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C7A7B),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    authorLocation,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}