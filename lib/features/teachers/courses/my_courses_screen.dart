import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/features/teachers/course_detail/course_detail_screen.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/category_filter_button.dart';
import 'package:sakeena/widgets/course_card.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';
import 'package:sakeena/widgets/view_only_access_card.dart';
import '../../../core/app_theme.dart';
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
      'status': 'Live',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1609221228375-454d247aa74b?w=400&h=300&fit=crop',
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
          'https://images.unsplash.com/photo-1609221228375-454d247aa74b?w=400&h=300&fit=crop',
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
      
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
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
                style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
              ),
              SizedBox(height: 16.h),
              const ViewOnlyAccessCard(),
              SizedBox(height: 20.h),
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
                style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
              ),
              SizedBox(height: 16.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return CourseCardTeacher(
                    imageUrl: course['imageUrl'],
                    category: course['category'],
                    title: course['title'],
                    instructor: course['instructor'],
                    lessons: course['lessons'],
                    weeks: course['weeks'],
                    totalHours: course['totalHours'],
                    hoursPerSession: course['hoursPerSession'],
                    price: course['price'],
                    status: course['status'],
                    onViewDetails: () {
  if (course['status'] == 'Upcoming') {
    // Show popup dialog for Upcoming courses
    showDialog(
      context: context,
      builder: (_) => CourseDetailDialog(
        course: CourseDetailModelOld(
          courseTitle: course['title'],
          instructor: course['instructor'],
          category: course['category'],
          status: course['status'],
          price: course['price'],
          duration: '${course['weeks']} weeks',
          totalLessons: course['lessons'],
          rating: 4.5,
          totalEnrolled: 120,
          students: [
            {'name': 'Emma Wilson', 'email': 'emma.w@email.com'},
            {'name': 'Michael Chen', 'email': 'michael.c@email.com'},
            // Add more students dynamically
          ],
        ),
      ),
    );
  } else {
    // Navigate to full screen course details for Active/Live courses
    context.push(
      AppRoutes.courseDetails,
      extra: CourseDetailModelOld(
        courseTitle: course['title'],
        instructor: course['instructor'],
        category: course['category'],
        status: course['status'],
        price: course['price'],
        duration: '${course['weeks']} weeks',
        totalLessons: course['lessons'],
        rating: 4.5,
        totalEnrolled: 120,
        students: [
          {'name': 'Emma Wilson', 'email': 'emma.w@email.com'},
          {'name': 'Michael Chen', 'email': 'michael.c@email.com'},
        ],
      ),
    );
  }
}


                    // onViewDetails: () {
                    //   print("Navigating to detail...");
                    //   context.push(
                    //     // TeachersRoutes.courseDetail,
                    //     AppRoutes.courseDetails,
                    //     extra: CourseDetailModelOld(
                    //       courseTitle: course['title'],
                    //       instructor: course['instructor'],
                    //       category: course['category'],
                    //       status: course['status'],
                    //       price: course['price'],
                    //       duration: '${course['weeks']} weeks',
                    //       totalLessons: course['lessons'],
                    //       rating: 4.5,
                    //       totalEnrolled: 120,
                    //       students: [],
                    //     ),
                    //   );
                    // },
                  );
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
