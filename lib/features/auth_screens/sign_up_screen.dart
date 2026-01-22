import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sakeena/view_model/auth_view_model.dart';
import 'package:sakeena/view_model/user_provider.dart';
import 'package:sakeena/widgets/auth_background.dart';
import 'package:sakeena/widgets/custom_button.dart';
import 'package:sakeena/widgets/custom_text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, auth, child) {
        return Scaffold(
          body: AuthBackground(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50.h),

                        // Logo (replaced text 'Sakeena')
                        SvgPicture.asset(
                          'assets/images/sakeena_logo.svg',
                          height: 80.h,
                          // width: 180.w,   // ← uncomment & adjust if needed
                          fit: BoxFit.contain,
                          // Optional: color override if the SVG allows tinting
                          // colorFilter: ColorFilter.mode(
                          //   Colors.white,
                          //   BlendMode.srcIn,
                          // ),
                        ),

                        SizedBox(height: 10.h),

                        Column(
                          children: [
                            Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF2C7A7B),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Begin your journey of healing and growth.',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontFamily: 'Arimo',
                              ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: 32.h),

                            // Full name
                            CustomTextField(
                              controller: _nameController,
                              hintText: 'Enter your full name',
                              prefixIcon: Icons.person_outline,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.h),

                            // Email
                            CustomTextField(
                              controller: _emailController,
                              hintText: 'Enter your email',
                              prefixIcon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                ).hasMatch(value.trim())) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.h),

                            // Password
                            CustomTextField(
                              controller: _passwordController,
                              hintText: 'Password',
                              prefixIcon: Icons.lock_outline,
                              isPassword: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.h),

                            // Confirm Password
                            CustomTextField(
                              controller: _confirmController,
                              hintText: 'Confirm Password',
                              prefixIcon: Icons.lock_outline,
                              isPassword: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm password';
                                }
                                if (value != _passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 28.h),

                            // Error message
                            if (auth.errorMessage != null) ...[
                              Text(
                                auth.errorMessage!,
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: 13.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16.h),
                            ],

                            // Sign up button
                            auth.isLoading
                                ? const CircularProgressIndicator()
                                : CustomButton(
                                    text: 'Sign up',
                                    textColor: Colors.white,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        auth.signup(
                                          name: _nameController.text.trim(),
                                          email: _emailController.text.trim(),
                                          password: _passwordController.text,
                                          onSuccess: () {
                                            context.read<UserProvider>().signup(
                                              _nameController.text.trim(),
                                              _emailController.text.trim(),
                                              _passwordController.text,
                                            );
                                            context.go(
                                              '/',
                                            ); // or your home route
                                          },
                                        );
                                      }
                                    },
                                    isGradient: true,
                                  ),

                            SizedBox(height: 20.h),

                            // Google sign up
                            CustomButton(
                              text: 'Sign up with Google',
                              onPressed: () {
                                // TODO: implement Google Sign-In
                              },
                              isOutlined: true,
                              icon: SvgPicture.asset(
                                'assets/images/google_ic.svg',
                                width: 20.w,
                                height: 20.w,
                              ),
                            ),

                            SizedBox(height: 28.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => context.go('/login'),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF2C7A7B),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Center(
                              child: Text(
                                'By creating an account, you agree to our Terms of Service and Privacy Policy',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
