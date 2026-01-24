import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/custom_button.dart';

class CounselorCard extends StatelessWidget {
  final String name;
  final String title;
  final String imagePath;
  final List<String> specialties;
  final double rating;
  final int students;
  final int courses;
  final VoidCallback onViewProfile;

  const CounselorCard({
    super.key,
    required this.name,
    required this.title,
    required this.imagePath,
    required this.specialties,
    required this.rating,
    required this.students,
    required this.courses,
    required this.onViewProfile,
  });

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full Width Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 180.h,
              fit: BoxFit.cover,
            ),
          ),

          // Content Below Image
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name & Title
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "Arimo",
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "Arimo",
                    color: Colors.grey.shade600,
                    height: 1.3,
                  ),
                ),

                SizedBox(height: 12.h),

                // Specialties
                Wrap(
                  spacing: 6.w,

                  children: specialties
                      .map(
                        (specialty) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            // color: teal.withOpacity(0.1),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(color: teal.withOpacity(0.3)),
                          ),
                          child: Text(
                            specialty,
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: teal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),

                SizedBox(height: 12.h),

                // Rating, Students, Courses
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _StatItem(
                      icon: Icons.star,
                      value: rating.toString(),
                      label: 'Rating',
                    ),
                    _StatItem(
                      icon: Icons.people,
                      value: students.toString(),
                      label: 'Students',
                    ),
                    _StatItem(
                      icon: Icons.book,
                      value: courses.toString(),
                      label: 'Courses',
                    ),
                  ],
                ),

                SizedBox(height: 14.h),

                // View Profile Button
                CustomButton(
                  text: 'View Profile',
                  onPressed: onViewProfile,
                  isGradient: true,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);

    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 16.sp, color: teal),
            SizedBox(width: 4.w),
            Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: teal,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Text(
          label,
          style: TextStyle(fontSize: 10.sp, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
