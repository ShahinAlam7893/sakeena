import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/route/go_route.dart';


class StudentMenuDrawer extends StatelessWidget {
  final String userName;
  final String? avatarUrl;
  final String? email;
  final VoidCallback? onLogout;
  final String? selectedRoute;

  const StudentMenuDrawer({
    super.key,
    this.userName = 'Student',
    this.avatarUrl,
    this.email,
    this.onLogout,
    this.selectedRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // ─── Header ───────────────────────────────────────
          _buildHeader(context),

          // ─── Menu Items ───────────────────────────────────
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: _buildMenuItems(context),
            ),
          ),

          // ─── Bottom section (Settings + Logout) ───────────
          const Divider(height: 1),
          _buildBottomSection(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final headerColor = const Color(0xFF2C7A7B);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24.w, 60.h, 24.w, 28.h),
      decoration: BoxDecoration(
        color: headerColor,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [headerColor, headerColor.withOpacity(0.85)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          CircleAvatar(
            radius: 38.r,
            backgroundColor: Colors.white24,
            backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
            child: avatarUrl == null
                ? Icon(Icons.person, size: 44.sp, color: Colors.white70)
                : null,
          ),
          SizedBox(height: 16.h),

          // Name & Role
          Text(
            userName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Student',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14.sp,
            ),
          ),
          if (email != null) ...[
            SizedBox(height: 4.h),
            Text(
              email!,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 13.sp,
              ),
            ),
          ],
        ],
      ),
    );
  }

  List<Widget> _buildMenuItems(BuildContext context) {
    final items = [
      {
        'icon': Icons.home_outlined,
        'title': 'Home',
        'route': AppRoutes.studentHomeScreen,
      },
      {
        'icon': Icons.school_outlined,
        'title': 'Courses',
        'route': AppRoutes.myCourseScreen,
      },
      {
        'icon': Icons.video_call_outlined,
        'title': 'Class Joining',
        'route': AppRoutes.studentLiveClass,
      },
      {
        'icon': Icons.person_outline,
        'title': 'Teachers',
        'route': AppRoutes.teachersScreenForStudent,
      },
      {
        'icon': Icons.auto_stories_outlined,
        'title': 'Books',
        'route': AppRoutes.booksPage,
      },
      {
        'icon': Icons.article_outlined,
        'title': 'Blog',
        'route': AppRoutes.blogScreen,
      },
      {
        'icon': Icons.person,
        'title': 'Profile',
        'route': AppRoutes.studentProfilePage,
      },
      {
        'icon': Icons.settings_outlined,
        'title': 'Settings',
        'route': AppRoutes.profileSettingsPage,
      },
    ];

    return items.map((item) {
      final isSelected = selectedRoute == item['route'];
      return ListTile(
        leading: Icon(
          item['icon'] as IconData,
          color: isSelected ? const Color(0xFF2C7A7B) : null,
          size: 26.sp,
        ),
        title: Text(
          item['title'] as String,
          style: TextStyle(
            fontSize: 15.5.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? const Color(0xFF2C7A7B) : null,
          ),
        ),
        selected: isSelected,
        selectedTileColor: const Color(0xFF2C7A7B).withOpacity(0.08),
        onTap: () {
          Navigator.pop(context);
          context.go(item['route'] as String);
        },
      );
    }).toList();
  }

  Widget _buildBottomSection(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.help_outline),
          title: const Text('Help & Support'),
          onTap: () {
            Navigator.pop(context);
            context.go(AppRoutes.supportScreen);
          },
        ),
        const Divider(height: 8),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.redAccent),
          title: const Text(
            'Logout',
            style: TextStyle(color: Colors.redAccent),
          ),
          onTap: () {
            Navigator.pop(context);
            if (onLogout != null) onLogout!();
          },
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}