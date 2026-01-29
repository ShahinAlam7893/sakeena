import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingSessionCard extends StatelessWidget {
  final String sessionName;
  final String date;
  final String time;
  final String zoomLink;
  final VoidCallback onCopyZoomLink;

  const UpcomingSessionCard({
    super.key,
    required this.sessionName,
    required this.date,
    required this.time,
    required this.zoomLink,
    required this.onCopyZoomLink,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sessionName,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Date: $date',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Time: $time',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  'Zoom Meeting Link:',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: onCopyZoomLink,
                  child: Text(
                    'Copy',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
