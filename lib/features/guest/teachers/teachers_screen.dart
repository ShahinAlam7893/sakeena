import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/widgets/counselor_card.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';

class TeachersScreen extends StatelessWidget {
  const TeachersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counselors = [
      {
        'id': '1',
        'name': 'Dr. Fatima Rahman',
        'title': 'Clinical Psychologist & Islamic Scholar',
        'imagePath': 'assets/images/teacher_screen_image.png',
        'specialties': ['Islamic Psychology', 'Anxiety Management', 'Mindfulness'],
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
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
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
                      color: Color(0x33FFFFFF),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: Colors.white70),
                    ),
                    child: Text('Meet Our Experts', style: TextStyle(fontSize: 11.sp, color: Colors.white, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: 14.h),
                  Text('Our Teachers', textAlign: TextAlign.center, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w400, fontFamily: "Arimo", color: Colors.white)),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text('Discover courses that integrate Islamic wisdom with modern psychology', textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: Colors.white, fontFamily: 'Arimo', fontWeight: FontWeight.w400, height: 1.5)),
                  ),
                  SizedBox(height: 18.h),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 13.sp),
                      prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.8), size: 20.sp),
                      filled: true,
                      fillColor: Color(0x1AFFFFFF),
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.r), borderSide: BorderSide(color: Colors.white.withOpacity(0.6))),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.r), borderSide: const BorderSide(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            
            // Cards Section with Padding
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: counselors.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map counselor = entry.value;
                  
                  return Padding(
                    padding: EdgeInsets.only(bottom: index == counselors.length - 1 ? 0 : 16.h),
                    child: CounselorCard(
                      name: counselor['name'] as String,
                      title: counselor['title'] as String,
                      imagePath: counselor['imagePath'] as String,
                      specialties: List<String>.from(counselor['specialties'] as List),
                      rating: counselor['rating'] as double,
                      students: counselor['students'] as int,
                      courses: counselor['courses'] as int,
                      onViewProfile: () => context.push('/teachers_details_screen/${counselor['id']}'),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}