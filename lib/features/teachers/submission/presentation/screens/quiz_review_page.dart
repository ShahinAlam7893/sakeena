import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';
import 'package:sakeena/widgets/custom_button.dart';
import '../providers/submission_provider.dart';
import '../../domain/entities/quiz_submission.dart';

class QuizReviewPage extends StatelessWidget {
  final String quizId;

  const QuizReviewPage({super.key, required this.quizId});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<SubmissionProvider>();
    final quiz = provider.quizSubmissions.firstWhere(
      (q) => q.id == quizId,
      orElse: () => QuizSubmission(
        id: '',
        quizTitle: 'Not Found',
        studentName: '',
        studentEmail: '',
        submittedAt: DateTime.now(),
        timeSpentMinutes: 0,
        score: 0,
        maxScore: 0,
        questions: [],
      ),
    );

    if (quiz.id.isEmpty) {
      return Scaffold(
        appBar: CustomAppBar(showBackButton: true),
        body: const Center(child: Text("Quiz submission not found")),
      );
    }

    final dateFormat = DateFormat("MMMM d, yyyy 'at' h:mm a");
    final color = quiz.passed ? Colors.green : Colors.red;

    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: true,
        onBack: () => context.pop(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Quiz Review", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.h),
            Text(quiz.quizTitle, style: TextStyle(fontSize: 17.sp, color: const Color(0xFF205A60))),
            SizedBox(height: 24.h),

            // Student & summary
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Student Information", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                  SizedBox(height: 12.h),
                  _InfoRow("Name", quiz.studentName),
                  _InfoRow("Email", quiz.studentEmail),
                  _InfoRow("Submitted", dateFormat.format(quiz.submittedAt)),
                  _InfoRow("Time Spent", "${quiz.timeSpentMinutes} minutes"),
                  Divider(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Score", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                      Row(
                        children: [
                          Text(
                            "${quiz.score}/${quiz.maxScore}",
                            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: color),
                          ),
                          SizedBox(width: 12.w),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(20.r)),
                            child: Text(
                              quiz.passed ? "Passed" : "Failed",
                              style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 13.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),

            Text("Answers Review", style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600, color: const Color(0xFF205A60))),
            SizedBox(height: 12.h),

            ...quiz.questions.map((q) => Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: q.isCorrect ? Colors.green.shade50 : Colors.red.shade50,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: q.isCorrect ? Colors.green.shade200 : Colors.red.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              q.isCorrect ? Icons.check_circle : Icons.cancel,
                              color: q.isCorrect ? Colors.green[700] : Colors.red[700],
                              size: 22.w,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                q.questionText,
                                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Text(
                              "${q.pointsEarned}/${q.pointsPossible}",
                              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: q.isCorrect ? Colors.green[800] : Colors.red[800]),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text("Student Answer: ${q.studentAnswer}", style: TextStyle(fontSize: 14.sp)),
                        if (!q.isCorrect && q.correctAnswer != null) ...[
                          SizedBox(height: 4.h),
                          Text("Correct Answer: ${q.correctAnswer}", style: TextStyle(fontSize: 14.sp, color: Colors.green[800], fontWeight: FontWeight.w500)),
                        ],
                      ],
                    ),
                  ),
                )),

            SizedBox(height: 40.h),
            Center(
              child: CustomButton(
                text: "Close",
                onPressed: () => context.pop(),
                isOutlined: true,
                width: 200.w,
                height: 48.h,
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 110.w, child: Text(label, style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]))),
          Expanded(child: Text(value, style: TextStyle(fontSize: 14.sp))),
        ],
      ),
    );
  }
}