import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sakeena/widgets/custom_button.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String instructor;
  final String sessionDuration;
  final String numberOfWeeks;
  final String duration;
  final String lessons;
  final String price;
  final String? imagePath; // path to image (SVG, PNG, JPG, etc.)
  final bool
  isSvgImage; // ← NEW: true = use SvgPicture, false = use Image.asset
  final bool isUpcoming;

  const CourseCard({
    super.key,
    required this.title,
    required this.instructor,
    required this.sessionDuration,
    required this.numberOfWeeks,
    required this.duration,
    required this.lessons,
    required this.price,
    this.imagePath,
    this.isSvgImage = false, // default: treat as raster image
    this.isUpcoming = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.w,
      height: 400.h,
      margin: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            child: SizedBox(
              height: 140.h,
              width: double.infinity,
              child: imagePath != null
                  ? (isSvgImage
                        ? SvgPicture.asset(
                            imagePath!,
                            height: 140.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholderBuilder: (context) =>
                                _placeholderImage(),
                          )
                        : Image.asset(
                            imagePath!,
                            height: 140.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                _errorImage(),
                          ))
                  : _placeholderImage(),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (isUpcoming)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2C7A7B).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        'Upcoming',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2C7A7B),
                        ),
                      ),
                    ),

                  SizedBox(height: isUpcoming ? 8.h : 0),

                  Flexible(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/healthicons_doctor-male.svg',
                        width: 14.sp,
                        height: 14.sp,
                        colorFilter: ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          instructor,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black87,
                            fontFamily: 'Arimo',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8.h),

                  Row(
                    children: [
                      Icon(
                        Icons.menu_book_sharp,
                        size: 14.sp,
                        color: Colors.black,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          '$lessons ',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontFamily: 'Arimo',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.calendar_month,
                        size: 14.sp,
                        color: Colors.black,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          numberOfWeeks,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontFamily: 'Arimo',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8.h),

                  Row(
                    children: [
                      Icon(Icons.schedule, size: 14.sp, color: Colors.black),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          duration,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontFamily: 'Arimo',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(Icons.schedule, size: 14.sp, color: Colors.black),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          sessionDuration,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontFamily: 'Arimo',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2C7A7B),
                        ),
                      ),
                      CustomButton(
                        text: 'View Details',
                        textColor: Colors.white,
                        onPressed: () {
                          // TODO: go to course detail
                        },
                        height: 32,
                        isGradient: true,
                        isOutlined: false,
                        width: 110.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper: placeholder when no image
  Widget _placeholderImage() {
    return Container(
      color: Colors.grey.shade200,
      child: Center(
        child: Icon(Icons.book, size: 50.sp, color: Colors.grey),
      ),
    );
  }

  // Helper: error image
  Widget _errorImage() {
    return Container(
      color: Colors.grey.shade300,
      child: Center(
        child: Icon(Icons.broken_image, size: 50.sp, color: Colors.grey),
      ),
    );
  }
}
