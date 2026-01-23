import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscriptionAdsCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String period;
  final List<String> features;
  final bool isActive;
  final String buttonText;
  final VoidCallback onPressed;
  final String iconPath;

  const SubscriptionAdsCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    this.period = 'month',
    required this.features,
    this.isActive = false,
    required this.buttonText,
    required this.onPressed,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(18.r),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2A6E75), Color(0xFF3B8D95)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: SvgPicture.asset(
                      iconPath,
                      height: 28.h,
                      width: 28.w,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'Arimo',
                    ),
                  ),
                ],
              ),

              if (isActive)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'Active',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: 12.h),

          Text(
            description,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white70,
              fontFamily: 'Arimo',
            ),
          ),

          SizedBox(height: 20.h),

          // Price Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\$$price',
                      style: TextStyle(
                        fontSize: 34.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: ' /$period',
                      style: TextStyle(fontSize: 14.sp, color: Colors.white70),
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF2C7A7B),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          // Features
          ...features.map(
            (feature) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Row(
                children: [
                  const Icon(Icons.check, size: 18, color: Color(0xFF05DF72)),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      feature,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontFamily: 'Arimo',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
