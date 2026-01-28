import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/features/guest/support/donation_section.dart'; // ← make sure this file exports DonationAmountSection
import 'package:sakeena/widgets/custom_button.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  double _donationAmount = 0.0;

  void _updateDonationAmount(double amount) {
    setState(() {
      _donationAmount = amount;
    });
  }

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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header gradient
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF7AA4A5), Color(0xFF205A60)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Donation',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Arimo",
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Support Our Cause",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Arimo",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'Help our organization by donating today! Donations go to making a difference for our cause.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontFamily: 'Arimo',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x33FFFFFF),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: Colors.white70),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.lock, color: const Color(0xFFF2E6C0)),
                          SizedBox(width: 6.w),
                          Text(
                            '100% Secure Donation',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How much would you like to donate today?',
                      style: TextStyle(
                        fontFamily: 'Arimo',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'All donations directly impact our organization and help us further our mission.',
                      style: TextStyle(
                        fontFamily: 'Arimo',
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // This is the line that was failing
                    DonationAmountSection(
                      // ← Make sure this name matches EXACTLY
                      onAmountSelected: _updateDonationAmount,
                    ),

                    SizedBox(height: 20.h),

                    // Rest of your form (Who's Giving Today?, etc.)
                    Text(
                      "Who's Giving Today?",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "We'll never share this information with anyone.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    _buildTextField(
                      _firstNameController,
                      'First Name',
                      'First Name',
                    ),
                    _buildTextField(
                      _lastNameController,
                      'Last Name',
                      'Last Name',
                    ),
                    _buildTextField(_emailController, 'Email', 'Email'),
                    SizedBox(height: 16.h),
                    _buildDonationSummary(),
                    SizedBox(height: 16.h),
                    _buildPaymentDetails(),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: "Back",
                            onPressed: () => Navigator.pop(context),
                            isGradient: false,
                            isOutlined: true,
                            textColor: Colors.black,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: CustomButton(
                            text: "Complete Purchase",
                            icon: Icon(Icons.lock_outline, color: Colors.white),
                            onPressed: () {
                              // TODO: Process donation
                            },
                            isGradient: true,
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

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    String fildName,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                fildName,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.teal),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonationSummary() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Donation Summary',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.h),
          _buildSummaryRow(
            'Payment Amount',
            '\$${_donationAmount.toStringAsFixed(2)}',
          ),
          _buildSummaryRow('Giving Frequency', 'One Time'),
          Divider(),
          _buildSummaryRow(
            'Donation Total',
            '\$${_donationAmount.toStringAsFixed(2)}',
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentDetails() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Details',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          Text(
            'How would you like to pay for your donation?',
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12.h),
          _buildTextField(
            _cardNumberController,
            '1234 5678 9012 3456',
            'Card Number *',
          ),
          _buildTextField(
            _cardHolderNameController,
            'Name as shown on card',
            'Cardholder Name *',
          ),
          _buildTextField(_expiryDateController, 'MM/YY', 'Expiry Date *'),
          _buildTextField(_cvvController, '123', 'CVV *'),
        ],
      ),
    );
  }
}
