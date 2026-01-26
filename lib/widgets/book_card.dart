import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/widgets/auth_required_dialog.dart';
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
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                child: Image.asset(imagePath, height: 200.h, width: double.infinity, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tag
                  if (tagText != null)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: (tagColor ?? teal).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(tagText!, style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: tagColor ?? teal)),
                    ),
                  if (tagText != null) SizedBox(height: 6.h),
                  Text(title, style: TextStyle(fontSize: 14.sp, fontFamily: 'Arimo', fontWeight: FontWeight.w400), maxLines: 2, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 4.h),
                  Text(author, style: TextStyle(fontSize: 12.sp, fontFamily: 'Arimo', color: Colors.grey.shade600), maxLines: 1, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 10.h),
                  // Price + Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: teal)),
                      CustomButton(
                        text: 'Buy Now',
                        textColor: Colors.white,
                        onPressed: () => showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => AuthRequiredDialog(
                            onSignIn: () {
                              Navigator.pop(context);
                              context.go('/login');
                            },
                            onCreateAccount: () {
                              Navigator.pop(context);
                              context.go('/signup');
                            },
                            onBrowse: () => Navigator.pop(context),
                          ),
                        ),
                        height: 35.h,
                        width: 80.w,
                        isGradient: true,
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