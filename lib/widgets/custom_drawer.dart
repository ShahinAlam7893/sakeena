import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum UserRole { guest, student, teacher }

class CustomDrawer extends StatelessWidget {
  final UserRole role;
  final String userName;
  final String? avatarUrl; 
  final String? email;
  final VoidCallback? onLogout;
  final String? selectedRoute; 

  const CustomDrawer({
    super.key,
    required this.role,
    required this.userName,
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
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final headerColor = const Color(0xFF2C7A7B); // your brand color

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
            _getRoleDisplayName(),
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

  String _getRoleDisplayName() {
    switch (role) {
      case UserRole.guest:
        return 'Guest';
      case UserRole.student:
        return 'Student';
      case UserRole.teacher:
        return 'Teacher / Instructor';
    }
  }

  List<Widget> _buildMenuItems(BuildContext context) {
    final items = <Map<String, dynamic>>[];

    // Common items
    items.addAll([
      {'icon': Icons.home_outlined, 'title': 'Home', 'route': '/home'},
      {'icon': Icons.school_outlined, 'title': 'Courses', 'route': '/courses'},
    ]);

    // Role-specific items
    switch (role) {
      case UserRole.student:
        items.addAll([
          {'icon': Icons.video_call_outlined, 'title': 'My Classes', 'route': '/classes'},
          {'icon': Icons.bookmark_border, 'title': 'Bookmarks', 'route': '/bookmarks'},
          {'icon': Icons.assessment_outlined, 'title': 'Progress', 'route': '/progress'},
        ]);
        break;

      case UserRole.teacher:
        items.addAll([
          {'icon': Icons.chat_bubble_outline, 'title': 'Messages', 'route': '/messages'},
          {'icon': Icons.upload_file_outlined, 'title': 'Upload Content', 'route': '/upload'},
          {'icon': Icons.people_outline, 'title': 'My Students', 'route': '/students'},
          {'icon': Icons.analytics_outlined, 'title': 'Analytics', 'route': '/analytics'},
        ]);
        break;

      case UserRole.guest:
        items.addAll([
          {'icon': Icons.person_add_outlined, 'title': 'Become a Teacher', 'route': '/become-teacher'},
          {'icon': Icons.help_outline, 'title': 'How it Works', 'route': '/how-it-works'},
        ]);
        break;
    }

    return items.map((item) {
      final isSelected = selectedRoute == item['route'];
      return ListTile(
        leading: Icon(
          item['icon'],
          color: isSelected ? const Color(0xFF2C7A7B) : null,
          size: 26.sp,
        ),
        title: Text(
          item['title'],
          style: TextStyle(
            fontSize: 15.5.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? const Color(0xFF2C7A7B) : null,
          ),
        ),
        selected: isSelected,
        selectedTileColor: const Color(0xFF2C7A7B).withOpacity(0.08),
        onTap: () {
          // You can use Navigator.pushNamed(context, item['route']);
          // or your own navigation logic
          Navigator.pop(context); // close drawer
          // Example: ScaffoldMessenger.of(context).showSnackBar(...);
        },
      );
    }).toList();
  }

  Widget _buildBottomSection(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('Settings'),
          onTap: () {
            Navigator.pop(context);
            // → navigate to settings
          },
        ),
        ListTile(
          leading: const Icon(Icons.help_outline),
          title: const Text('Help & Support'),
          onTap: () {
            Navigator.pop(context);
            // → help page
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