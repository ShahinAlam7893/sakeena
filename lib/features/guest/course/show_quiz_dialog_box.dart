

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/core/app_theme.dart';
import 'package:sakeena/features/guest/course/quiz_result_dialog.dart';
import 'package:sakeena/model/quiz_question_model.dart';
import 'package:sakeena/widgets/custom_button.dart';

void showQuizDialog(
  BuildContext context,
  String moduleTitle,
  List<QuizQuestion> questions,
) {
  int currentQuestion = 0;
  List<int?> selectedAnswers = List.filled(questions.length, null);

  showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setDialogState) {
        final q = questions[currentQuestion];

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quiz • $moduleTitle',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Question ${currentQuestion + 1}/${questions.length}',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  q.question,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 20.h),
                ...List.generate(q.options.length, (i) {
                  final selected = selectedAnswers[currentQuestion] == i;
                  return GestureDetector(
                    onTap: () {
                      setDialogState(() {
                        selectedAnswers[currentQuestion] = i;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.symmetric(
                        vertical: 14.h,
                        horizontal: 16.w,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppTheme.primaryColor.withOpacity(0.12)
                            : Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: selected
                              ? AppTheme.primaryColor
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            selected
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: selected
                                ? AppTheme.primaryColor
                                : Colors.grey,
                            size: 20.sp,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              q.options[i],
                              style: TextStyle(fontSize: 13.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: 'Cancel',
                      height: 42.h,
                      width: 100.w,
                      isOutlined: true,
                      onPressed: () => Navigator.pop(context),
                    ),
                    CustomButton(
                      text: currentQuestion < questions.length - 1
                          ? 'Next'
                          : 'Submit Quiz',
                      height: 42.h,
                      width: 140.w,
                      isGradient: true,
                      textColor: Colors.white,
                      onPressed: () {
                        if (selectedAnswers[currentQuestion] == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select an answer'),
                            ),
                          );
                          return;
                        }
                        if (currentQuestion < questions.length - 1) {
                          setDialogState(() => currentQuestion++);
                        } else {
                          // Simple scoring
                          int score = 0;
                          for (int i = 0; i < questions.length; i++) {
                            if (selectedAnswers[i] == questions[i].correctIndex)
                              score++;
                          }
                          Navigator.pop(context);
                          showQuizResultDialog(
                            context,
                            score,
                            questions.length,
                            moduleTitle,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
