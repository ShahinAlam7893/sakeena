import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/custom_button.dart';
import 'package:svg_image/svg_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingDialog extends StatefulWidget {
  final String counselorName;
  final String counselorTitle;
  final String counselorImage;
  final double price;

  const BookingDialog({
    super.key,
    required this.counselorName,
    required this.counselorTitle,
    required this.counselorImage,
    required this.price,
  });

  @override
  State<BookingDialog> createState() => _BookingDialogState();
}

class _BookingDialogState extends State<BookingDialog> {
  DateTime? selectedDate;
  String? selectedTimeSlot;

  final List<String> mockTimeSlots = [
    'Mon 9:00 AM',
    'Wed 2:00 PM',
    'Wed 2:00 PM',
    'Wed 2:00 PM',
    'Fri 4:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final teal = const Color(0xFF2C7A7B);
    final selected = selectedDate != null && selectedTimeSlot != null;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: Color(0xFFFFFEF7),
      child: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header + Counselor
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        widget.counselorImage,
                        width: 56.w,
                        height: 56.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Book Consultation with ${widget.counselorName}",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          4.verticalSpace,
                          Text(
                            widget.counselorTitle,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                24.verticalSpace,

                Text(
                  "Choose a date and time for your session",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                20.verticalSpace,

                // Date + Time Slots side by side (like first screenshot)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Time Slots
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Available Time Slots  •  \$${widget.price.toStringAsFixed(0)}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          8.verticalSpace,
                          ...mockTimeSlots.map((slot) {
                            final isSelected = selectedTimeSlot == slot;
                            return GestureDetector(
                              onTap: () =>
                                  setState(() => selectedTimeSlot = slot),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 8.h),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.h,
                                  horizontal: 12.w,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? null
                                      : Colors.grey.shade100,
                                  gradient: isSelected
                                      ? LinearGradient(
                                          colors: [
                                            Color(0xFF205A60),
                                            Color(0xFF3B8F97),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        )
                                      : null,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: isSelected
                                      ? Border.all(color: teal, width: 1.5)
                                      : null,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_rounded,
                                      size: 16.sp,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.grey.shade700,
                                    ),
                                    10.horizontalSpace,
                                    Text(
                                      slot,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black87,
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),

                    16.horizontalSpace,

                    // Calendar placeholder (real showDatePicker on tap)
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: teal.withOpacity(0.3)),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Select Date",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: teal,
                                ),
                              ),
                              8.verticalSpace,
                              Text(
                                selectedDate == null
                                    ? "Tap to pick"
                                    : DateFormat(
                                        'MMM dd, yyyy',
                                      ).format(selectedDate!),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              8.verticalSpace,
                              Icon(
                                Icons.calendar_month,
                                size: 40.sp,
                                color: teal,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                24.verticalSpace,

                // Bundle Offer (prominent like first screenshot)
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.orange, width: 2.sp),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Transform.translate(
                          offset: Offset(0, -15.h),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              "Best Value",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/box_Icon.svg',
                        width: 36.w,
                        height: 36.h,
                      ),
                      // 10.verticalSpace,
                      Text(
                        'Complete Bundle',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontFamily: 'Arimo',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '3 sessions',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Arimo',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$${widget.price * 2} ',
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontFamily: 'Arimo',
                              color: Colors.orange,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          Text(
                            "\$${(widget.price * 3).toStringAsFixed(0)}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey.shade700,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                24.verticalSpace,

                // Consultation Details (shown when selected - like second screenshot)
                if (selected) ...[
                  Container(
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      color: teal.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: teal.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Consultation Details",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        10.verticalSpace,
                        _DetailRow(
                          label: "Date",
                          value: DateFormat(
                            'EEEE, MMMM d, yyyy',
                          ).format(selectedDate!),
                        ),
                        _DetailRow(label: "Time", value: selectedTimeSlot!),
                        _DetailRow(
                          label: "Duration",
                          value: "60 minutes | Video Call",
                        ),
                      ],
                    ),
                  ),
                  24.verticalSpace,
                ],

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Cancle',
                        onPressed: () {
                          context.pop();
                        },
                        isGradient: false,
                        isOutlined: true,
                        textColor: Colors.black,
                      ),
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: CustomButton(
                        text: 'Confirm Booking',
                        onPressed: () {
                          context.push(AppRoutes.checkoutDetails);
                        },
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
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: now.subtract(const Duration(days: 1)),
      lastDate: DateTime(2027),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: Color(0xFF2C7A7B)),
        ),
        child: child!,
      ),
    );
    if (picked != null && picked != selectedDate) {
      setState(() => selectedDate = picked);
    }
  }
}

// Helpers

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade700),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
