import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/widgets/custom_button.dart';

class CounselorDetailPage extends StatelessWidget {
  final String counselorId;

  const CounselorDetailPage({
    super.key,
    required this.counselorId,
  });

  // Mock data - Replace with API call or state management
  Map<String, dynamic> _getCounselorData() {
    final counselorsData = {
      '1': {
        'name': 'Dr. Fatima Rahman',
        'title': 'Clinical Psychologist & Islamic Scholar',
        'imagePath': 'assets/images/teacher_screen_image.png',
        'availability': 'Available',
        'email': 'fatima@sakeena.com',
        'location': 'London, UK',
        'rating': 4.9,
        'students': 2456,
        'courses': 8,
        'specialties': ['Islamic Psychology', 'Anxiety Management', 'Mindfulness'],
        'about': 'Dr. Fatima Rahman is a board-certified clinical psychologist with over 10 years of experience in integrating Islamic principles with evidence-based psychological treatments. She holds a PhD in Clinical Psychology and has completed specialized training in Islamic counseling and mindfulness-based interventions. Her approach combines trauma-informed care with Quranic wisdom to provide holistic support.',
      },
      '2': {
        'name': 'Sheikh Omar Ibrahim',
        'title': 'Islamic Scholar & Life Coach',
        'imagePath': 'assets/images/teacher_screen_image.png',
        'availability': 'Available',
        'email': 'omar@sakeena.com',
        'location': 'Dubai, UAE',
        'rating': 4.8,
        'students': 1890,
        'courses': 6,
        'specialties': ['Islamic Studies', 'Personal Development', 'Quran'],
        'about': 'Sheikh Omar Ibrahim is a respected Islamic scholar with expertise in Quranic interpretation and Islamic psychology. With 15 years of experience in Islamic education and counseling, he specializes in helping individuals navigate life challenges through Islamic principles and guidance.',
      },
      '3': {
        'name': 'Dr. Aisha Khan',
        'title': 'Psychologist & Wellness Expert',
        'imagePath': 'assets/images/teacher_screen_image.png',
        'availability': 'Available',
        'email': 'aisha@sakeena.com',
        'location': 'Toronto, Canada',
        'rating': 4.7,
        'students': 2120,
        'courses': 7,
        'specialties': ['Mental Health', 'Stress Management', 'Wellness'],
        'about': 'Dr. Aisha Khan is a licensed psychologist specializing in mental health and wellness. She combines Western psychological practices with Eastern mindfulness techniques to create comprehensive wellness programs that address physical, mental, and spiritual health.',
      },
    };

    return counselorsData[counselorId] ??
        {
          'name': 'Unknown',
          'title': 'Professional',
          'imagePath': 'assets/images/teacher_screen_image.png',
          'availability': 'Not Available',
          'email': 'unknown@sakeena.com',
          'location': 'Unknown',
          'rating': 0.0,
          'students': 0,
          'courses': 0,
          'specialties': [],
          'about': 'No information available',
        };
  }

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);
    final data = _getCounselorData();

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text('Back to Teachers', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24.h),
              color: Colors.white,
              child: Column(
                children: [
                  CircleAvatar(radius: 50.r, backgroundImage: AssetImage(data['imagePath'] as String)),
                  SizedBox(height: 12.h),
                  Text(data['name'] as String, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.black87)),
                  SizedBox(height: 4.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(data['title'] as String, style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600, height: 1.3), textAlign: TextAlign.center),
                  ),
                  SizedBox(height: 12.h),
                  // Contact Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email_outlined, size: 14.sp, color: Colors.grey.shade600),
                      SizedBox(width: 6.w),
                      Text(data['email'] as String, style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade600)),
                      SizedBox(width: 12.w),
                      Icon(Icons.location_on_outlined, size: 14.sp, color: Colors.grey.shade600),
                      SizedBox(width: 6.w),
                      Text(data['location'] as String, style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade600)),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  // Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _StatBadge(icon: Icons.star, value: (data['rating'] as double).toString(), label: 'Rating'),
                      SizedBox(width: 24.w),
                      _StatBadge(icon: Icons.book, value: (data['courses'] as int).toString(), label: 'Courses'),
                      SizedBox(width: 24.w),
                      _StatBadge(icon: Icons.people, value: (data['students'] as int).toString(), label: 'Students'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            // Availability Badge
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(color: teal.withOpacity(0.1), borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, size: 8.sp, color: Colors.green),
                    SizedBox(width: 6.w),
                    Text(data['availability'] as String, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600, color: teal)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            // Specialties
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: (data['specialties'] as List<String>).map((specialty) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: teal.withOpacity(0.3)),
                  ),
                  child: Text(specialty, style: TextStyle(fontSize: 11.sp, color: teal, fontWeight: FontWeight.w500)),
                )).toList(),
              ),
            ),
            SizedBox(height: 20.h),
            // Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  CustomButton(
                    text: 'Book Consultation',
                    onPressed: () => context.go('/how_it_works'),
                    isGradient: true,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 12.h),
                  CustomButton(
                    text: 'View Courses',
                    onPressed: () => context.go('/courses_screen'),
                    isGradient: true,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            // About Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black87)),
                  SizedBox(height: 10.h),
                  Text(data['about'] as String, style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade700, height: 1.6)),
                ],
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatBadge({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);

    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 16.sp, color: teal),
            SizedBox(width: 4.w),
            Text(value, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: teal)),
          ],
        ),
        SizedBox(height: 4.h),
        Text(label, style: TextStyle(fontSize: 10.sp, color: Colors.grey.shade600)),
      ],
    );
  }
}