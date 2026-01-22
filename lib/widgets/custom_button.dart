import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final double? width;
//   final double height;
//   final bool isGradient;
//   final bool isOutlined;
//   final Widget? icon;

//   const CustomButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.width,
//     this.height = 48,
//     this.isGradient = false,
//     this.isOutlined = false,
//     this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width ?? double.infinity,
//       height: height.h,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: isOutlined ? Colors.white : Colors.transparent,
//           elevation: isOutlined ? 0 : 2,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30.r),
//             side: isOutlined
//                 ? const BorderSide(color: Colors.grey)
//                 : BorderSide.none,
//           ),
//           padding: EdgeInsets.zero,
//         ),
//         child: Ink(
//           decoration: BoxDecoration(
//             gradient: isGradient
//                 ? const LinearGradient(
//                     colors: [
//                       Color(0xFF205A60),
//                       Color(0xFF3B8F97),
//                     ],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   )
//                 : null,
//             borderRadius: BorderRadius.circular(30.r),
//           ),
//           child: Center(
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 if (icon != null) ...[
//                   icon!,
//                   SizedBox(width: 8.w),
//                 ],
//                 Text(
//                   text,
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w500,
//                     color: isOutlined ? Colors.black : Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double height;
  final bool isGradient;
  final bool isOutlined;
  final bool isWhiteOutlined; // for transparent white style on dark backgrounds
  final Widget? icon;
  final Color? textColor; // optional override

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 48,
    this.isGradient = false,
    this.isOutlined = false,
    this.isWhiteOutlined = false,
    this.icon,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    // Determine text color
    final effectiveTextColor =
        textColor ??
        (isWhiteOutlined
            ? Colors.grey
            : isOutlined
            ? Colors.black
            : Colors.grey);

    // Determine border side
    final borderSide = isWhiteOutlined
        ? BorderSide(color: Colors.white.withOpacity(0.7))
        : isOutlined
        ? const BorderSide(color: Colors.grey) // ← gray outline as requested
        : BorderSide.none;

    // Background color (transparent for outlined styles)
    final bgColor = (isOutlined || isWhiteOutlined) ? Colors.transparent : null;

    return SizedBox(
      width: width ?? double.infinity,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          elevation: (isOutlined || isWhiteOutlined) ? 0 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
            side: borderSide,
          ),
          padding: EdgeInsets.zero,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: isGradient && !isWhiteOutlined && !isOutlined
                ? const LinearGradient(
                    colors: [Color(0xFF205A60), Color(0xFF3B8F97)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : null,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[icon!, SizedBox(width: 8.w)],
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: effectiveTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
