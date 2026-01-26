import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/widgets/checkout_input_field.dart';
import 'package:sakeena/widgets/checkout_order_summary.dart';
import 'package:sakeena/widgets/checkout_step_indicator.dart';
import 'package:sakeena/widgets/custom_button.dart';

class CheckoutDetailsPage extends StatefulWidget {
  const CheckoutDetailsPage({super.key});

  @override
  State<CheckoutDetailsPage> createState() => _CheckoutDetailsPageState();
}

class _CheckoutDetailsPageState extends State<CheckoutDetailsPage> {
  final _emailController = TextEditingController(text: 'your@email.com');
  final _phoneController = TextEditingController(text: '+880 160 123 4567');
  final _firstNameController = TextEditingController(text: 'A');
  final _lastNameController = TextEditingController(text: 'A');
  final _addressController = TextEditingController();
  String? _city = 'Dhaka';
  String? _country = 'Bangladesh';

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
          const CheckoutStepIndicator(currentStep: 0),

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
                    'Contact Information',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 12.h),
                  CheckoutInputField(
                    label: 'Email Address',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    isRequired: true,
                  ),
                  SizedBox(height: 16.h),
                  CheckoutInputField(
                    label: 'Phone Number',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    isRequired: true,
                  ),

                  SizedBox(height: 24.h),

                  Text(
                    'Shipping Address',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                        child: CheckoutInputField(
                          label: 'First Name *',
                          controller: _firstNameController,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: CheckoutInputField(
                          label: 'Last Name *',
                          controller: _lastNameController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  CheckoutInputField(
                    label: 'Street Address *',
                    controller: _addressController,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: CheckoutInputField(
                          label: 'City',
                          hint: 'Dhaka',
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: CheckoutInputField(
                          label: 'Postal Code *',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  CheckoutInputField(
                    label: 'Country',
                    hint: 'Bangladesh',
                  ),

                  SizedBox(height: 32.h),

                  CustomButton(
                    text: 'Continue to Payment',
                    onPressed: () {
                      context.push('/checkout/payment'); // adjust route name
                    },
                    height: 52.h,
                    isGradient: true,
                    textColor: Colors.white,
                  ),

                  SizedBox(height: 24.h),

                  Center(
                    child: Text(
                      'Your order will be delivered within 3-5 business days to USA/BD',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
                      textAlign: TextAlign.center,
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