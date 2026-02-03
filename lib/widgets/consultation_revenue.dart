import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/features/teachers/earnings/earnings_screen.dart';

class ConsultationRevenueSection extends StatelessWidget {
  final List<ConsultationRevenueData> data;
  final String title;
  final IconData icon;

  const ConsultationRevenueSection({
    super.key,
    required this.data,
    this.title = 'Consultation Revenue Breakdown',
    this.icon = Icons.videocam_outlined,
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
            flex: 2,
            child: Text(
              'Period',
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
                'Sessions',
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
            child: Center(
              child: Text(
                'Hours',
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

  Widget _buildTableRow(ConsultationRevenueData item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              item.period,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF333333),
              ),
            ),
          ),
          Expanded(
  flex: 1,
  child: Center(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.schedule_outlined,
          size: 14.sp,
          color: const Color(0xFF999999),
        ),
        SizedBox(width: 4.w),
        Flexible(
          child: Text(
            '${item.sessions} sessions',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF666666),
            ),
          ),
        ),
      ],
    ),
  ),
),

          Expanded(
            flex: 1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.access_time_outlined,
                    size: 14.sp,
                    color: const Color(0xFF999999),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '${item.hours}h',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF666666),
                    ),
                  ),
                ],
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