import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpertTeachersCard extends StatelessWidget {
  final String name;
  final String subject;
  final String description;
  final String imagePath;
  final VoidCallback? onReadMore;

  const ExpertTeachersCard({
    super.key,
    required this.name,
    required this.subject,
    required this.description,
    required this.imagePath,
    this.onReadMore,
  });

  bool get isSvg => imagePath.toLowerCase().endsWith('.svg');
  bool get isNetwork => imagePath.startsWith('http');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Avatar
          Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: ClipOval(child: _buildImage()),
            ),
          ),

          SizedBox(height: 8.sp),

          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Arimo',
            ),
          ),

         SizedBox(height: 4.sp),

          Text(
            subject,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: Color(0xFF4F7F67),
              fontWeight: FontWeight.w400,
              fontFamily: 'Arimo',
            ),
          ),

         SizedBox(height: 8.sp),

          Text(
            description,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 11.sp, color: Colors.black, fontFamily: 'Arimo'),
          ),
          InkWell(
            onTap: onReadMore,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Read more',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF4F7F67),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward, size: 14, color: Color(0xFF4F7F67)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔥 Smart image handler
  Widget _buildImage() {
    if (isSvg) {
      return SvgPicture.asset(imagePath, fit: BoxFit.fitHeight);
    } else if (isNetwork) {
      return Image.network(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _fallbackAvatar(),
      );
    } else {
      return Image.asset(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _fallbackAvatar(),
      );
    }
  }

  Widget _fallbackAvatar() {
    return const Icon(Icons.person, size: 40, color: Colors.white);
  }
}
