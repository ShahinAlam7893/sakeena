import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/custom_button.dart';

class ProfilePageConsultationCard extends StatelessWidget {
  final String doctorName;
  final String date;
  final String category;
  final String notes;
  final String tag;

  const ProfilePageConsultationCard({
    super.key,
    required this.doctorName,
    required this.date,
    required this.category,
    required this.notes,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arimo',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                    fontFamily: 'Arimo',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 6.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                SizedBox(height: 6.h),
                Text(notes, style: TextStyle(fontSize: 12.sp)),
              ],
            ),
          ),
          CustomButton(
            text: 'View Notes',
            onPressed: () {},
            isGradient: false,
            isOutlined: true,
            textColor: Colors.black,
            width: 90.w,
            height: 35.h,
          ),
          // TextButton(
          //   onPressed: () {},
          //   child: const Text('View Notes'),
          // )
        ],
      ),
    );
  }
}
