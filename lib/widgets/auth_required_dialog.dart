import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/custom_button.dart';

class AuthRequiredDialog extends StatelessWidget {
  final VoidCallback onSignIn;
  final VoidCallback onCreateAccount;
  final VoidCallback onBrowse;

  const AuthRequiredDialog({
    super.key,
    required this.onSignIn,
    required this.onCreateAccount,
    required this.onBrowse,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close, size: 18.sp),
              ),
            ),

            SizedBox(height: 6.h),

            // Icon
            Container(
              width: 52.w,
              height: 52.w,
              decoration: const BoxDecoration(
                color: Color(0xFFFEF3C6),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.lock_outline,
                size: 26.sp,
                color: Color(0xFFF5A623),
              ),
            ),

            SizedBox(height: 14.h),

            Text(
              'Authentication Required',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),

            SizedBox(height: 6.h),

            Text(
              'Please sign in or create an account to purchase this!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.sp, color: Colors.black54),
            ),

            SizedBox(height: 16.h),

            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Color(0xFFFAFAF9),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Why create an account?',
                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                
                SizedBox(height: 10.h),
                
                _featureItem('Access your purchased books anytime from any device'),
                _featureItem('Track your orders and download history'),
                _featureItem('Get personalized recommendations'),
                _featureItem('Join our community and access exclusive content'),
              ],
            ),
            ),

            SizedBox(height: 18.h),

            /// 🔥 Sign in (Gradient)
            CustomButton(
              text: 'Sign in to Continue',
              height: 42.h,
              isGradient: true,
              textColor: Colors.white,
              onPressed: onSignIn,
              icon: Icon(Icons.login, color: Colors.white),
            ),

            SizedBox(height: 10.h),

            /// 🔥 Create account (Outlined)
            CustomButton(
              text: 'Create New Account',
              height: 42.h,
              isOutlined: true,
              onPressed: onCreateAccount,
              icon: Icon(Icons.person_add_alt_1),
            ),

            SizedBox(height: 8.h),

            TextButton(
              onPressed: onBrowse,
              child: Text(
                'Browse More',
                style: TextStyle(fontSize: 11.sp, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, size: 14.sp, color: const Color(0xFF2C7A7B)),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 11.sp, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
