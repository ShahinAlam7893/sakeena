import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonationAmountSection extends StatefulWidget {
  final Function(double) onAmountSelected;

  const DonationAmountSection({super.key, required this.onAmountSelected});

  @override
  State<DonationAmountSection> createState() => _DonationAmountSectionState();
}

class _DonationAmountSectionState extends State<DonationAmountSection> {
  final TextEditingController _amountController = TextEditingController();
  int? _selectedIndex; // which preset is selected (-1 = custom)

  final List<double> _presetAmounts = [5, 10, 15, 20, 25, 30];

  void _selectPreset(int index) {
    setState(() {
      _selectedIndex = index;
      _amountController.text = _presetAmounts[index].toStringAsFixed(2);
    });
    widget.onAmountSelected(_presetAmounts[index]);
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);
    const lightGrey = Color(0xFFE0E0E0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + Currency
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Donation Amount',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  'USD\$',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: teal,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Preset amount buttons (smaller)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1.6, // smaller / more compact
            ),
            itemCount: _presetAmounts.length,
            itemBuilder: (context, index) {
              final amount = _presetAmounts[index];
              final isSelected = _selectedIndex == index;

              return GestureDetector(
                onTap: () => _selectPreset(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? teal : Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: isSelected ? teal : lightGrey,
                      width: 1.2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '\$${amount.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : teal,
                    ),
                  ),
                ),
              );
            },
          ),

          SizedBox(height: 24.h),

          // Custom amount input field
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              hintText: 'Enter Custom Amount',
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade500,
              ),
              prefixText: '\$ ',
              prefixStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: teal,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 14.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: teal, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: teal, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: teal, width: 2),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _selectedIndex = -1; // deselect presets when typing
              });
              final amount = double.tryParse(value) ?? 0.0;
              widget.onAmountSelected(amount);
            },
          ),
        ],
      ),
    );
  }
}