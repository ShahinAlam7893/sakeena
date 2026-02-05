import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/core/app_theme.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/custom_button.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String instructor;
  final String sessionDuration;
  final String numberOfWeeks;
  final String duration;
  final String lessons;
  final String price;
  final String? imagePath; 
  final bool
  isSvgImage; 
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
    this.isSvgImage = false, 
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
                          context.push(AppRoutes.courseDetails);
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

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sakeena/route/go_route.dart';
// import 'package:sakeena/core/app_theme.dart';

class CourseCardTeacher extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;
  final String instructor;
  final int lessons;
  final int weeks;
  final double totalHours;
  final double hoursPerSession;
  final String price;
  final VoidCallback onViewDetails;
  final String status;

  const CourseCardTeacher({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.instructor,
    required this.lessons,
    required this.weeks,
    required this.totalHours,
    required this.hoursPerSession,
    required this.price,
    required this.onViewDetails,
    this.status = 'Upcoming',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onViewDetails, 
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8.r,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 180.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 180.h,
                          color: Colors.grey.shade200,
                          child: const Center(
                            child: Icon(Icons.image_not_supported),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 12.h,
                    right: 12.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBEBEB),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Status Badge
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 12.h),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.successColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Content
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // Instructor
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: 16.sp,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          instructor,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    // Course Details Grid
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Lessons
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.book_outlined,
                                size: 14.sp,
                                color: Colors.grey.shade600,
                              ),
                              SizedBox(width: 4.w),
                              Expanded(
                                child: Text(
                                  '$lessons Lessons',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Weeks
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 14.sp,
                                color: Colors.grey.shade600,
                              ),
                              SizedBox(width: 4.w),
                              Expanded(
                                child: Text(
                                  '$weeks weeks',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Total Hours
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.timer_outlined,
                                size: 14.sp,
                                color: Colors.grey.shade600,
                              ),
                              SizedBox(width: 4.w),
                              Expanded(
                                child: Text(
                                  '$totalHours hr',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Hours per Session
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.schedule_outlined,
                                size: 14.sp,
                                color: Colors.grey.shade600,
                              ),
                              SizedBox(width: 4.w),
                              Expanded(
                                child: Text(
                                  '${hoursPerSession}hr/session',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    // Price and Eye Icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$$price',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: onViewDetails, // optional, extra clickable
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.remove_red_eye_outlined,
                              size: 18.sp,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
