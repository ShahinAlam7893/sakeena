import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/custom_button.dart';

class ProfilePageBookCard extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String category;
  final String imagePath;

  const ProfilePageBookCard({
    super.key,
    required this.title,
    required this.author,
    required this.description,
    required this.category,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          /// 🔝 Top Content
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Book Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  imagePath,
                  width: 70.w,
                  height: 90.h,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: 12.w),

              /// Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Category pill
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: teal.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: teal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      'by $author',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey.shade700,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          /// 🔽 Download Button (Full Width)
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Download',
              onPressed: () {},
              isGradient: true,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
