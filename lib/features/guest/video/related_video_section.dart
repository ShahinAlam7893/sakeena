import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/related_video_card.dart';


class RelatedVideosSection extends StatelessWidget {
  const RelatedVideosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Related Videos',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16.h),
          // Video cards
          Column(
            children: [
              VideoCard(
                thumbnailImage: 'assets/images/thumbnail_Image_one.jpg',
                title: 'Our Teaching Approach - Evidence-Based Islamic',
                duration: '18:30',
                views: '8.5K',
                uploadedBy: 'Sheikh Omar Hassan',
                uploadedTime: '1 month',
              ),
              VideoCard(
                thumbnailImage: 'assets/images/thumbnail_Image_two.jpg',
                title: 'Student Success Stories - Transformative Healing',
                duration: '15:20',
                views: '12.8K',
                uploadedBy: 'Dr. Sarah Ahmed',
                uploadedTime: '3 weeks',
              ),
              VideoCard(
                thumbnailImage: 'assets/images/thumbnail_Image_one.jpg',
                title: 'Understanding Anxiety from Islamic Perspective',
                duration: '25:15',
                views: '22.4K',
                uploadedBy: 'Dr. Aisha Khan',
                uploadedTime: '1 week',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
