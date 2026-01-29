import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double height;
  final bool isGradient;
  final bool isOutlined;
  final bool isWhiteOutlined;
  final Widget? icon;
  final Color? textColor;

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
        ? const BorderSide(color: Colors.grey)
        : BorderSide.none;

    final bgColor = (isOutlined || isWhiteOutlined) ? Colors.transparent : null;

    return SizedBox(
      // width: width ?? double.infinity,
      width: width,
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
                Flexible(
                  child: Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
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
