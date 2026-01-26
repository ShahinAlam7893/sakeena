import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutStepIndicator extends StatelessWidget {
  final int currentStep; // 0 = Details, 1 = Payment, 2 = Complete

  const CheckoutStepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _StepDot(
            isActive: currentStep >= 0,
            label: 'Details',
            isCompleted: currentStep > 0,
            stepNumber: 1,
          ),
          _StepLine(isActive: currentStep >= 1),
          _StepDot(
            isActive: currentStep >= 1,
            label: 'Payment',
            isCompleted: currentStep > 1,
            stepNumber: 2,
          ),
          _StepLine(isActive: currentStep >= 2),
          _StepDot(
            isActive: currentStep >= 2,
            label: 'Complete',
            isCompleted: currentStep == 2,
            stepNumber: 3,
          ),
        ],
      ),
    );
  }

  Widget _StepDot({
    required bool isActive,
    required String label,
    required bool isCompleted,
    required int stepNumber,
  }) {
    const teal = Color(0xFF2C7A7B);

    return Column(
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted ? teal : (isActive ? teal : Colors.grey.shade300),
            border: Border.all(color: isActive ? teal : Colors.grey.shade400, width: 2),
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : Text(
                    '$stepNumber',
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.grey.shade600,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            color: isActive ? teal : Colors.grey.shade600,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _StepLine({required bool isActive}) {
    const teal = Color(0xFF2C7A7B);
    return Expanded(
      child: Container(
        height: 2.h,
        color: isActive ? teal : Colors.grey.shade300,
      ),
    );
  }
}