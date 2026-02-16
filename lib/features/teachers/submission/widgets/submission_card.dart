import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sakeena/features/teachers/submission/domain/entities/assignment_submission.dart';
import 'package:sakeena/widgets/custom_button.dart';

class SubmissionCard extends StatelessWidget {
  final Submission submission;

  const SubmissionCard({super.key, required this.submission});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("MMM d, yyyy • h:mm a");

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status tags
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: submission.statusColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    submission.statusText,
                    style: TextStyle(
                      color: submission.statusColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "Assignment",
                    style: TextStyle(
                      color: Colors.orange.shade800,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),

            // Student & date & score
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.person_outline_rounded, size: 18.w, color: Colors.grey[700]),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        submission.studentName,
                        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        submission.studentEmail,
                        style: TextStyle(fontSize: 13.sp, color: Colors.grey[700]),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(Icons.calendar_today_outlined, size: 14.w, color: Colors.grey[600]),
                          SizedBox(width: 6.w),
                          Text(
                            dateFormat.format(submission.submittedAt),
                            style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${submission.score}/${submission.maxScore} pts",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: submission.status == SubmissionStatus.graded
                            ? Colors.green[800]
                            : Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "${submission.percentage.toStringAsFixed(0)}%",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: submission.status == SubmissionStatus.graded
                            ? Colors.green[700]
                            : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "View Details",
                    onPressed: () {
                      context.push('/submission/detail/${submission.id}');
                      
                    },
                    isOutlined: true,
                    height: 44.h,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomButton(
                    text: submission.status == SubmissionStatus.graded ? "Edit Grade" : "Grade Now",
                    onPressed: () {
                      context.push('/submission/grade/${submission.id}');
                    
                    },
                    isGradient: true,
                    height: 44.h,
                    textColor: Colors.white,
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