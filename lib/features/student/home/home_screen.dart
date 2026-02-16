import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sakeena/core/constant/app_colors.dart';

import 'package:sakeena/features/student/home/next_live_class_card.dart';
import 'package:sakeena/features/student/home/stat_card.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
    );
  }
}
