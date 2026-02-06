import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/model/course_model.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/course_card.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';
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
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   children: [
            //     IconButton(
            //       icon: const Icon(Icons.arrow_back),
            //       onPressed: () => context.pop(),
            //     ),
            //     Text('Back to Courses', style: TextStyle(fontSize: 14.sp)),
            //   ],
            // ),

            // SizedBox(height: 6.h),
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
  course: CourseData.mock(),
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
                    context.push(AppRoutes.coursesStandalone);

                  },
                  isGradient: true,
                  width: 70.w,
                  height: 35.h,
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
  course: CourseData.mock(),
)
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
