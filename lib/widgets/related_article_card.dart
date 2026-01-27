import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedArticleCard extends StatelessWidget {
  final String imagePath;
  final String category;
  final String title;
  final String description;
  final String author;
  final String readTime;
  final VoidCallback? onTap;

  const RelatedArticleCard({
    super.key,
    required this.imagePath,
    required this.category,
    required this.title,
    required this.description,
    required this.author,
    required this.readTime,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------ Image ------------------
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              child: Stack(
                children: [
                  Image.asset(
                    imagePath,
                    height: 160.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  // Category badge
                  Positioned(
                    top: 10.h,
                    left: 10.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: teal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(14.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ------------------ Title ------------------
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  // ------------------ Description ------------------
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // ------------------ Author + Read time ------------------
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12.r,
                        backgroundColor: teal.withOpacity(0.15),
                        child: Icon(Icons.person,
                            size: 14.sp, color: teal),
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Text(
                          author,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(Icons.schedule,
                          size: 12.sp, color: Colors.grey.shade500),
                      SizedBox(width: 4.w),
                      Text(
                        readTime,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
