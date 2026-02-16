import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/custom_button.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Secure Checkout'),
        backgroundColor: const Color(0xFF2C7A7B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.check_circle,
                  size: 80.sp,
                  color: Colors.green.shade600,
                ),
              ),

              SizedBox(height: 24.h),

              Text(
                'Order Confirmed!',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                'Thank you for your purchase',
                style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade700),
              ),

              SizedBox(height: 12.h),

              Text(
                'Order Number: PSK-88440196',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
              ),

              SizedBox(height: 32.h),

              // What happens next
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What happens next?',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.download,
                          color: Colors.green.shade700,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            'Digital Download: Download link sent to your email',
                            style: TextStyle(fontSize: 13.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.local_shipping,
                          color: Colors.green.shade700,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            'Shipping: Delivery in 3-5 business days',
                            style: TextStyle(fontSize: 13.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.green.shade700,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            'Order Confirmation: Sent to your email',
                            style: TextStyle(fontSize: 13.sp),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32.h),

              CustomButton(
                text: 'Download Now',
                onPressed: () {
                  // TODO: trigger download
                },
                height: 48.h,
                isGradient: true,
                textColor: Colors.white,
              ),

              SizedBox(height: 12.h),

              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'View My Library',
                      onPressed: () {
                        context.go(AppRoutes.studentProfilePage);
                      },
                      height: 48.h,
                      isOutlined: true,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomButton(
                      text: 'Continue Shopping',
                      onPressed: () {
                        context.go(AppRoutes.studentHomeScreen);
                      },
                      height: 48.h,
                      isOutlined: true,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              Text(
                'Secure SSL encrypted payment',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
