import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/core/app_theme.dart';
import 'package:sakeena/widgets/achievement_item.dart';
import 'package:sakeena/widgets/education_item.dart';
import 'package:sakeena/widgets/profile_header.dart';
import 'package:sakeena/widgets/profile_section_card.dart';
import 'package:sakeena/widgets/specialty_tag.dart';
import 'package:sakeena/widgets/teacher_bottom_navigation.dart';

import '../../../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final aboutController = TextEditingController(
    text: 'Introduce yourself, your experience, and expertise...',
  );
  final specialtyController = TextEditingController();

  List<String> specialties = [
    'Family Management',
    'Anxiety Psychology',
    'Child-Informed Care',
    'Boundaries',
    'CBT',
  ];

  List<Map<String, String>> educations = [
    {'degree': 'PhD in Clinical Psychology', 'institution': 'University of Cambridge'},
    {'degree': 'MA in Islamic Studies', 'institution': 'Al Azhar University'},
    {'degree': 'BA in Psychology', 'institution': 'University of London'},
  ];

  List<String> achievements = [
    'Published researcher in Islamic Psychology',
    'Speaker at International Islamic Psychology Conference',
    'Consultant for Muslim Mental Health Initiative',
    'Certified Mindfulness Instructor',
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
                  // Title
                  Text(
                    'Public Profile',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Manage what students see on your profile',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  // Profile Header
                  ProfileHeaderTeacher(
                    initials: 'FR',
                    onUploadPhoto: () {
                      // Handle photo upload
                    },
                    fullName: 'Dr. Fatima Rahman',
                    title: 'Professional Psychologist',
                    email: 'Learner@Sakeena.edu',
                    location: 'London, UK',
                  ),
                  // About & Professional Approach
                  ProfileSectionCard(
                    title: 'About & Professional Approach',
                    icon: Icons.info_outlined,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About Me',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        TextField(
                          controller: aboutController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                          ),
                          onChanged: (_) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '${aboutController.text.length} characters',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Specialties & Tags
                  ProfileSectionCard(
                    title: 'Specialties & Tags',
                    icon: Icons.local_offer_outlined,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 8.w,
                          runSpacing: 8.h,
                          children: specialties.map((specialty) {
                            return SpecialtyTag(
                              label: specialty,
                              onRemove: () {
                                setState(() {
                                  specialties.remove(specialty);
                                });
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: specialtyController,
                                decoration: InputDecoration(
                                  hintText: 'Add a specialty tag (e.g., Anxiety Psychology)',
                                  hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey.shade400,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade50,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 10.h,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            GestureDetector(
                              onTap: () {
                                if (specialtyController.text.isNotEmpty) {
                                  setState(() {
                                    specialties.add(specialtyController.text);
                                    specialtyController.clear();
                                  });
                                }
                              },
                              child: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Education
                  ProfileSectionCard(
                    title: 'Education',
                    icon: Icons.school_outlined,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...educations.map((education) {
                          return EducationItem(
                            degree: education['degree']!,
                            institution: education['institution']!,
                            icon: Icons.school,
                            onRemove: () {
                              setState(() {
                                educations.remove(education);
                              });
                            },
                          );
                        }).toList(),
                        SizedBox(height: 12.h),
                        GestureDetector(
                          onTap: () {
                            // Handle add education
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Text(
                                'Add Education',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Achievements & Credentials
                  ProfileSectionCard(
                    title: 'Achievements & Credentials',
                    icon: Icons.star_outlined,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...achievements.map((achievement) {
                          return AchievementItem(
                            title: achievement,
                            icon: Icons.check_circle,
                            onRemove: () {
                              setState(() {
                                achievements.remove(achievement);
                              });
                            },
                          );
                        }).toList(),
                        SizedBox(height: 12.h),
                        GestureDetector(
                          onTap: () {
                            // Handle add achievement
                          },
                          child: Container(
                            width: 40.w,
                            height: 40.w,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Add an achievement or credential...',
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey.shade400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 10.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle preview
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            side: BorderSide(color: AppTheme.primaryColor),
                          ),
                          child: Text(
                            'Preview Profile',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle save
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                          ),
                          child: Text(
                            'Save Public Profile',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    aboutController.dispose();
    specialtyController.dispose();
    super.dispose();
  }
}