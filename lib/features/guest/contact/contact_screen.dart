import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});

  final TextEditingController _firstNameEditingController =
      TextEditingController();
  final TextEditingController _lastNameEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _messageEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);
    const lightTeal = Color(0xFF3A6E73);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 80.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w, bottom: 10.h),
          child: SvgPicture.asset(
            'assets/images/sakeena_logo.svg',
            width: 42.w,
            height: 42.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
                decoration: BoxDecoration(
                  color: teal,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(24.r),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Contact',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Get In Touch',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        "We'd love to hear from you. Whether you have questions, need support, or just want to connect, feel free to reach out. The team at Sakeena Institute is here for you.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white.withOpacity(0.9),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32.h),

              // Contact Info Cards
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    _ContactCard(
                      icon: Icons.location_on_outlined,
                      title: 'Our Office',
                      subtitle:
                          'Business Center, Sharjah Publishing City Free Zone, Sharjah, United Arab Emirates',
                    ),
                    SizedBox(height: 16.h),
                    _ContactCard(
                      icon: Icons.email_outlined,
                      title: 'Our Email',
                      subtitle: 'admin@sakeenainstitute.com',
                    ),
                    SizedBox(height: 16.h),
                    _ContactCard(
                      icon: Icons.phone_outlined,
                      title: 'Our Phone',
                      subtitle: '+971 50 876 3254',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              // Form Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Send us a message",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    _buildTextField(
                      _firstNameEditingController,
                      'Enter first name',
                      'First Name',
                    ),
                    SizedBox(height: 16.h),
                    _buildTextField(
                      _lastNameEditingController,
                      'Enter last name',
                      'Last Name',
                    ),
                    SizedBox(height: 16.h),
                    _buildTextField(
                      _emailEditingController,
                      'Enter email here',
                      'Email',
                    ),
                    SizedBox(height: 16.h),
                    _buildMessageField(
                      'Message',
                      'Write here',
                      _messageEditingController,
                    ),

                    SizedBox(height: 32.h),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: _buildButton(
                            text: 'Cancel',
                            backgroundColor: Colors.grey.shade200,
                            textColor: Colors.black87,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: _buildButton(
                            text: 'Submit',
                            backgroundColor: teal,
                            textColor: Colors.white,
                            onPressed: () {
                              // TODO: Submit form logic
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: const Color(0xFF009689),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: Colors.white, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade700,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    String fildName,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                fildName,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.teal),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageField(
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      maxLines: 5,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
        hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey.shade400),
        filled: true,
        fillColor: Colors.grey.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
