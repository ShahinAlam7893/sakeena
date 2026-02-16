import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoorCategoryCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  const DoorCategoryCard({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140.w,
        margin: EdgeInsets.only(right: 18.w),
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// Door Background
            Image.asset(
              'assets/images/door.png',
              width: 140.w,
              height: 160.h,
              fit: BoxFit.contain,
            ),

            /// Content Overlay
            Positioned(
              top: 40.h,
              child: Column(
                children: [
                  SvgPicture.asset(
                    iconPath,
                    height: 28.h,
                    width: 28.w,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 90.w,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
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
