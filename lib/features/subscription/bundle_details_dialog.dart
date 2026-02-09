import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/custom_button.dart';

class BundleDetailsDialog extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String originalPrice;
  final List<String> courses;
  final List<String> courseCategories;
  final List<String> coursePrices;
  final Function(int index, String courseName)? onCourseTapped;
  final VoidCallback onBuyPressed;

  const BundleDetailsDialog({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.courses,
    required this.courseCategories,
    required this.coursePrices,
    this.onCourseTapped,
    required this.onBuyPressed,
  });

  double get _savings {
    final original = double.tryParse(originalPrice.replaceAll('\$', '').replaceAll(',', '')) ?? 0;
    final current = double.tryParse(price.replaceAll('\$', '').replaceAll(',', '')) ?? 0;
    return original - current;
  }

  int get _savingsPercentage {
    final original = double.tryParse(originalPrice.replaceAll('\$', '').replaceAll(',', '')) ?? 1;
    final saving = _savings / original * 100;
    return saving.toInt();
  }

  @override
  Widget build(BuildContext context) {
    final teal = const Color(0xFF2C7A7B);

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: teal,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white.withOpacity(0.9),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Courses List
                    ...List.generate(courses.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          onCourseTapped?.call(index, courses[index]);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1.w,
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: teal.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Icon(
                                    Icons.school_rounded,
                                    color: teal,
                                    size: 20.sp,
                                  ),
                                ),
                                12.horizontalSpace,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        courses[index],
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      4.verticalSpace,
                                      Text(
                                        courseCategories[index],
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  coursePrices[index],
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: teal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),

                    24.verticalSpace,

                    // Bundle Preview Section
                    Container(
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Colors.amber.shade200,
                          width: 1.w,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BUNDLE PREVIEW',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              letterSpacing: 0.5,
                            ),
                          ),
                          16.verticalSpace,
                          _PreviewRow('Name:', title),
                          12.verticalSpace,
                          _PreviewRow('Courses:', '${courses.length} courses'),
                          12.verticalSpace,
                          _PreviewRow('Bundle Price:', price),
                          12.verticalSpace,
                          _PreviewRow('Original Value:', originalPrice),
                          12.verticalSpace,
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Customer Saves:',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                '\$${_savings.toStringAsFixed(0)}($_savingsPercentage%)',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green.shade600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    24.verticalSpace,

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: 'Cancel',
                            onPressed: () => Navigator.pop(context),
                            isGradient: false,
                            isOutlined: true,
                            textColor: Colors.black,
                          ),
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: CustomButton(
                            text: 'Buy Now',
                            onPressed: onBuyPressed,
                            isGradient: true,
                            isOutlined: false,
                            textColor: Colors.white,
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
      ),
    );
  }
}

class _PreviewRow extends StatelessWidget {
  final String label;
  final String value;

  const _PreviewRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}