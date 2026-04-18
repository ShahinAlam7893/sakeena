import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/core/constant/app_colors.dart';
import 'package:sakeena/features/guest/about_us_section.dart';
import 'package:sakeena/features/guest/course/course_screen.dart';
import 'package:sakeena/features/guest/testimonials_section.dart';
import 'package:sakeena/features/guest/what_makes_us_diff_section.dart';
import 'package:sakeena/model/course_model.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/book_card.dart';
import 'package:sakeena/widgets/category_card.dart';
import 'package:sakeena/widgets/course_card.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';
import 'package:sakeena/widgets/custom_button.dart';
import 'package:sakeena/widgets/door_categories_card.dart';
import 'package:sakeena/widgets/expert_teachers_card.dart';
import 'package:sakeena/widgets/subscription_ads_card.dart';

class GuestHomeScreen extends StatelessWidget {
  const GuestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Header Section
              Stack(
                children: [
                  // Background image
                  SizedBox(
                    height: 320.h,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/guest_image_home_second.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 320.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.35),
                          Colors.black.withOpacity(0.75),
                        ],
                      ),
                    ),
                  ),

                  // Content
                  Positioned.fill(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white70),
                              color: Color(0x33205A60),
                            ),
                            child: Text(
                              'Integrating Faith & Modern Psychology',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          SizedBox(height: 16.h),

                          Text(
                            'Islamic Psychology & Education Platform',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 27.sp,
                              fontFamily: 'BarlowCondensed',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              height: 1.3,
                            ),
                          ),

                          SizedBox(height: 10.h),

                          Text(
                            'Sakeena Institute is about Islamic mental health, integrating Islamic therapy with modern psychology to guide you on a journey of healing, growth, and transformation.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arimo',
                            ),
                          ),

                          SizedBox(height: 24.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                text: 'Login',
                                width: 143.w,
                                height: 44.h,
                                isGradient: true,
                                textColor: Colors.white,
                                onPressed: () {
                                  context.push(AppRoutes.login);
                                },
                              ),
                              SizedBox(width: 12.w),
                              CustomButton(
                                text: 'Sign Up',
                                width: 143.w,
                                height: 44.h,
                                isOutlined: true,
                                textColor: Colors.white,
                                onPressed: () {
                                  context.push(AppRoutes.signup);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Featured Categories
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 12.h),
                child: Text(
                  'Featured Categories',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF3A6E73),
                    fontFamily: 'Arimo',
                  ),
                ),
              ),

              SizedBox(
                height: 170.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  children: [
                    DoorCategoryCard(
                      title: "Stress",
                      iconPath: 'assets/icons/stress_Icon.svg',
                      onTap: () {
                        context.push(AppRoutes.coursesScreen);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => const CoursesPage(),
                        //   ),
                        // );
                      },
                    ),
                    DoorCategoryCard(
                      title: "Anxiety",
                      iconPath: 'assets/icons/anxiety_icon.svg',
                      onTap: () {context.push(AppRoutes.coursesScreen);},
                    ),
                    DoorCategoryCard(
                      title: "Depression",
                      iconPath: 'assets/icons/depression_Icon.svg',
                      onTap: () {context.push(AppRoutes.coursesScreen);},
                    ),
                    DoorCategoryCard(
                      title: "Relationships",
                      iconPath: 'assets/icons/relationship_Icon.svg',
                      onTap: () {context.push(AppRoutes.coursesScreen);},
                    ),
                    DoorCategoryCard(
                      title: "Spiritual Growth",
                      iconPath: 'assets/icons/love_icon.svg',
                      onTap: () {context.push(AppRoutes.coursesScreen);},
                    ),
                  ],
                ),
              ),

              // SizedBox(
              //   height: 180.h,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     padding: EdgeInsets.symmetric(horizontal: 24.w),
              //     children: const [
              //       CategoryCard(
              //         title: 'Stress',
              //         description: 'Manage daily pressures with Islamic wisdom',
              //         color: Color(0xFFFF8904),
              //         iconPath: 'assets/icons/stress_Icon.svg',
              //       ),
              //       CategoryCard(
              //         title: 'Anxiety',
              //         description: 'Find peace through faith and practice',
              //         color: Color(0xFFFDC700),
              //         iconPath: 'assets/icons/anxiety_icon.svg',
              //       ),
              //       CategoryCard(
              //         title: 'Depression',
              //         description: 'Healing journey with spiritual support',
              //         color: Color(0xFF51A2FF),
              //         iconPath: 'assets/icons/depression_Icon.svg',
              //       ),
              //       CategoryCard(
              //         title: 'Relationships',
              //         description: 'Build healthy Islamic relationships',
              //         color: Color(0xFFF6339A),
              //         iconPath: 'assets/icons/relationship_Icon.svg',
              //       ),
              //       CategoryCard(
              //         title: 'Spiritual Growth',
              //         description: 'Deepen your connection with Allah',
              //         color: Color(0xFF00BBA7),
              //         iconPath: 'assets/icons/love_icon.svg',
              //       ),
              //     ],
              //   ),
              // ),

              // Our Courses Section
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Our Courses',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3A6E73),
                        fontFamily: 'Arimo',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go(AppRoutes.coursesScreen);
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

              SizedBox(
                height: 380.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  children: [
                    CourseCard(course: CourseData.mock()),

                    CourseCard(course: CourseData.mock()),
                    CourseCard(course: CourseData.mock()),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              SubscriptionAdsCard(
                title: 'Full Membership Subscription',
                description:
                    'Get unlimited access to all current and future courses',
                price: '49',
                isActive: true,
                buttonText: 'Get Premium',
                features: const [
                  'Access to all existing courses',
                  'New content added monthly',
                  'Certificate of completion',
                  'All upcoming courses included',
                  'Cancel anytime',
                  'Community forum access',
                ],
                onPressed: () {
                  context.push(AppRoutes.subscription);
                },
                iconPath: 'assets/icons/subscription_icon.svg',
              ),

              // Our Courses Section
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Expert Teachers & Counselors',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3A6E73),
                        fontFamily: 'Arimo',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push(AppRoutes.teachersScreen);
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
              SizedBox(
                height: 290.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  children: [
                    ExpertTeachersCard(
                      name: "Tehmeena Hanif",
                      subject: "Tafsir & Quranic Studies",
                      description:
                          "PhD in Islamic Studies with 20+ years of teaching experience",
                      imagePath: "assets/images/teacher_image.png",
                      onReadMore: () {},
                    ),
                    SizedBox(width: 10.w),
                    ExpertTeachersCard(
                      name: "Tehmeena Hanif",
                      subject: "Tafsir & Quranic Studies",
                      description:
                          "PhD in Islamic Studies with 20+ years of teaching experience",
                      imagePath: "assets/images/teacher_image.png",
                      onReadMore: () {
                        context.push(AppRoutes.aboutScreen);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              AboutUsSection(),

              WhatMakesUsDifferentSection(),

              // Books & Publications Section
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Books & Publications',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3A6E73),
                        fontFamily: 'Arimo',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push(AppRoutes.booksPage);
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
              SizedBox(
                height: 365.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  children: const [
                    BookCard(
                      title: 'Healing the Anxious Heart',
                      author: 'Dr. Sarah Ahmed',
                      price: '\$99',
                      imagePath: 'assets/images/book_image.png',
                      tagText: 'Both',
                      tagColor: Color(0xFF2C7A7B),
                    ),
                    BookCard(
                      title: 'Healing the Anxious Heart',
                      author: 'Dr. Sarah Ahmed',
                      price: '\$99',
                      imagePath: 'assets/images/book_two.png',
                      tagText: 'eBook',
                      tagColor: Colors.blue,
                    ),
                    BookCard(
                      title: 'Islamic Psychology Guide',
                      author: 'Dr. Sarah Ahmed',
                      price: '\$99',
                      imagePath: 'assets/images/book_three.png',
                      tagText: 'Physical',
                      tagColor: Colors.orange,
                    ),
                  ],
                ),
              ),
              const TestimonialsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
