import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/core/app_theme.dart';
import 'package:sakeena/widgets/category_filter_button.dart';
import 'package:sakeena/widgets/course_card.dart';
import 'package:sakeena/widgets/teacher_bottom_navigation.dart';
import 'package:sakeena/widgets/view_only_access_card.dart';

import '../../../main.dart';
import '../../../route/teachers_routes.dart';
import '../_old_course_detail/course_detail.model.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  String selectedCategory = 'All';
  final List<String> categories = ['All', 'Mental Health', 'Spiritual Growth'];

  final List<Map<String, dynamic>> courses = [
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1609221228375-454d247aa74b?w=400&h=300&fit=crop',
      'category': 'Mental Health',
      'title': 'Tafsir Al-Quran: Understanding D...',
      'instructor': 'Dr. Ahmed Hassan',
      'lessons': 24,
      'weeks': 12,
      'totalHours': 12.0,
      'hoursPerSession': 2.0,
      'price': '99',
      'status': 'Active',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1516979187457-635ffe35ff15?w=400&h=300&fit=crop',
      'category': 'Upcoming',
      'title': 'Islamic Psychology: Building...',
      'instructor': 'Dr. Fatima Rahman',
      'lessons': 18,
      'weeks': 10,
      'totalHours': 12.0,
      'hoursPerSession': 1.0,
      'price': '79',
      'status': 'Upcoming',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1491841573634-28fb526b5293?w=400&h=300&fit=crop',
      'category': 'Upcoming',
      'title': 'Quran Memorization Techniques',
      'instructor': 'Sheikh Ali Khan',
      'lessons': 30,
      'weeks': 15,
      'totalHours': 12.0,
      'hoursPerSession': 1.0,
      'price': '119',
      'status': 'Upcoming',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyApp.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'S',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: MyApp.notificationDotColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Main Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 20.sp,
                          color: AppTheme.primaryColor,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Back to Courses',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Title Section
                  Text(
                    'My Assigned Courses',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'View your teaching assignments and course details',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // View-Only Access Card
                  const ViewOnlyAccessCard(),
                  SizedBox(height: 20.h),
                  // Category Filter
                  Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories.map((category) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: CategoryFilterButton(
                            label: category,
                            isSelected: selectedCategory == category,
                            onTap: () {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // My Courses Section
                  Text(
                    'My Courses',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Create and manage your course offerings',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Courses Grid
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      final course = courses[index];
                      return CourseCard(
                        imageUrl: course['imageUrl'],
                        category: course['category'],
                        title: course['title'],
                        instructor: course['instructor'],
                        lessons: course['lessons'],
                        weeks: course['weeks'],
                        totalHours: course['totalHours'],
                        hoursPerSession: course['hoursPerSession'],
                        price: course['price'],
                        onViewDetails: () {
                          context.push(
                            TeachersRoutes.courseDetail,
                            extra: CourseDetailModelOld(
                              courseTitle: course['title'],
                              instructor: course['instructor'],
                              category: course['category'],
                              status: 'Active',
                              price: course['price'],
                              duration: '${course['weeks']} weeks',
                              totalLessons: course['lessons'],
                              rating: 4.5,
                              totalEnrolled: 120,
                              students: [],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TeacherBottomNavigation(
        currentIndex: 2,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
