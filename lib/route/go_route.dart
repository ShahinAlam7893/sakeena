import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/features/auth_screens/forgot_password_page.dart';
import 'package:sakeena/features/auth_screens/login_screen.dart';
import 'package:sakeena/features/auth_screens/otp_page.dart';
import 'package:sakeena/features/auth_screens/reset_password_page.dart';
import 'package:sakeena/features/auth_screens/sign_up_screen.dart';
import 'package:sakeena/features/auth_screens/splash_screen.dart';
import 'package:sakeena/features/auth_screens/success_page.dart';
import 'package:sakeena/features/guest/books/book_details_screen.dart';
import 'package:sakeena/features/guest/books/books_screen.dart';
import 'package:sakeena/features/guest/consultation_screen.dart';
import 'package:sakeena/features/guest/course/course_details_screen.dart';
import 'package:sakeena/features/guest/course/course_screen.dart';
import 'package:sakeena/features/guest/home_screen.dart';
import 'package:sakeena/features/guest/teachers/teacher_details_screen.dart';
import 'package:sakeena/features/guest/teachers/teachers_screen.dart';
import 'package:sakeena/features/subscription/checkout/checkout_details_page.dart';
import 'package:sakeena/features/subscription/checkout/checkout_payment_page.dart';
import 'package:sakeena/features/subscription/checkout/checkout_success_page.dart';
import 'package:sakeena/features/subscription/subscription_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const forgot = '/forgot';
  static const otp = '/otp';
  static const reset = '/reset';
  static const success = '/success';
  static const guestHome = '/guest_home';
  static const howItWorks = '/how_it_works';
  static const subscription = '/subscription';
  static const coursesScreen = '/courses_screen';
  static const courseDetails = '/courses_details_screen';
  static const teachersScreen = '/teachers_screen';
  static const teacherDetails = '/teachers_details_screen';
  static const checkoutDetails = '/checkout/details';
  static const checkoutPayment = '/checkout/payment';
  static const checkoutSuccess = '/checkout/success';
}

GoRouter createRouter() {
  return GoRouter(
    initialLocation: AppRoutes.guestHome,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
        redirect: (context, state) {
          Future.delayed(const Duration(seconds: 2), () {
            if (context.mounted) context.go(AppRoutes.login);
          });
          return null;
        },
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: AppRoutes.forgot,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.otp,
        builder: (context, state) => const OtpPage(),
      ),
      GoRoute(
        path: AppRoutes.reset,
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.success,
        builder: (context, state) => const SuccessPage(),
      ),
      GoRoute(
        path: AppRoutes.guestHome,
        builder: (context, state) => const GuestHomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.howItWorks,
        builder: (context, state) => const ConsultationScreen(),
      ),
      GoRoute(
        path: AppRoutes.subscription,
        builder: (context, state) => const SubscriptionPage(),
      ),
      GoRoute(
        path: AppRoutes.coursesScreen,
        builder: (context, state) => const CoursesPage(),
      ),
      GoRoute(
        path: AppRoutes.courseDetails,
        builder: (context, state) => const CourseDetailsPage(),
      ),
      GoRoute(
        path: AppRoutes.teachersScreen,
        builder: (context, state) => const TeachersScreen(),
      ),
      GoRoute(
        path: '${AppRoutes.teacherDetails}/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '1';
          return CounselorDetailPage(counselorId: id);
        },
      ),
      GoRoute(
        path: '/books_screen',
        builder: (context, state) => const BooksPage(),
      ),
      GoRoute(
        path: '/book_details/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '1';
          return BookDetailsPage(bookId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.checkoutDetails,
        builder: (context, state) => const CheckoutDetailsPage(),
      ),
      GoRoute(
        path: AppRoutes.checkoutPayment,
        builder: (context, state) => const CheckoutPaymentPage(),
      ),
      GoRoute(
        path: AppRoutes.checkoutSuccess,
        builder: (context, state) => const CheckoutSuccessPage(),
      ),
    ],
  );
}
