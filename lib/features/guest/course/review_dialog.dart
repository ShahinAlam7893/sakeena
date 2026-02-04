
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/core/app_theme.dart';
import 'package:sakeena/widgets/custom_button.dart';

void showWriteReviewDialog(BuildContext context) {
  int selectedRating = 5;
  final TextEditingController reviewController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setDialogState) {
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
                // Title
                Text(
                  'Write a Review',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),

                // Subtitle
                Text(
                  'Share your thoughts about this course with other students.',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 20.h),

                // Star rating selector
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          setDialogState(() {
                            selectedRating = index + 1;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Icon(
                            index < selectedRating
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 32.sp,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 24.h),

                // Review text field
                TextField(
                  controller: reviewController,
                  maxLines: 5,
                  minLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Your review...',
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: AppTheme.primaryColor,
                        width: 2,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                  ),
                ),
                SizedBox(height: 28.h),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      text: 'Cancel',
                      height: 40.h,
                      width: 100.w,
                      isOutlined: true,
                      textColor: Colors.grey.shade800,
                      onPressed: () => Navigator.pop(context),
                    ),

                    CustomButton(
                      text: 'Submit Review',
                      height: 40.h,
                      width: 100.w,
                      isGradient: true,
                      textColor: Colors.white,
                      onPressed: () {
                        final reviewText = reviewController.text.trim();
                        reviewController.clear();

                        if (reviewText.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please write your review'),
                            ),
                          );
                          return;
                        }
                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Thank you! Your $selectedRating-star review has been submitted.',
                            ),
                            backgroundColor: AppTheme.successColor,
                          ),
                        );
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

