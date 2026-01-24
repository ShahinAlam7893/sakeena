// route/go_route.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/features/auth_screens/forgot_password_page.dart';
import 'package:sakeena/features/auth_screens/login_screen.dart';
import 'package:sakeena/features/auth_screens/otp_page.dart';
import 'package:sakeena/features/auth_screens/reset_password_page.dart';
import 'package:sakeena/features/auth_screens/sign_up_screen.dart';
import 'package:sakeena/features/auth_screens/splash_screen.dart';
import 'package:sakeena/features/auth_screens/success_page.dart';
import 'package:sakeena/features/guest/consultation_screen.dart';
import 'package:sakeena/features/guest/home_screen.dart';

GoRouter createRouter() { 
  return GoRouter(
    initialLocation: '/how_it_works',

    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
        redirect: (context, state) {
          Future.delayed(const Duration(seconds: 2), () {
            if (context.mounted) {
              context.go('/login');
            }
          });
          return null;
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: '/forgot',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/otp',
        builder: (context, state) => const OtpPage(),
      ),
      GoRoute(
        path: '/reset',
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        path: '/success',
        builder: (context, state) => const SuccessPage(),
      ),
      GoRoute(path: '/guest_home', builder: (context, state) => const GuestHomeScreen()),
      GoRoute(path: '/how_it_works', builder: (context, state) => const ConsultationScreen()),
    ],
  );
}