import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookAboutSection extends StatelessWidget {
  final String description;
  final List<String> chapters;

  const BookAboutSection({
    super.key,
    required this.description,
    required this.chapters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          'About This Book',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),

        SizedBox(height: 12.h),

        // Description paragraph
        Text(
          description,
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey.shade800,
            height: 1.5,
          ),
        ),

        SizedBox(height: 20.h),

        // Chapters list with arrows
        Text(
          'Chapters',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),

        SizedBox(height: 8.h),

        ...chapters.asMap().entries.map((entry) {
          final chapter = entry.value;

          return Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Number + arrow
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    Icon(
                      Icons.find_in_page_outlined,
                      size: 16.sp,
                      color: const Color(0xFF2C7A7B),
                    ),
                  ],
                ),

                SizedBox(width: 8.w),

                // Chapter title
                Expanded(
                  child: Text(
                    chapter,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}