import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AboutFeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;
  final List<Color> gradientColors;
  final Color borderColor;

  const AboutFeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.gradientColors,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: borderColor, width: 2.w),
      ),
      child: Row(
        children: [
          SizedBox(width: 66.w, height: 66.w, child: _buildIcon()),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 4.h),
                Text(description,
                    style: TextStyle(fontSize: 11.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return SvgPicture.asset(
      iconPath,
      fit: BoxFit.contain,
    );
  }
}
