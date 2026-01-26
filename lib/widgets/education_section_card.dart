import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EducationSection extends StatelessWidget {
  final List<EducationItemModel> educationList;

  const EducationSection({
    super.key,
    required this.educationList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16.h),

          ...educationList.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;

            return Column(
              children: [
                EducationItem(item: item),
                if (index != educationList.length - 1)
                  Divider(height: 24.h),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}

class EducationItem extends StatelessWidget {
  final EducationItemModel item;

  const EducationItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: teal.withOpacity(0.4)),
            color: Color(0xFFE8FBF7)
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/badge_Icon.svg',
              width: 18.sp,
              colorFilter:
                  const ColorFilter.mode(teal, BlendMode.srcIn),
            ),
          ),
        ),

        SizedBox(width: 12.w),

        // Text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.degree,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                item.institute,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                item.year,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// ================= MODEL =================
class EducationItemModel {
  final String degree;
  final String institute;
  final String year;

  EducationItemModel({
    required this.degree,
    required this.institute,
    required this.year,
  });
}
