import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/route/teachers_routes.dart';

class TeacherDrawerMenuItem {
  final String label;
  final IconData icon;
  final String route;

  const TeacherDrawerMenuItem({
    required this.label,
    required this.icon,
    required this.route,
  });
}

const List<TeacherDrawerMenuItem> teacherMenuItems = [
  TeacherDrawerMenuItem(
    label: 'Home',
    icon: Icons.home_outlined,
    route: TeachersRoutes.dashboard,
  ),
  TeacherDrawerMenuItem(
    label: 'My Courses',
    icon: Icons.school_outlined,
    route: TeachersRoutes.myCourses,
  ),
  TeacherDrawerMenuItem(
    label: 'Consultations',
    icon: Icons.video_call_outlined,
    route: TeachersRoutes.consultation,
  ),
  TeacherDrawerMenuItem(
    label: 'Content Upload',
    icon: Icons.cloud_upload_outlined,
    route: TeachersRoutes.uploadContent,
  ),
  TeacherDrawerMenuItem(
    label: 'Earnings & Revenue',
    icon: Icons.attach_money_outlined,
    route: TeachersRoutes.earnings,
  ),
  TeacherDrawerMenuItem(
    label: 'Profile',
    icon: Icons.person_outline,
    route: TeachersRoutes.profile,
  ),
  TeacherDrawerMenuItem(
    label: 'Settings',
    icon: Icons.settings_outlined,
    route: TeachersRoutes.settings,
  ),
];

class TeacherMenuDrawer extends StatelessWidget {
  final String selectedRoute;

  const TeacherMenuDrawer({super.key, required this.selectedRoute});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: teacherMenuItems.map((item) {
              final isActive = selectedRoute.startsWith(item.route);

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
        margin: EdgeInsets.only(bottom: 12.h),
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
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: isActive ? Colors.white : const Color(0xFF333333),
              ),
            ),
          ],
        ),
      ),
    );
  }
}