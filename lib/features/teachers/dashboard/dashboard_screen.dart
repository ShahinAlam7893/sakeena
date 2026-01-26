import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/core/app_theme.dart';
import 'package:sakeena/widgets/stat_card.dart';
import 'package:sakeena/widgets/session_card.dart';
import 'package:sakeena/widgets/upload_item.dart';
import 'package:sakeena/widgets/teacher_bottom_navigation.dart';

import '../../../main.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});


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
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Section
                  Text(
                    'Teacher Dashboard',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Welcome back! Here\'s your overview for today.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Stat Cards
                  StatCard(
                    title: 'Active Courses',
                    value: '8',
                    icon: Icons.book_outlined,
                    backgroundColor: Color(0xFFE3F2FD),
                    iconColor: Color(0xFF2196F3),
                  ),
                  SizedBox(height: 12.h),
                  StatCard(
                    title: 'Live Sessions Today',
                    value: '3',
                    icon: Icons.videocam_outlined,
                    backgroundColor: Color(0xFFE8F5E9),
                    iconColor: Color(0xFF4CAF50),
                  ),
                  SizedBox(height: 12.h),
                  StatCard(
                    title: 'Uploaded Content',
                    value: '42',
                    icon: Icons.cloud_upload_outlined,
                    backgroundColor: Color(0xFFF3E5F5),
                    iconColor: Color(0xFF9C27B0),
                  ),
                  SizedBox(height: 32.h),
                  // Upcoming Live Sessions
                  Text(
                    'Upcoming Live Sessions',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SessionCard(
                    title: 'Introduction to Python',
                    time: '10:00 AM',
                    studentCount: 32,
                  ),
                  SessionCard(
                    title: 'Advanced JavaScript',
                    time: '2:00 PM',
                    studentCount: 28,
                  ),
                  SessionCard(
                    title: 'Database Design',
                    time: '4:30 PM',
                    studentCount: 25,
                  ),
                  SizedBox(height: 32.h),
                  // Recent Uploads
                  Text(
                    'Recent Uploads',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  UploadItem(
                    fileName: 'Week 5 Assignment.pdf',
                    category: 'Web Development',
                    date: 'Jan 5, 2026',
                  ),
                  UploadItem(
                    fileName: 'Lecture Recording.mp4',
                    category: 'Data Science',
                    date: 'Jan 4, 2026',
                  ),
                  UploadItem(
                    fileName: 'Study Guide.pdf',
                    category: 'Python Basics',
                    date: 'Jan 3, 2026',
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TeacherBottomNavigation(
        currentIndex: 0,
        onTap: (index) {
          
        },
      ),
    );
  }
}
