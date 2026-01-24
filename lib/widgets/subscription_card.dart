import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscriptionCard extends StatelessWidget {
  final String tag, title, description, price, originalPrice, discount;
  final Color tagColor;
  final List<String> courses;
  final int sales;
  final String created;
  final VoidCallback onBuyPressed;

  const SubscriptionCard({
    super.key,
    required this.tag,
    required this.tagColor,
    required this.title,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.courses,
    required this.sales,
    required this.created,
    required this.onBuyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFF3B8F97), width: 2.w),
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
          // Tag
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: tagColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              tag,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: tagColor,
              ),
            ),
          ),
          SizedBox(height: 12.h),

          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontFamily: 'Arimo',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 6.h),

          // Description
          Text(
            description,
            style: TextStyle(
              fontSize: 14.sp,
              color: Color(0xFF525252),
              fontFamily: 'Arimo',
              height: 1.4,
            ),
          ),
          SizedBox(height: 14.h),

          // Price Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2C7A7B),
                ),
              ),
              Row(
                children: [
                  Text(
                    originalPrice,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey.shade500,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    discount,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.green.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 14.h),

          // Includes Courses
          Text(
            'Includes 4 Courses:',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8.h),

          ...courses.map(
            (course) => Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/circle_check_Icon.svg',
                    width: 16.w,
                    height: 16.h,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      course,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // SizedBox(height: 14.h),

          // Sales & Created
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text('Sales', style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade500)),
          //         Text('$sales', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: Colors.black87)),
          //       ],
          //     ),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text('Created', style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade500)),
          //         Text(created, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: Colors.black87)),
          //       ],
          //     ),
          //   ],
          // ),
          SizedBox(height: 16.h),

          // Buy Now Button
          CustomButton(
            text: 'Buy Now',
            onPressed: onBuyPressed,
            isGradient: true,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
