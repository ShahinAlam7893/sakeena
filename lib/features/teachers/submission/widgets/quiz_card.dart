import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sakeena/features/teachers/submission/domain/entities/quiz_submission.dart';
import '../../../../widgets/custom_button.dart';

class QuizCard extends StatelessWidget {
  final QuizSubmission quiz;

  const QuizCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("MMM d, yyyy • h:mm a");

    final color = quiz.passed ? Colors.green : Colors.red;
    final bgOpacity = 0.12;

    return GestureDetector(
      onTap: () => context.push('/submission/quiz-review/${quiz.id}'),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 2)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: color.withOpacity(bgOpacity),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      quiz.passed ? "Passed" : "Failed",
                      style: TextStyle(color: color, fontSize: 12.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      "Quiz",
                      style: TextStyle(color: Colors.blue[800], fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                quiz.quizTitle,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Icon(Icons.person, size: 18.w, color: Colors.grey[700]),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(quiz.studentName, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
                        Text(quiz.studentEmail, style: TextStyle(fontSize: 13.sp, color: Colors.grey[700])),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${quiz.score}/${quiz.maxScore}",
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: color),
                      ),
                      Text(
                        "${quiz.percentage.toStringAsFixed(0)}%",
                        style: TextStyle(fontSize: 13.sp, color: color),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(Icons.timer_outlined, size: 16.w, color: Colors.grey[600]),
                  SizedBox(width: 6.w),
                  Text("${quiz.timeSpentMinutes} minutes", style: TextStyle(fontSize: 13.sp, color: Colors.grey[600])),
                  const Spacer(),
                  Text(dateFormat.format(quiz.submittedAt), style: TextStyle(fontSize: 13.sp, color: Colors.grey[600])),
                ],
              ),
              SizedBox(height: 16.h),
              CustomButton(
                text: "Review Answers",
                textColor: Colors.white,
                onPressed: () => context.push('/submission/quiz-review/${quiz.id}'),
                isGradient: true,
                height: 42.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}