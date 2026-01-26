import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/widgets/checkout_input_field.dart';
import 'package:sakeena/widgets/checkout_order_summary.dart';
import 'package:sakeena/widgets/checkout_step_indicator.dart';
import 'package:sakeena/widgets/custom_button.dart';

class CheckoutPaymentPage extends StatefulWidget {
  const CheckoutPaymentPage({super.key});

  @override
  State<CheckoutPaymentPage> createState() => _CheckoutPaymentPageState();
}

class _CheckoutPaymentPageState extends State<CheckoutPaymentPage> {
  final _cardNumberController = TextEditingController();
  final _cardNameController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Secure Checkout'),
        backgroundColor: const Color(0xFF2C7A7B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const CheckoutStepIndicator(currentStep: 1),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CheckoutOrderSummary(
                    bookTitle: 'The Psychology of Sabr: Islamic Patience in Modern Times',
                    format: 'Physical',
                    subtotal: 79.0,
                    shipping: 0.0,
                    total: 79.0,
                  ),

                  SizedBox(height: 24.h),

                  Text(
                    'Payment Details',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 12.h),

                  CheckoutInputField(
                    label: 'Card Number *',
                    controller: _cardNumberController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16.h),

                  CheckoutInputField(
                    label: 'Cardholder Name *',
                    controller: _cardNameController,
                  ),
                  SizedBox(height: 16.h),

                  Row(
                    children: [
                      Expanded(
                        child: CheckoutInputField(
                          label: 'Expiry Date (MM/YY) *',
                          controller: _expiryController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: CheckoutInputField(
                          label: 'CVV *',
                          controller: _cvvController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.lock_outline, color: Colors.green.shade700, size: 20.sp),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            'Your payment is secure and encrypted. We use SSL to protect your card information.',
                            style: TextStyle(fontSize: 12.sp, color: Colors.green.shade800),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32.h),

                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Back',
                          onPressed: () => context.pop(),
                          isGradient: false,
                          isOutlined: true,
                          height: 48.h,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: CustomButton(
                          text: 'Complete Purchase',
                          onPressed: () {
                            context.push('/checkout/success');
                          },
                          height: 48.h,
                          isGradient: true,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  Center(
                    child: Text(
                      'Secure SSL encrypted payment',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}