import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/features/auth_screens/forgot_password_page.dart';
import 'package:sakeena/features/auth_screens/login_screen.dart';
import 'package:sakeena/features/auth_screens/otp_page.dart';
import 'package:sakeena/features/auth_screens/reset_password_page.dart';
import 'package:sakeena/features/auth_screens/sign_up_screen.dart';
import 'package:sakeena/features/auth_screens/splash_screen.dart';
import 'package:sakeena/features/auth_screens/success_page.dart';
import 'package:sakeena/features/guest/about/about_screen.dart';
import 'package:sakeena/features/guest/blog/blog_details_screen.dart';
import 'package:sakeena/features/guest/blog/blog_screen.dart';
import 'package:sakeena/features/guest/books/book_details_screen.dart';
import 'package:sakeena/features/guest/books/books_screen.dart';
import 'package:sakeena/features/guest/consultation_screen.dart';
import 'package:sakeena/features/guest/contact/contact_screen.dart';
import 'package:sakeena/features/guest/course/course_details_screen.dart';
import 'package:sakeena/features/guest/course/course_screen.dart';
import 'package:sakeena/features/guest/home_screen.dart';
import 'package:sakeena/features/guest/support/support_screen.dart';
import 'package:sakeena/features/guest/teachers/teacher_details_screen.dart';
import 'package:sakeena/features/guest/teachers/teachers_screen.dart';
import 'package:sakeena/features/guest/video/video_description_screen.dart';
import 'package:sakeena/features/guest/video/video_library_screen.dart';
import 'package:sakeena/features/student/course/my_course_screen.dart';
import 'package:sakeena/features/student/home/home_screen.dart';
import 'package:sakeena/features/student/teachers/teachers_screen.dart';
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
  static const aboutScreen = '/about';
  static const blogScreen = '/blog_screen';
  static const blogDetailsScreen = '/blog/:id';
  static const videoLibraryScreen = '/video_library_screen';
  static const videoDescriptionScreen = '/video_description_screen';
  static const supportScreen = '/support_screen';
  static const contactScreen = '/contact_screen';
  static const studentHomeScreen = '/student_home_screen';
  static const myCourseScreen = '/my_course_screen';
  static const teachersScreenForStudent = '/teachers_screen_for_student';
}

GoRouter createRouter() {
  return GoRouter(
    initialLocation: AppRoutes.teachersScreenForStudent,
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
      GoRoute(
        path: AppRoutes.aboutScreen,
        builder: (context, state) => const AboutScreen(),
      ),
      GoRoute(
        path: AppRoutes.blogScreen,
        builder: (context, state) => const BlogScreen(),
      ),
      GoRoute(
        path: AppRoutes.blogDetailsScreen,
        builder: (context, state) => const BlogDetailsPage(),
      ),
      GoRoute(
        path: AppRoutes.videoLibraryScreen,
        builder: (context, state) => const VideoLibraryScreen(),
      ),
      GoRoute(
        path: AppRoutes.videoDescriptionScreen,
        builder: (context, state) => const VideoDescriptionScreen(),
      ),
      GoRoute(
        path: AppRoutes.supportScreen,
        builder: (context, state) => const SupportScreen(),
      ),
      GoRoute(
        path: AppRoutes.contactScreen,
        builder: (context, state) => ContactScreen(),
      ),
      
      
      
      
      
      GoRoute(
        path: AppRoutes.studentHomeScreen,
        builder: (context, state) => StudentHomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.myCourseScreen,
        builder: (context, state) => MyCourseScreen(),
      ),
      GoRoute(
        path: AppRoutes.teachersScreenForStudent,
        builder: (context, state) => TeachersScreenForStudent(),
      ),
    ],
  );
}
