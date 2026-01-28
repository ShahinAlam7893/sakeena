import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/course_card.dart';
import 'package:sakeena/widgets/custom_button.dart';
import 'package:sakeena/widgets/filter_section.dart';

class MyCourseScreen extends StatefulWidget {
  const MyCourseScreen({super.key});

  @override
  State<MyCourseScreen> createState() => _MyCourseScreenState();
}

class _MyCourseScreenState extends State<MyCourseScreen> {
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Live', 'Recorded', 'Upcoming'];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 80.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: SvgPicture.asset(
            'assets/images/sakeena_logo.svg',
            width: 42.w,
            height: 42.h,
          ),
        ),
        actions: [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 12.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => context.pop(),
                ),
                Text('Back to Courses', style: TextStyle(fontSize: 14.sp)),
              ],
            ),

            SizedBox(height: 6.h),

            Text(
              'My Courses',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2C7A7B),
              ),
            ),

            SizedBox(height: 16.h),

            SizedBox(
              height: 350.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                separatorBuilder: (_, __) => SizedBox(width: 16.w),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 250.w,
                    child: CourseCard(
                      title: index == 0
                          ? 'Mindfulness in Islam'
                          : 'Islamic Psychology Basics',
                      instructor: index == 0
                          ? 'Sheikh Omar Ibrahim'
                          : 'Dr. Aisha Khan',
                      sessionDuration: index == 0
                          ? '2hr per session'
                          : '60 min',
                      numberOfWeeks: index == 0 ? '12 weeks' : '8 weeks',
                      duration: index == 0 ? '24 Lessons' : '16 Lessons',
                      lessons: index == 0 ? '24 Lessons' : '16 Lessons',
                      price: index == 0 ? '\$99' : '\$79',
                      imagePath: index == 0
                          ? 'assets/images/quran_recite_image.png'
                          : 'assets/images/quran_image.png',
                      isSvgImage: false,
                      isUpcoming: index == 1,
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20.h),
            FilterSection(
              title: 'Types',
              items: categories,
              selectedItem: selectedCategory,
              onSelected: (v) => setState(() => selectedCategory = v),
              isHorizontal: true,
            ),

            SizedBox(height: 20.h),

            /// Courses Section Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Courses',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Arimo',
                        color: Color(0xFF009689),
                      ),
                    ),
                    Text(
                      'Join interactive sessions with expert instructors',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arimo',
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  text: "View all",
                  onPressed: () {
                    context.push(AppRoutes.coursesScreen);
                  },
                  isGradient: true,
                  width: 70.w,
                  height: 44.h,
                  textColor: Colors.white,
                ),
              ],
            ),

            SizedBox(height: 12.h),

            /// Courses Horizontal List
            SafeArea(
              child: SizedBox(
                height: 350.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  separatorBuilder: (_, __) => SizedBox(width: 16.w),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 250.w,
                      child: CourseCard(
                        title: index == 0
                            ? 'Tafsir Al-Quran: Understanding Divine Message'
                            : 'Quran & Mental Wellness',
                        instructor: index == 0
                            ? 'Dr. Ahmad Hassan'
                            : 'Prof. Ahmed Hassan',
                        sessionDuration: '2hr per session',
                        numberOfWeeks: '12 weeks',
                        duration: '24 Lessons',
                        lessons: '24 Lessons',
                        price: '\$99',
                        imagePath: 'assets/images/quran_recite_image.png',
                        isSvgImage: false,
                        isUpcoming: index == 0,
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
