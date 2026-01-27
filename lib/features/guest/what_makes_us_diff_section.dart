import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/featured_video_card.dart';

class WhatMakesUsDifferentSection extends StatelessWidget {
  const WhatMakesUsDifferentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'See What Makes Us Different',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF3A6E73),
                    fontFamily: 'Arimo',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.push(AppRoutes.videoLibraryScreen);
                  },
                  child: Row(
                    children: [
                      Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF2C7A7B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 14.w,
                        color: const Color(0xFF2C7A7B),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          // Horizontal list
          SizedBox(
            height: 260.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (_, __) => SizedBox(width: 14.w),
              itemBuilder: (context, index) {
                return FeatureVideoCard(
                  imagePath: 'assets/images/demo_video_image.png',
                  title: 'Welcome to Sakeena Institute',
                  description:
                      'Discover how we integrate Islamic wisdom with modern psychological practices for holistic healing.',
                  onTap: () {
                    // play video / navigate
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
