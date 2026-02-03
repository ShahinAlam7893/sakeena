import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const TeacherBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF2C7A7B),
        unselectedItemColor: Colors.grey.shade400,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 24.sp),
            activeIcon: Icon(Icons.home, size: 24.sp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined, size: 24.sp),
            activeIcon: Icon(Icons.school, size: 24.sp),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined, size: 24.sp),
            activeIcon: Icon(Icons.chat, size: 24.sp),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_outlined, size: 24.sp),
            activeIcon: Icon(Icons.upload, size: 24.sp),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined, size: 24.sp),
            activeIcon: Icon(Icons.menu, size: 24.sp),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
