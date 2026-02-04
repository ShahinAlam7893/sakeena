
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/model/course_review_model.dart';

Widget buildReviewCard(Review review) => Card(
    margin: EdgeInsets.only(bottom: 16.h),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
      side: BorderSide(color: Colors.grey.shade200),
    ),
    child: Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.grey.shade300,
                child: Text(
                  review.name.substring(0, 1),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < review.rating
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 16.sp,
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Text(
                review.date,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            review.comment,
            style: TextStyle(
              fontSize: 13.sp,
              height: 1.5,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    ),
  );


  Widget buildSubSectionTile({
    required String title,
    required IconData icon,
    required Color iconColor,
    required bool hasContent,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: InkWell(
        onTap: hasContent ? onTap : null,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: [
              Icon(icon, size: 20.sp, color: iconColor),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              if (hasContent)
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 20.sp,
                  color: Colors.grey.shade600,
                )
              else
                Text(
                  'Coming soon',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade500,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }



