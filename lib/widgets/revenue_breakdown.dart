import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/features/teachers/earnings/earnings_screen.dart';

class RevenueBreakdownSection extends StatelessWidget {
  final List<CourseRevenueData> data;
  final String title;
  final IconData icon;

  const RevenueBreakdownSection({
    super.key,
    required this.data,
    this.title = 'Course Revenue Breakdown',
    this.icon = Icons.school_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C7A7B).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: const Color(0xFF2C7A7B),
                      size: 14.sp,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2C7A7B),
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1, color: const Color(0xFFEEEEEE)),

          // Table Headers
          _buildTableHeader(),

          // Table Rows
          ...data.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isLast = index == data.length - 1;

            return Column(
              children: [
                _buildTableRow(item),
                if (!isLast)
                  Divider(
                    height: 1,
                    color: const Color(0xFFF5F5F5),
                    indent: 16.w,
                    endIndent: 16.w,
                  ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Course Name',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF666666),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Students',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF666666),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Revenue',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF666666),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(CourseRevenueData item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              item.courseName,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF333333),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '${item.students}',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF666666),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '\$${item.revenue.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2C7A7B),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}