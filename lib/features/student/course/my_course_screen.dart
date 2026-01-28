import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCourseScreen extends StatelessWidget {
  const MyCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [Icon(Icons.notifications_none)],
      ),
      body: Column(
        
      ),
    );
  }
}