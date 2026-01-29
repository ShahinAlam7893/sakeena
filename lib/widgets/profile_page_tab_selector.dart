import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const TabSelector({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ['My Courses', 'My Books', 'Consultations'];

    return Row(
      children: List.generate(tabs.length, (index) {
        final isActive = index == selectedIndex;

        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(index),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                color:
                    isActive ? const Color(0xFF2C7A7B) : Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  if (isActive)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 6,
                    )
                ],
              ),
              child: Text(
                tabs[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight:
                      isActive ? FontWeight.w600 : FontWeight.normal,
                  color: isActive ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
