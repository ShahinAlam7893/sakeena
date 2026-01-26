import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AchievementSection extends StatelessWidget {
  final List<String> achievements;

  const AchievementSection({super.key, required this.achievements});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Achievements & Recognition',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12.h),
            ...achievements
                .map(
                  (achievement) => Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/circle_check_Icon_green.svg',
                          width: 20.sp,
                          height: 20.sp,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            achievement,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
