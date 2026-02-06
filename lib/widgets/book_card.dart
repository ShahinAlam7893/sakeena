import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/widgets/custom_button.dart';

class BookCard extends StatelessWidget {
  final String title, author, price, imagePath;
  final String? tagText;
  final Color? tagColor;
  final String? bookId;

  const BookCard({
    super.key,
    required this.title,
    required this.author,
    required this.price,
    required this.imagePath,
    this.tagText,
    this.tagColor,
    this.bookId = '1',
  });

  @override
  Widget build(BuildContext context) {
    final teal = const Color(0xFF2C7A7B);

    return GestureDetector(
      onTap: () => context.push('/book_details/$bookId'),
      child: Container(
        width: 240.w,
        margin: EdgeInsets.only(right: 12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                child: Image.asset(
                  imagePath,
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Content (NO FLEX HERE)
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (tagText != null)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: (tagColor ?? teal).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        tagText!,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: tagColor ?? teal,
                        ),
                      ),
                    ),

                  if (tagText != null) SizedBox(height: 6.h),

                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.sp, fontFamily: 'Arimo'),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: teal,
                        ),
                      ),
                      CustomButton(
                        text: 'Buy now',
                        height: 35.h,
                        width: 80.w,
                        textColor: Colors.white,
                        isGradient: true,
                        onPressed: () {
                          context.push('/book_details/$bookId');
                        },
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
