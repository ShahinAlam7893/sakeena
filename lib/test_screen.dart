// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:sakeena/view_model/user_provider.dart';
// import 'package:sakeena/widgets/custom_button.dart';
// import 'package:sakeena/widgets/custom_text_field.dart';
// import 'package:sakeena/widgets/custom_bottom_navbar.dart';

// class TestScreen extends StatefulWidget {
//   const TestScreen({super.key});

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   int _currentIndex = 0;

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<UserProvider>(
//       builder: (context, userProvider, _) {
//         final currentUserType = userProvider.userType;

//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Reusable Widgets Test'),
//             centerTitle: true,
//           ),

//           drawer: Drawer(
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 DrawerHeader(
//                   decoration: const BoxDecoration(color: Color(0xFF2C7A7B)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         'Sakeena',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 8.h),
//                       Text(
//                         'Current role: ${currentUserType.name.toUpperCase()}',
//                         style: TextStyle(color: Colors.white70, fontSize: 16.sp),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const ListTile(leading: Icon(Icons.home), title: Text('Home')),
//                 const ListTile(leading: Icon(Icons.school), title: Text('Courses')),
//                 const ListTile(leading: Icon(Icons.video_call), title: Text('Live Classes')),
//                 const ListTile(leading: Icon(Icons.chat), title: Text('Messages')),
//                 const Divider(),
//                 const ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
//                 const ListTile(leading: Icon(Icons.help_outline), title: Text('Help')),
//                 ListTile(
//                   leading: const Icon(Icons.logout, color: Colors.redAccent),
//                   title: const Text('Logout', style: TextStyle(color: Colors.redAccent)),
//                   onTap: () {
//                     userProvider.setUserType(UserType.guest);
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//           ),

//           body: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Current role indicator
//                 Container(
//                   padding: EdgeInsets.all(12.w),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF2C7A7B).withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12.r),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.person_outline, size: 24.sp, color: const Color(0xFF2C7A7B)),
//                       SizedBox(width: 12.w),
//                       Text(
//                         'Current Role: ${currentUserType.name.toUpperCase()}',
//                         style: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w600,
//                           color: const Color(0xFF2C7A7B),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 SizedBox(height: 24.h),

//                 // Role switcher (for testing)
//                 _sectionTitle('Switch Role (Test Only)'),
//                 SizedBox(height: 12.h),
//                 Wrap(
//                   spacing: 12.w,
//                   runSpacing: 12.h,
//                   children: [
//                     _roleButton(UserType.guest, userProvider),
//                     _roleButton(UserType.student, userProvider),
//                     _roleButton(UserType.teacher, userProvider),
//                   ],
//                 ),

//                 SizedBox(height: 40.h),

//                 // Text Fields
//                 _sectionTitle('Text Fields'),
//                 SizedBox(height: 16.h),
//                 CustomTextField(controller: nameController, hintText: 'Enter your full name'),
//                 SizedBox(height: 12.h),
//                 CustomTextField(
//                   controller: emailController,
//                   hintText: 'Enter your email',
//                   prefixIcon: Icons.email_outlined,
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 SizedBox(height: 12.h),
//                 CustomTextField(
//                   controller: passwordController,
//                   hintText: 'Password',
//                   isPassword: true,
//                 ),

//                 SizedBox(height: 40.h),

//                 // Buttons
//                 _sectionTitle('Buttons'),
//                 SizedBox(height: 16.h),
//                 CustomButton(text: 'Login', isGradient: true, height: 52.h, onPressed: () {}),
//                 SizedBox(height: 12.h),
//                 CustomButton(
//                   text: 'Sign in with Google',
//                   isOutlined: true,
//                   height: 52.h,
//                   icon: Icon(Icons.login, size: 20.w),
//                   onPressed: () {},
//                 ),
//                 SizedBox(height: 12.h),
//                 CustomButton(
//                   text: 'Continue as guest',
//                   isOutlined: true,
//                   height: 48.h,
//                   onPressed: () => userProvider.setUserType(UserType.guest),
//                 ),

//                 SizedBox(height: 48.h),

//                 // Bottom Navigation Bar
//                 _sectionTitle('Bottom Navigation Bar'),
//                 SizedBox(height: 16.h),

// Builder(
//   builder: (BuildContext navContext) {
//     return CustomBottomNavBar(
//       currentIndex: _currentIndex,
//       userType: currentUserType,
//       onTap: (index) {
//         final items = bottomNavConfig[currentUserType] ?? [];
//         final isLastItem = index == items.length - 1;

//         if (isLastItem) {
//           print("Menu tapped → opening drawer");
//           Scaffold.of(navContext).openDrawer();
//           return;
//         }

//         setState(() => _currentIndex = index);
//       },
//     );
//   },
// ),

//                 SizedBox(height: 120.h),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _sectionTitle(String text) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: 20.sp,
//         fontWeight: FontWeight.w700,
//         color: Colors.black87,
//       ),
//     );
//   }

//   Widget _roleButton(UserType type, UserProvider provider) {
//     final isActive = provider.userType == type;

//     return OutlinedButton(
//       onPressed: () {
//         provider.setUserType(type);
//         setState(() => _currentIndex = 0);
//       },
//       style: OutlinedButton.styleFrom(
//         side: BorderSide(
//           color: isActive ? const Color(0xFF2C7A7B) : Colors.grey,
//           width: isActive ? 2 : 1,
//         ),
//         backgroundColor: isActive ? const Color(0xFF2C7A7B).withOpacity(0.08) : null,
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//       ),
//       child: Text(
//         type.name.toUpperCase(),
//         style: TextStyle(
//           color: isActive ? const Color(0xFF2C7A7B) : Colors.black87,
//           fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
//         ),
//       ),
//     );
//   }
// }