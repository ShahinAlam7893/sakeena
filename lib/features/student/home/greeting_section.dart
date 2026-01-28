// // lib/widgets/home/greeting_section.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sakeena/core/constant/app_colors.dart';
// import 'package:sakeena/core/constant/app_text_styles.dart';


// class GreetingSection extends StatelessWidget {
//   const GreetingSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "As-salamu alaykum, Student!",
//                   style: AppTextStyles.greeting(),
//                 ),
//                 4.verticalSpace,
//                 Text(
//                   "Welcome back to Sakeena Academy",
//                   style: AppTextStyles.subtitle(size: 14),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             // Small profile avatar (optional)
//             CircleAvatar(
//               radius: 22.r,
//               backgroundColor: AppColors.primary.withOpacity(0.2),
//               child: Text("S", style: TextStyle(fontSize: 18.sp, color: AppColors.primary)),
//             ),
//           ],
//         ),

//         16.verticalSpace,

//         // Responsive SVG Banner
//         ClipRRect(
//           borderRadius: BorderRadius.circular(16.r),
//           child: SvgPicture.asset(
//             'assets/images/student_home_banner.svg',
//             width: double.infinity,
//             height: 140.h,      
//             fit: BoxFit.cover,
//           ),
//         ),
//       ],
//     );
//   }
// }