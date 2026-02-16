import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sakeena/core/constant/app_colors.dart';
import 'package:sakeena/features/teachers/submission/domain/entities/assignment_submission.dart';
import 'package:sakeena/features/teachers/submission/presentation/providers/submission_provider.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';
import 'package:sakeena/widgets/custom_button.dart';

class SubmissionDetailPage extends StatelessWidget {
  final String submissionId;

  const SubmissionDetailPage({super.key, required this.submissionId});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<SubmissionProvider>();
    Submission? submission;

    // Find submission across all groups
    for (var group in provider.assignmentGroups) {
      final found = group.submissions.firstWhere(
        (s) => s.id == submissionId,
        orElse: () => Submission(
          id: '',
          status: SubmissionStatus.pending,
          studentName: '',
          studentEmail: '',
          submittedAt: DateTime.now(),
          score: 0,
          maxScore: 50,
          fileCount: 0,
        ),
      );
      if (found.id.isNotEmpty) {
        submission = found;
        break;
      }
    }

    if (submission == null || submission.id.isEmpty) {
      return Scaffold(
        appBar: CustomAppBar(showBackButton: true),
        body: const Center(child: Text("Submission not found")),
      );
    }

    final dateFormat = DateFormat("MMMM d, yyyy 'at' h:mm a");

    return Scaffold(
      appBar: CustomAppBar(showBackButton: true, onBack: () => context.pop()),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Submission Details",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.h),

            _buildSectionTitle(context, "Student Information"),
            SizedBox(height: 12.h),
            _buildInfoCard([
              _InfoRow(label: "Student Name", value: submission.studentName),
              _InfoRow(label: "Email", value: submission.studentEmail),
              _InfoRow(
                label: "Submitted",
                value: dateFormat.format(submission.submittedAt),
              ),
              _InfoRow(label: "Status", value: submission.statusText),
            ]),

            SizedBox(height: 32.h),
            _buildSectionTitle(context, "Student Comments"),
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Text(
                "I have created a custom useFetch hook that handles loading states, error handling, and automatic retries.\n"
                "Please find the URL and optional configuration in the attached files.",
                style: TextStyle(fontSize: 14.sp, height: 1.5),
              ),
            ),

            SizedBox(height: 32.h),
            _buildSectionTitle(
              context,
              "Submitted Files (${submission.fileCount})",
            ),
            SizedBox(height: 12.h),
            ...List.generate(
              submission.fileCount,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: _FileItem(
                  fileName: index == 0 ? "useFetch.js" : "example.jsx",
                  fileSize: index == 0 ? "2.4 KB" : "1.8 KB",
                  fileType: index == 0 ? "JS" : "JSX",
                ),
              ),
            ),

            SizedBox(height: 20.h),
            SafeArea(
              child: Row(
                children: [
                  CustomButton(
                    text: "Close",
                    textColor: AppColors.textDark,
                    onPressed: () => context.pop(),
                    isOutlined: true,
                    width: 160.w,
                    height: 48.h,
                  ),
                  SizedBox(width: 4.w),
                  CustomButton(
                    text: "Grade Assignment",
                    onPressed: () => context.pop(),
                    // isOutlined: true,
                    isGradient: true,
                    textColor: Colors.white,
                    width: 160.w,
                    height: 48.h,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF205A60),
      ),
    );
  }

  Widget _buildInfoCard(List<_InfoRow> rows) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(children: rows.map((row) => row.build()).toList()),
      ),
    );
  }
}

class _InfoRow {
  final String label;
  final String value;

  _InfoRow({required this.label, required this.value});

  Widget build() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110.w,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _FileItem extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final String fileType;

  const _FileItem({
    required this.fileName,
    required this.fileSize,
    required this.fileType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.insert_drive_file,
            size: 28.w,
            color: Colors.blueGrey[700],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "$fileSize • $fileType",
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          Icon(
            Icons.download_rounded,
            size: 22.w,
            color: const Color(0xFF3B8F97),
          ),
        ],
      ),
    );
  }
}
