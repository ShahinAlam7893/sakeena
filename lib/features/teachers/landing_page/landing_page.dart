import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/features/teachers/landing_page/teacher_menu_drawer.dart';
import 'package:sakeena/route/teachers_routes.dart';
import 'package:sakeena/widgets/custom_bottom_navbar.dart';

class LandingPageTeacher extends StatefulWidget {
  final Widget? child;
  const LandingPageTeacher({super.key, this.child});

  @override
  State<LandingPageTeacher> createState() => _LandingPageTeacherState();
}

class _LandingPageTeacherState extends State<LandingPageTeacher> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Define teacher nav items
  final List<BottomNavItem> teacherNavItems = [
    BottomNavItem(
      label: 'Home',
      icon: Icons.home_outlined,
      route: TeachersRoutes.dashboard,
    ),
    BottomNavItem(
      label: 'Courses',
      icon: Icons.school_outlined,
      route: TeachersRoutes.myCourses,
    ),
    BottomNavItem(
      label: 'Consult',
      icon: Icons.video_call_outlined,
      route: TeachersRoutes.consultation,
    ),
    BottomNavItem(
      label: 'Upload',
      icon: Icons.cloud_upload_outlined,
      route: TeachersRoutes.uploadContent,
    ),
    BottomNavItem(
      label: 'Menu',
      icon: Icons.menu_outlined,
      isMenu: true,
    ),
  ];

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith(TeachersRoutes.myCourses)) return 1;
    if (location.startsWith(TeachersRoutes.consultation)) return 2;
    if (location.startsWith(TeachersRoutes.uploadContent)) return 3;
    return 0;
  }

  void _onNavTap(int index) {
    final item = teacherNavItems[index];
    
    if (item.isMenu) {
      // Open drawer for menu
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      // Navigate to route
      if (item.route != null) {
        context.go(item.route!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);
    final currentRoute = GoRouterState.of(context).uri.toString();

    return Scaffold(
      key: _scaffoldKey,
      body: widget.child ?? const SizedBox.shrink(),
      endDrawer: TeacherMenuDrawer(selectedRoute: currentRoute),
      bottomNavigationBar: CustomBottomNavBar(
        items: teacherNavItems,
        currentIndex: currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sakeena/route/teachers_routes.dart';

// class LandingPageTeacher extends StatefulWidget {
//   final Widget? child;
//   const LandingPageTeacher({super.key, this.child});

//   @override
//   State<LandingPageTeacher> createState() => _LandingPageTeacherState();
// }

// class _LandingPageTeacherState extends State<LandingPageTeacher> {
//   final List<String> _pages = [
//     TeachersRoutes.dashboard,
//     TeachersRoutes.myCourses,
//     TeachersRoutes.consultation,
//     TeachersRoutes.uploadContent,
//     TeachersRoutes.menu,
//   ];

//   int _getCurrentIndex(BuildContext context) {
//     final location = GoRouterState.of(context).uri.toString();

//     if (location.startsWith(TeachersRoutes.myCourses)) return 1;
//     if (location.startsWith(TeachersRoutes.consultation)) return 2;
//     if (location.startsWith(TeachersRoutes.uploadContent)) return 3;
//     if (location.startsWith(TeachersRoutes.menu)) return 4;
//     return 0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final currentIndex = _getCurrentIndex(context);

//     return Scaffold(
//       body: widget.child ?? const SizedBox.shrink(),

//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: const Color(0xFFFFF7E6),
//         selectedItemColor: theme.colorScheme.primary,
//         unselectedItemColor: const Color(0xFF9E9E9E),
//         selectedFontSize: 12,
//         unselectedFontSize: 11,

//         onTap: (index) {
//           context.go(_pages[index]);
//         },

//         items: [
//           _navItem("assets/icons/teacher/honme.svg", "Home"),
//           _navItem("assets/icons/teacher/course.svg", "Course"),
//           _navItem("assets/icons/teacher/consultation.svg", "Consult"),
//           _navItem("assets/icons/teacher/upload (2).svg", "Upload"),
//           _navItem("assets/icons/teacher/menu (2).svg", "Menu"),
//         ],
//       ),
//     );
//   }

//   BottomNavigationBarItem _navItem(String icon, String label) {
//     return BottomNavigationBarItem(
//       icon: SvgPicture.asset(
//         icon,
//         height: 20.h,
//         color: const Color(0xFF9E9E9E),
//       ),

//       activeIcon: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         decoration: BoxDecoration(
//           color: const Color(0xFF2E8B8B),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(icon, height: 15, color: Colors.white),
//            SizedBox(width: 5.w),
//             Text(
//               label,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 10,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),

//       label: "",
//     );
//   }
// }
