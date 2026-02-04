import 'package:go_router/go_router.dart';
import 'package:sakeena/features/guest/consultation_screen.dart';
import 'package:sakeena/features/student/profile/profile_and_settings_screen.dart';
import 'package:sakeena/features/teachers/consultation_page/consultation_page.dart';
import 'package:sakeena/features/teachers/earnings/earnings_screen.dart';
import 'package:sakeena/features/teachers/landing_page/landing_page.dart';
import 'package:sakeena/features/teachers/upload_content/upload_content.dart';
import 'package:sakeena/features/teachers/upload_content/upload_new_content.dart';
import '../features/teachers/course_detail/course_detail_screen.dart';
import '../features/teachers/courses/my_courses_screen.dart';
import '../features/teachers/create_course/create_course_screen.dart';
import '../features/teachers/dashboard/dashboard_screen.dart';
import '../features/teachers/profile/profile_screen.dart';

class TeachersRoutes {
  static const String dashboard = '/teachers/dashboard';
  static const String profile = '/teachers/profile';
  static const String myCourses = '/teachers/my-courses';
  static const String message = "/message";
  static const String createCourse = '/teachers/create-course';
  static const String courseDetail = '/teachers/course-detail';
  static const String menu = "/menu";
  static const String consultation = "/consultation";
  static const consultationManagement = "/consultation-management";

  static const String uploadContent = "/upload-content";
  static const String uploadNewContent = "/upload-new-content";
  static const String earnings = "/earnings";
  static const String settings = "/settings";

  static List<RouteBase> getRoutes() {
    return [
      ShellRoute(
        builder: (context, state, child) => LandingPageTeacher(child: child),
        routes: [
          GoRoute(
            path: dashboard,
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: myCourses,
            builder: (context, state) => const MyCoursesScreen(),
          ),
          GoRoute(
            path: consultation,
            builder: (context, state) => const ConsultationManagementScreen(),
          ),
          GoRoute(
            path: uploadContent,
            builder: (context, state) => const UploadContentHomePage(),
          ),
          GoRoute(
            path: uploadNewContent,
            builder: (context, state) => const UploadNewContentPage(),
          ),
          GoRoute(
            path: earnings,
            builder: (context, state) => const EarningsScreen(),
          ),
          GoRoute(
            path: settings,
            builder: (context, state) => const ProfileSettingsPage(),
          ),
          GoRoute(
        path: profile,
        builder: (context, state) => const ProfileScreen(),
      ),
        ],
      ),

      GoRoute(
        path: dashboard,
        builder: (context, state) => const DashboardScreen(),
      ),
      
      GoRoute(
        path: myCourses,
        builder: (context, state) => const MyCoursesScreen(),
      ),
      GoRoute(
        path: createCourse,
        builder: (context, state) => const CreateCourseScreen(),
      ),
      GoRoute(
        path: courseDetail,
        builder: (context, state) => const CourseDetailScreen(),
      ),
      // Add more teacher-specific routes here
    ];
  }

  TeachersRoutes._();
}
