import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/custom_button.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teal = const Color(0xFF3A6E73);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'How It Works',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Arimo',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge
              Container(
                height: 48.h,
                width: 160.w,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: teal,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.video_camera_back_outlined,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      'Private Sessions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: 'Arimo',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'One-on-One Consultation',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontFamily: 'Arimo',
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Connect directly with our expert Islamic counselors and psychologists for personalized guidance. Whether you\'re dealing with personal challenges, family issues, or seeking spiritual growth, our certified professionals are here to support you.',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.black,
                  fontFamily: 'Arimo',
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20.h),
              ...[
                'One-on-one video sessions with certified Islamic counselors',
                'Flexible scheduling - book sessions at your convenience',
                'Confidential and secure consultations',
                'Personalized guidance tailored to your needs',
                'Follow-up support and resources',
              ].map(
                (feature) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/circle_check_Icon.svg',
                        width: 20.w,
                        height: 20.h,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          feature,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'Arimo',
                            color: Colors.black,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              // How It Works Card
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: teal,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How It Works',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Arimo',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ...[
                      (
                        'Choose a Counselor',
                        'Browse profiles and select a counselor that matches',
                      ),
                      (
                        'Select Time Slot',
                        'Pick a date and time that works best for your schedule',
                      ),
                      (
                        'Complete Booking',
                        'Securely book and pay for your consultation session',
                      ),
                      (
                        'Join Your Session',
                        'Receive a secure video link and join at the scheduled',
                      ),
                    ].asMap().entries.map(
                      (e) => Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 16.r,
                              backgroundColor: Colors.white.withOpacity(0.3),
                              child: Text(
                                '${e.key + 1}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Arimo',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.value.$1,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'Arimo',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    e.value.$2,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontFamily: 'Arimo',
                                      color: Colors.white70,
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Session Duration Card
                    Container(
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Session Duration',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: 'Arimo',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.timer, size: 14.sp, color: teal),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '60 minutes',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Starting From',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              Text(
                                '\$75',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'Arimo',
                                  fontWeight: FontWeight.bold,
                                  color: teal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: 'Book Consultation',
                            onPressed: () {
                              context.push(AppRoutes.teachersScreen);
                            },
                            isGradient: true,
                            textColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: CustomButton(
                            text: 'View Counselors',
                            onPressed: () {
                              context.push(AppRoutes.teachersScreen);
                            },
                            isGradient: false,
                            textColor: teal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
