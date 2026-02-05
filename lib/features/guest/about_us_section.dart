import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/about_feature_card.dart';
import 'package:sakeena/widgets/custom_button.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF2FFFC), Color(0xFFFFFFFF), Color(0xFFF2FFFC)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // About Us pill
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0xFF2C7A7B),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'About Us',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(height: 12.h),

            Text(
              'Empowering Muslims Through\nKnowledge & Guidance',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                height: 1.3,
              ),
            ),

            SizedBox(height: 20.h),

            AboutFeatureCard(
              title: 'Islamic Education',
              description: 'Authentic Islamic knowledge guided by scholars',
              iconPath: 'assets/icons/islamic_edu_icon.svg',
              gradientColors: const [Color(0xFFBFF5EE), Color(0xFFE8FFFB)],
              borderColor: const Color(0xFF2C7A7B),
            ),

            SizedBox(height: 12.h),

            AboutFeatureCard(
              title: 'Psychological Guidance',
              description: 'Mental health & emotional wellbeing support',
              iconPath: 'assets/icons/psychological_icon.svg',
              gradientColors: const [Color(0xFFFFE29F), Color(0xFFFFF4CC)],
              borderColor: const Color(0xFFE6A800),
            ),

            SizedBox(height: 12.h),

            AboutFeatureCard(
              title: 'Guided Healing Journey',
              description:
                  'Structured programs combining faith, learning, and healing',
              iconPath: 'assets/icons/Guided_icon.svg',
              gradientColors: const [Color(0xFFD4F5C7), Color(0xFFF0FFE9)],
              borderColor: const Color(0xFF4CAF50),
            ),

            SizedBox(height: 24.h),

            Center(
              child: CustomButton(
                text: 'Read more about us',
                textColor: Colors.white,
                width: 200.w,
                height: 44.h,
                isGradient: true,
                onPressed: () {
                  context.push(AppRoutes.aboutScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
