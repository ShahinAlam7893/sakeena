import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/features/teachers/submission/domain/entities/assignment_group.dart';
import 'package:sakeena/features/teachers/submission/presentation/providers/submission_provider.dart';
import 'package:sakeena/features/teachers/submission/widgets/submission_card.dart';

class AssignmentGroupSection extends StatelessWidget {
  final AssignmentGroup group;

  const AssignmentGroupSection({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Assignment Title Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
            child: Row(
              children: [
                Icon(Icons.book, size: 22.w, color: const Color(0xFF3B8F97)),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    group.title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Submission Cards
          ...group.submissions.map((submission) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: SubmissionCard(submission: submission),
              )),
        ],
      ),
    );
  }
}