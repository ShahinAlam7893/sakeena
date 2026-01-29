import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/widgets/counselor_card.dart';
import 'package:sakeena/widgets/past_consultation_card%20.dart';
import 'package:sakeena/widgets/session_card.dart';

class TeachersScreenForStudent extends StatelessWidget {
  const TeachersScreenForStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final counselors = [
      {
        'id': '1',
        'name': 'Dr. Fatima Rahman',
        'title': 'Clinical Psychologist & Islamic Scholar',
        'imagePath': 'assets/images/teacher_screen_image.png',
        'specialties': [
          'Islamic Psychology',
          'Anxiety Management',
          'Mindfulness',
        ],
        'rating': 4.9,
        'students': 2456,
        'courses': 8,
      },
      {
        'id': '2',
        'name': 'Sheikh Omar Ibrahim',
        'title': 'Islamic Scholar & Life Coach',
        'imagePath': 'assets/images/teacher_screen_image.png',
        'specialties': ['Islamic Studies', 'Personal Development', 'Quran'],
        'rating': 4.8,
        'students': 1890,
        'courses': 6,
      },
      {
        'id': '3',
        'name': 'Dr. Aisha Khan',
        'title': 'Psychologist & Wellness Expert',
        'imagePath': 'assets/images/teacher_screen_image.png',
        'specialties': ['Mental Health', 'Stress Management', 'Wellness'],
        'rating': 4.7,
        'students': 2120,
        'courses': 7,
      },
    ];

    return Scaffold(
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
          IconButton(color: Colors.black, onPressed: () {  }, icon: Icon(Icons.notifications_none),),
          SizedBox(width: 12.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Teachers & Consultants',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  // Text("View all"),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_circle_right_outlined),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: counselors.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map counselor = entry.value;

                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index == counselors.length - 1 ? 0 : 16.h,
                    ),
                    child: CounselorCard(
                      name: counselor['name'] as String,
                      title: counselor['title'] as String,
                      imagePath: counselor['imagePath'] as String,
                      specialties: List<String>.from(
                        counselor['specialties'] as List,
                      ),
                      rating: counselor['rating'] as double,
                      students: counselor['students'] as int,
                      courses: counselor['courses'] as int,
                      onViewProfile: () => context.push(
                        '/teachers_details_screen/${counselor['id']}',
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'Upcoming Sessions',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                // SizedBox(height: 16.h),
                SessionCard(
                  title: 'Dr. Fatima Rahman',
                  dateTime: 'Monday, January 8, 2024 at 2:00 PM',
                  topic: 'Stress Management',
                  isUpcoming: true,
                  onAction: () {
                    // Action to join the session
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Past Consultations',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SafeArea(
                    child: PastConsultationCard(
                      name: 'Dr. Fatima Rahman',
                      date: 'December 15, 2023',
                      topic: 'Work-life balance strategies',
                      imagePath: 'assets/images/teacher_screen_image.png',
                      onAction: () {
                        // Handle reschedule or other actions here
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
