import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/route/go_route.dart';


class GuestMenuDrawer extends StatelessWidget {
  final String? selectedRoute;

  const GuestMenuDrawer({
    super.key,
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

          // ─── Bottom section ───────────────────────────────
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
            child: Icon(Icons.person, size: 44.sp, color: Colors.white70),
          ),
          SizedBox(height: 16.h),

          // Name & Role
          Text(
            'Guest',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Explore & Learn',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMenuItems(BuildContext context) {
    final items = [
      {
        'icon': Icons.home_outlined,
        'title': 'Home',
        'route': AppRoutes.guestHome,
      },
      {
        'icon': Icons.school_outlined,
        'title': 'Courses',
        'route': AppRoutes.coursesScreen,
      },
      {
        'icon': Icons.person_outline,
        'title': 'Teachers',
        'route': AppRoutes.teachersScreen,
      },
      {
        'icon': Icons.info_outline,
        'title': 'About',
        'route': AppRoutes.aboutScreen,
      },
      {
        'icon': Icons.lightbulb_outline,
        'title': 'How it Works',
        'route': AppRoutes.howItWorks,
      },
      {
        'icon': Icons.video_library_outlined,
        'title': 'Videos',
        'route': AppRoutes.videoLibraryScreen,
      },
      {
        'icon': Icons.article_outlined,
        'title': 'Blog',
        'route': AppRoutes.blogScreen,
      },
      {
        'icon': Icons.auto_stories_outlined,
        'title': 'Books',
        'route': AppRoutes.booksPage,
      },
      {
        'icon': Icons.star_outline,
        'title': 'Testimonials',
        'route': AppRoutes.blogScreen,
      },
      {
        'icon': Icons.card_membership_outlined,
        'title': 'Subscription',
        'route': AppRoutes.subscription,
      },
      {
        'icon': Icons.mail_outline,
        'title': 'Contact',
        'route': AppRoutes.contactScreen,
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
        SizedBox(height: 16.h),
      ],
    );
  }
}