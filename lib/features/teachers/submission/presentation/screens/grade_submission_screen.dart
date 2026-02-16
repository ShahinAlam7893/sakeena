import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';
import 'package:sakeena/widgets/custom_button.dart';
import '../providers/submission_provider.dart';

class GradeSubmissionPage extends StatefulWidget {
  final String submissionId;

  const GradeSubmissionPage({super.key, required this.submissionId});

  @override
  State<GradeSubmissionPage> createState() => _GradeSubmissionPageState();
}

class _GradeSubmissionPageState extends State<GradeSubmissionPage> {
  final _scoreController = TextEditingController();
  final _feedbackController = TextEditingController();
  int _maxScore = 50;
  double _percentage = 0.0;

  @override
  void initState() {
    super.initState();
    // You could load existing score here if editing
    _scoreController.text = "0";
    _updatePercentage();
  }

  void _updatePercentage() {
    final score = int.tryParse(_scoreController.text) ?? 0;
    setState(() {
      _percentage = _maxScore > 0 ? (score / _maxScore) * 100 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBackButton: true, onBack: () => context.pop()),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Grade Assignment",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              "Build a Custom Hook",
              style: TextStyle(fontSize: 17.sp, color: const Color(0xFF205A60)),
            ),
            SizedBox(height: 28.h),

            // Student avatar + name
            Row(
              children: [
                CircleAvatar(
                  radius: 28.r,
                  backgroundColor: const Color(0xFF3B8F97),
                  child: Text(
                    "MJ",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Marcus Johnson",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "marcus.j@email.com",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 32.h),

            Text(
              "Score *",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.w,
                  child: TextField(
                    controller: _scoreController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    onChanged: (value) => _updatePercentage(),
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  "/ $_maxScore points",
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
                ),
                const Spacer(),
                Text(
                  "${_percentage.toStringAsFixed(0)}%",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: _percentage >= 60
                        ? Colors.green[700]
                        : Colors.red[700],
                  ),
                ),
              ],
            ),

            SizedBox(height: 32.h),

            Text(
              "Feedback *",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.h),
            TextField(
              controller: _feedbackController,
              maxLines: 6,
              decoration: InputDecoration(
                hintText:
                    "Provide detailed feedback to help the student improve...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                contentPadding: EdgeInsets.all(16.w),
              ),
            ),
            Text("Be specific and constructive."),
            SizedBox(height: 40.h),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Close",
                    onPressed: () => context.pop(),
                    isOutlined: true,
                    height: 52.h,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CustomButton(
                    text: "Save Grade",
                    textColor: Colors.white,
                    onPressed: () {
                      final score = int.tryParse(_scoreController.text) ?? 0;
                      if (score < 0 || score > _maxScore) {
                        return;
                      }

                      context.read<SubmissionProvider>().updateAssignmentGrade(widget.submissionId, score);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Grade saved successfully"),
                        ),
                      );
                      context.pop();
                    },
                    isGradient: true,
                    height: 52.h,
                  ),
                ),
              ],
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scoreController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }
}
