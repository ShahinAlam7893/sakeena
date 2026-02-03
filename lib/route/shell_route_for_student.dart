// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../widgets/custom_bottom_navbar.dart';
// import '../widgets/student_menu_drawer.dart';
// import 'go_route.dart';

// class StudentShell extends StatefulWidget {
//   final Widget child;

//   const StudentShell({super.key, required this.child});

//   @override
//   State<StudentShell> createState() => _StudentShellState();
// }

// class _StudentShellState extends State<StudentShell> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   int _currentIndex = 0;

//   void _onTap(int index) {
//     if (index == 4) {
//       _scaffoldKey.currentState?.openEndDrawer();
//       return;
//     }

//     setState(() => _currentIndex = index);

//     switch (index) {
//       case 0:
//         context.go(AppRoutes.studentHomeScreen);
//         break;
//       case 1:
//         context.go(AppRoutes.myCourseScreen);
//         break;
//       case 2:
//         context.go(AppRoutes.teachersScreenForStudent);
//         break;
//       case 3:
//         context.go(AppRoutes.studentLiveClass);
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final location = GoRouterState.of(context).uri.toString();

//     if (location.startsWith(AppRoutes.studentHomeScreen)) {
//       _currentIndex = 0;
//     } else if (location.startsWith(AppRoutes.myCourseScreen)) {
//       _currentIndex = 1;
//     } else if (location.startsWith(AppRoutes.teachersScreenForStudent)) {
//       _currentIndex = 2;
//     } else if (location.startsWith(AppRoutes.studentLiveClass)) {
//       _currentIndex = 3;
//     }

//     return Scaffold(
//       key: _scaffoldKey,
//       body: widget.child,
//       endDrawer: const StudentMenuDrawer(),
//       bottomNavigationBar: CustomBottomNavBar(
//       items: studentBottomNavItems,
//       currentIndex: _currentIndex,
//       onTap: _onTap,
// ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/widgets/custom_bottom_navbar.dart';
import 'package:sakeena/widgets/student_menu_drawer.dart';
import 'go_route.dart';

class StudentShell extends StatefulWidget {
  final Widget child;

  const StudentShell({super.key, required this.child});

  @override
  State<StudentShell> createState() => _StudentShellState();
}

class _StudentShellState extends State<StudentShell> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  void _onTap(int index) {
    if (index == 4) {
      // Menu button - open drawer
      _scaffoldKey.currentState?.openEndDrawer();
      return;
    }

    setState(() => _currentIndex = index);

    switch (index) {
      case 0:
        context.go(AppRoutes.studentHomeScreen);
        break;
      case 1:
        context.go(AppRoutes.myCourseScreen);
        break;
      case 2:
        context.go(AppRoutes.teachersScreenForStudent);
        break;
      case 3:
        context.go(AppRoutes.studentLiveClass);
        break;
    }
  }

  String _getCurrentRoute() {
    return GoRouterState.of(context).uri.toString();
  }

  @override
  Widget build(BuildContext context) {
    final location = _getCurrentRoute();

    // Update current index based on current location
    if (location.startsWith(AppRoutes.studentHomeScreen)) {
      _currentIndex = 0;
    } else if (location.startsWith(AppRoutes.myCourseScreen)) {
      _currentIndex = 1;
    } else if (location.startsWith(AppRoutes.teachersScreenForStudent)) {
      _currentIndex = 2;
    } else if (location.startsWith(AppRoutes.studentLiveClass)) {
      _currentIndex = 3;
    }

    return Scaffold(
      key: _scaffoldKey,
      body: widget.child,
      endDrawer: StudentMenuDrawer(selectedRoute: location),
      bottomNavigationBar: CustomBottomNavBar(
        items: studentBottomNavItems,
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
