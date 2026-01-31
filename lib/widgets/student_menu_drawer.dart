import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/route/go_route.dart';

class DrawerMenuItem {
  final String label;
  final IconData icon;
  final String route;

  const DrawerMenuItem({
    required this.label,
    required this.icon,
    required this.route,
  });
}



const List<DrawerMenuItem> studentMenuItems = [
  DrawerMenuItem(
    label: 'Home',
    icon: Icons.home_outlined,
    route: AppRoutes.studentHomeScreen,
  ),
  DrawerMenuItem(
    label: 'Courses',
    icon: Icons.school_outlined,
    route: AppRoutes.myCourseScreen,
  ),
  DrawerMenuItem(
    label: 'Class joining',
    icon: Icons.video_call_outlined,
    route: AppRoutes.studentLiveClass,
  ),
  DrawerMenuItem(
    label: 'Teachers',
    icon: Icons.people_outline,
    route: AppRoutes.teachersScreenForStudent,
  ),
  DrawerMenuItem(
    label: 'Book',
    icon: Icons.menu_book_outlined,
    route: AppRoutes.booksPage,
  ),
  DrawerMenuItem(
    label: 'Blog',
    icon: Icons.article_outlined,
    route: AppRoutes.blogScreen,
  ),
  DrawerMenuItem(
    label: 'Profile',
    icon: Icons.person_outline,
    route: AppRoutes.studentProfilePage,
  ),
  DrawerMenuItem(
    label: 'Settings',
    icon: Icons.settings_outlined,
    route: AppRoutes.profileSettingsPage,
  ),
];


class StudentMenuDrawer extends StatelessWidget {
  const StudentMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: studentMenuItems.map((item) {
              final isActive = currentRoute.startsWith(item.route);

              return _MenuTile(
                label: item.label,
                icon: item.icon,
                isActive: isActive,
                onTap: () {
                  Navigator.pop(context);
                  if (!isActive) {
                    context.go(item.route);
                  }
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _MenuTile({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF2C7A7B) : Colors.transparent,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22.sp,
              color: isActive ? Colors.white : const Color(0xFF555555),
            ),
            SizedBox(width: 12.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: isActive ? Colors.white : const Color(0xFF333333),
              ),
            ),
          ],
        ),
      ),
    );
  }
}