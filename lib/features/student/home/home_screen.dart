import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sakeena/core/constant/app_colors.dart';
import 'package:sakeena/features/student/home/greeting_section.dart';
import 'package:sakeena/features/student/home/next_live_class_card.dart';
import 'package:sakeena/features/student/home/stat_card.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 80.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w, bottom: 10.h),
          child: SvgPicture.asset(
            'assets/images/sakeena_logo.svg',
            width: 42.w,
            height: 42.h,
            fit: BoxFit.contain,
          ),
        ),
        actions: [Icon(Icons.notifications_none)],
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200.h,
                child: SvgPicture.asset(
                  'assets/images/student_home_banner.svg',
                  fit: BoxFit.cover,
                ),
              ),

              // CONTENT WITH PADDING
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatCard(
                      title: 'Active Courses',
                      value: '1',
                      icon: Icons.menu_book_outlined,
                    ),
                    12.verticalSpace,

                    StatCard(
                      title: "Your Book",
                      value: "2",
                      icon: Icons.menu_book_outlined,
                    ),
                    12.verticalSpace,

                    StatCard(
                      title: "Your Order",
                      value: "3",
                      icon: Icons.menu_book_outlined,
                    ),

                    28.verticalSpace,

                    NextLiveClassCard(
                      title: 'Next Live Class',
                      courseName: 'Complete Web Development Bootcamp',
                      instructor: 'John Doe',
                      dateTime: '2026-01-15 at 18:00',
                      onJoin: () {},
                    ),

                    40.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation (placeholder)
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Courses"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
