import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/custom_button.dart';

class FormatSelectionSection extends StatefulWidget {
  final double digitalPrice;
  final double physicalPrice;
  final double totalPrice;
  final VoidCallback? onBuyNow;

  const FormatSelectionSection({
    super.key,
    required this.digitalPrice,
    required this.physicalPrice,
    required this.totalPrice,
    this.onBuyNow,
  });

  @override
  State<FormatSelectionSection> createState() => _FormatSelectionSectionState();
}

class _FormatSelectionSectionState extends State<FormatSelectionSection> {
  String? _selectedFormat = 'digital'; // default selected

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Center(
            child: Text(
              'Choose Your Format',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Digital Edition Card
          GestureDetector(
            onTap: () => setState(() => _selectedFormat = 'digital'),
            child: Container(
              margin: EdgeInsets.only(bottom: 12.h),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: _selectedFormat == 'digital'
                    ? teal.withOpacity(0.08)
                    : Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: _selectedFormat == 'digital'
                      ? teal
                      : Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Icon(
                      Icons.file_download_outlined,
                      size: 48.sp,
                      color: teal,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Center(
                    child: Text(
                      'Digital Edition',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Center(
                    child: Text(
                      '\$${widget.digitalPrice.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: teal,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Center(
                    child: Text(
                      '• Instant download\n• PDF, EPUB, MOBI\n• Bonus audio version',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Physical Book Card
          GestureDetector(
            onTap: () => setState(() => _selectedFormat = 'physical'),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: _selectedFormat == 'physical'
                    ? teal.withOpacity(0.08)
                    : Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: _selectedFormat == 'physical'
                      ? teal
                      : Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Icon(
                      Icons.menu_book_rounded,
                      size: 48.sp,
                      color: teal,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Center(
                    child: Text(
                      'Physical Book',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Center(
                    child: Text(
                      '\$${widget.physicalPrice.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: teal,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Center(
                    child: Text(
                      '• Premium paperback\n• Ships in 2-3 days\n• Free shipping over \$50',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20.h),

          Divider(),
          // Total Price + Buy Now
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Total Price',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87
                    ),
                  ),
                  Text(
                    '\$${widget.totalPrice.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w400,
                      color: teal,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // Buy Now Button
              CustomButton(
                icon: Icon(Icons.shopping_cart_outlined, size: 16.sp, color: Colors.white),
                text: 'Buy Now',
                onPressed:
                    widget.onBuyNow ??
                    () {
                      // TODO: proceed to checkout/payment
                    },
                width: 120.w,
                isGradient: true,
                textColor: Colors.white,
              ),
            ],
          ),
          Divider(),
          // SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _BadgeItem(icon: Icons.security, label: 'Secure Payment'),
              _BadgeItem(icon: Icons.local_shipping, label: 'Fast Delivery'),
              _BadgeItem(icon: Icons.credit_card, label: 'Easy Refunds'),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

// Reusable badge (Secure Payment, etc.)
class _BadgeItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _BadgeItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15.sp, color: Colors.grey.shade600),
        SizedBox(width: 4.w),
        Text(
          label,
          style: TextStyle(fontSize: 10.sp, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
