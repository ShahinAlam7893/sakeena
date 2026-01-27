import 'package:go_router/go_router.dart';

import '../features/teachers/_old_course_detail/course_detail.model.dart';
import '../features/teachers/_old_course_detail/course_detail_screen.dart';
import '../features/teachers/course_detail/course_detail_screen.dart';
import '../features/teachers/courses/my_courses_screen.dart';
import '../features/teachers/create_course/create_course_screen.dart';
import '../features/teachers/dashboard/dashboard_screen.dart';
import '../features/teachers/profile/profile_screen.dart';

class TeachersRoutes {
  static const String dashboard = '/teachers/dashboard';
  static const String profile = '/teachers/profile';
  static const String myCourses = '/teachers/my-courses';
  static const String createCourse = '/teachers/create-course';
  static const String courseDetail = '/teachers/course-detail';

  static List<GoRoute> getRoutes() {
    return [
      GoRoute(
        path: dashboard,
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: profile,
        builder: (context, state) => const ProfileScreen(),
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
        builder: (context, state) =>
           const CourseDetailScreen(),
      ),
      // Add more teacher-specific routes here
    ];
  }

  TeachersRoutes._();
}
