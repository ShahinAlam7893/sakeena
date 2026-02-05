import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/custom_button.dart';
import 'package:sakeena/widgets/custom_text_field.dart';

class LiveCourseRegistrationPage extends StatefulWidget {
  const LiveCourseRegistrationPage({super.key});

  @override
  State<LiveCourseRegistrationPage> createState() =>
      _LiveCourseRegistrationPageState();
}

class _LiveCourseRegistrationPageState
    extends State<LiveCourseRegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Register for Live Course",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Personal Information",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 18.h),

              Row(
                children: [
                  Expanded(
                    child: _fieldLabel(
                      "First Name *",
                      CustomTextField(
                        controller: firstNameController,
                        hintText: "Enter your first name",
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _fieldLabel(
                      "Last Name *",
                      CustomTextField(
                        controller: lastNameController,
                        hintText: "Enter your last name",
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              _fieldLabel(
                "Email Address *",
                CustomTextField(
                  controller: emailController,
                  hintText: "your.email@example.com",
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              SizedBox(height: 16.h),

              _fieldLabel(
                "Phone Number *",
                CustomTextField(
                  controller: phoneController,
                  hintText: "+971 XX XXX XXXX",
                  keyboardType: TextInputType.phone,
                ),
              ),

              SizedBox(height: 14.h),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isAgreed,
                    activeColor: const Color(0xFF2C7A7B),
                    onChanged: (value) {
                      setState(() => isAgreed = value ?? false);
                    },
                  ),
                  Expanded(
                    child: Text(
                      "I agree to the terms and conditions, including the commitment to attend live sessions and participate in course activities. I understand the refund policy.",
                      style: TextStyle(fontSize: 11.sp),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              /// 🔥 Fee Card
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    _priceRow("Course Fee", "\$149"),
                    SizedBox(height: 8.h),
                    Divider(),
                    SizedBox(height: 8.h),
                    _priceRow("Total", "\$149", isBold: true, highlight: true),
                  ],
                ),
              ),

              SizedBox(height: 26.h),

              /// 🔥 Bottom Buttons
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Cancel",
                      isOutlined: true,
                      height: 46.h,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomButton(
                      text: "Proceed to Payment",
                      height: 46.h,
                      isGradient: true,
                      textColor: Colors.white,
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Please fill in all required fields.",
                              ),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          return;
                        }
                        if (!isAgreed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Please agree to the terms and conditions.",
                              ),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          return;
                        }

                        // ✅ Everything is valid
                        context.push(AppRoutes.checkoutDetails);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fieldLabel(String label, Widget field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 6.h),
        field,
      ],
    );
  }

  Widget _priceRow(
    String title,
    String price, {
    bool isBold = false,
    bool highlight = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            color: highlight ? const Color(0xFF2C7A7B) : Colors.black,
          ),
        ),
      ],
    );
  }
}
