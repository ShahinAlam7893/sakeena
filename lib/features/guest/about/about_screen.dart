import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/about_feature_card.dart';
import 'package:sakeena/widgets/custom_button.dart';
import 'package:sakeena/widgets/stat_box.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Center(child: Text('About')),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF7AA4A5), Color(0xFF205A60)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: const Color(0x33FFFFFF),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: Colors.white70),
                      ),
                      child: Text(
                        'Est 2018',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      'About Sakeena Institute',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Arimo",
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Where Faith Meets Healing",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Arimo",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'We are a leading Islamic education and psychological guidance platform dedicated to helping Muslims worldwide achieve mental wellness through the integration of authentic Islamic teachings and evidence-based psychological practices.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontFamily: 'Arimo',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        StatBox(value: '25,000+', title: 'Students Served'),
                        StatBox(value: '50+', title: 'Expert Instructors'),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        StatBox(value: '45', title: 'Countries Reached'),
                        StatBox(value: '100+', title: 'Courses & Programs'),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomButton(
                          text: "About Us",
                          textColor: Colors.white,
                          onPressed: () {},
                          isGradient: true,
                          width: 98.w,
                          height: 37.h,
                        ),
                    Text(
                      "Empowering Muslims Through Knowledge & Guidance",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                        fontFamily: 'Arimo',
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "We are dedicated to providing authentic Islamic education and professional psychological guidance to Muslims worldwide. Our platform combines traditional Islamic scholarship with modern learning methods to create a comprehensive educational experience.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black87,
                        height: 1.5,
                        fontFamily: 'Arimo',
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    AboutFeatureCard(
                      title: 'Islamic Education',
                      description: 'Authentic Islamic knowledge guided by scholars',
                      iconPath: 'assets/icons/islamic_edu_icon.svg',
                      gradientColors: const [Color(0xFFBFF5EE), Color(0xFFE8FFFB)],
                      borderColor: const Color(0xFF2C7A7B),
                    ),
                    SizedBox(height: 16.h),
                    AboutFeatureCard(
                      title: 'Psychological Guidance',
                      description: 'Mental health & emotional wellbeing support',
                      iconPath: 'assets/icons/psychological_icon.svg',
                      gradientColors: const [Color(0xFFFFE29F), Color(0xFFFFF4CC)],
                      borderColor: const Color(0xFFE6A800),
                    ),
                    SizedBox(height: 16.h),
                    AboutFeatureCard(
                      title: 'Guided Healing Journey',
                      description: 'Structured programs combining faith, learning, and healing',
                      iconPath: 'assets/icons/Guided_icon.svg',
                      gradientColors: const [Color(0xFFD4F5C7), Color(0xFFF0FFE9)],
                      borderColor: const Color(0xFF4CAF50),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Our Story",
                        style: TextStyle(
                          fontFamily: 'Arimo',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Center(
                      child: Text(
                        "From a small initiative to a global community of healing",
                        style: TextStyle(
                          fontFamily: 'Arimo',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Sakeena Institute was born from a simple observation: Muslims around the world were struggling with mental health challenges but lacked resources that truly understood their unique spiritual and cultural context. Our founder, Dr. Fatima Rahman, witnessed this gap during her years of clinical practice and felt a calling to bridge traditional Islamic wisdom with modern psychological science.",
                      style: TextStyle(
                        fontFamily: 'Arimo',
                        fontSize: 14.sp,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }
}