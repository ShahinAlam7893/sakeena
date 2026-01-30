// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sakeena/view_model/user_provider.dart';

// class NavItem {
//   final String label;
//   final IconData? icon;
//   final String? svgPath;

//   const NavItem({
//     required this.label,
//     this.icon,
//     this.svgPath,
//   }) : assert(icon != null || svgPath != null, 'Either icon or svgPath must be provided');

//   bool get isMenu => label == 'Menu';
// }

// final Map<UserType, List<NavItem>> bottomNavConfig = {
//   UserType.guest: const [
//     NavItem(label: 'Home', icon: Icons.home_outlined),
//     NavItem(label: 'Courses', icon: Icons.school_outlined),
//     NavItem(label: 'Teachers', icon: Icons.person_outline),
//     NavItem(label: 'Menu', icon: Icons.menu),
//   ],

//   UserType.student: const [
//     NavItem(label: 'Home', icon: Icons.home_outlined),
//     NavItem(label: 'Courses', icon: Icons.school_outlined),
//     NavItem(label: 'Class', icon: Icons.video_call_outlined),
//     NavItem(label: 'Menu', icon: Icons.menu),
//   ],

//   UserType.teacher: const [
//     NavItem(label: 'Home', icon: Icons.home_outlined),
//     NavItem(label: 'Courses', icon: Icons.school_outlined),
//     NavItem(label: 'Chat', icon: Icons.chat_bubble_outline),
//     NavItem(label: 'Upload', icon: Icons.file_upload_outlined),
//     NavItem(label: 'Menu', icon: Icons.menu),
//   ],
// };

// class CustomBottomNavBar extends StatelessWidget {
//   final int currentIndex;
//   final ValueChanged<int> onTap;
//   final UserType userType;

//   const CustomBottomNavBar({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//     required this.userType,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final items = bottomNavConfig[userType] ?? [];

//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//       decoration: BoxDecoration(
//         color: const Color(0xFFFFFBE7),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 10,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: List.generate(items.length, (index) {
//           final item = items[index];
//           final isActive = index == currentIndex && !item.isMenu;

//           return _NavButton(
//             item: item,
//             isActive: isActive,
//             onTap: () => onTap(index),
//           );
//         }),
//       ),
//     );
//   }
// }

// class _NavButton extends StatelessWidget {
//   final NavItem item;
//   final bool isActive;
//   final VoidCallback onTap;

//   const _NavButton({
//     required this.item,
//     required this.isActive,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 280),
//         curve: Curves.easeInOut,
//         padding: EdgeInsets.symmetric(
//           horizontal: isActive ? 16.w : 10.w,
//           vertical: 10.h,
//         ),
//         decoration: BoxDecoration(
//           color: isActive ? const Color(0xFF2C7A7B) : Colors.transparent,
//           borderRadius: BorderRadius.circular(30.r),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             _buildIcon(item, isActive),
//             if (isActive) ...[
//               SizedBox(width: 6.w),
//               Text(
//                 item.label,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 13.5.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildIcon(NavItem item, bool isActive) {
//     final color = isActive ? Colors.white : const Color(0xFF555555);

//     if (item.icon != null) {
//       return Icon(item.icon, size: 24.sp, color: color);
//     }

//     return SvgPicture.asset(
//       item.svgPath!,
//       width: 24.sp,
//       height: 24.sp,
//       colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavItem {
  final String label;
  final IconData icon;

  const NavItem({required this.label, required this.icon});

  bool get isMenu => label == 'Menu';
}

// 🔹 Student bottom nav items only
const List<NavItem> studentNavItems = [
  NavItem(label: 'Home', icon: Icons.home_outlined),
  NavItem(label: 'Courses', icon: Icons.school_outlined),
  NavItem(label: 'Class', icon: Icons.video_call_outlined),
  NavItem(label: 'Menu', icon: Icons.menu),
];

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFBE7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(studentNavItems.length, (index) {
            final item = studentNavItems[index];
            final isActive = index == currentIndex && !item.isMenu;

            return _NavButton(
              item: item,
              isActive: isActive,
              onTap: () => onTap(index),
            );
          }),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _NavButton({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? 16.w : 10.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF2C7A7B) : Colors.transparent,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              item.icon,
              size: 24.sp,
              color: isActive ? Colors.white : const Color(0xFF555555),
            ),
            if (isActive) ...[
              SizedBox(width: 6.w),
              Text(
                item.label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
