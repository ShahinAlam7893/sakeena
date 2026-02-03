import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EarningStatsCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final double amount;
  final String subtitle;
  final Color backgroundColor;
  final Color textColor;
  final Color iconBackgroundColor;

  const EarningStatsCard({
    super.key,
    required this.icon,
    required this.title,
    required this.amount,
    required this.subtitle,
    this.backgroundColor = const Color(0xFF2C7A7B),
    this.textColor = Colors.white,
    this.iconBackgroundColor = const Color(0xFF1F5757),
  });

  String _formatAmount(double amount) {
    if (amount >= 1000) {
      return '\$${(amount / 1000).toStringAsFixed(1)}K';
    }
    return '\$${amount.toStringAsFixed(0)}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Container
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Icon(
                icon,
                color: textColor,
                size: 22.sp,
              ),
            ),
          ),
          SizedBox(height: 12.h),

          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: textColor.withOpacity(0.8),
              height: 1.2,
            ),
          ),
          SizedBox(height: 4.h),

          // Amount
          Text(
            _formatAmount(amount),
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: textColor,
              height: 1.0,
            ),
          ),
          SizedBox(height: 8.h),

          // Subtitle
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: textColor.withOpacity(0.7),
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}