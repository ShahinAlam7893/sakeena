import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sakeena/widgets/custom_button.dart';

// Main Page with Profile
class StudentLiveClassPage extends StatelessWidget {
  const StudentLiveClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 80.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: SvgPicture.asset(
            'assets/images/sakeena_logo.svg',
            width: 42.w,
            height: 42.h,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
          ),
          SizedBox(width: 12.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // My Classes Section
            _Section(
              title: 'My Classes',
              subtitle: 'Join your live sessions and access class materials',
              child: ClassCard(
                courseName:
                    'Anxiety Relief: Islamic Approaches to Mental Wellness',
                instructorName: 'Dr. Sarah Johnson',
                status: 'Enrolled',
                imageUrl: 'assets/images/class_image.jpg',
                onJoinClass: () {},
              ),
            ),

            SizedBox(height: 24.h),

            // Continue Learning Section
            Container(
              margin: EdgeInsets.all(10.w),
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey, width: 1.sp),
              ),
              child: _Section(
                title: 'Continue Learning',
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey, width: 1.sp),
                  ),
                  child: Column(
                    children: [
                      _SectionHeader(
                        label: 'Upcoming Sessions',
                        icon: Icons.calendar_today,
                      ),
                      SizedBox(height: 12.h),
                      SessionCard(
                        sessionName: 'Module 2: Dhikr & Mindfulness Practices',
                        date: 'Sunday, Jan 12, 2026',
                        time: '7:00 PM - 9:00 PM',
                        zoomLink: 'https://zoom.us/j/1234567890',
                        onCopyZoomLink: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Zoom link copied!')),
                          );
                        },
                      ),
                      SizedBox(height: 12.h),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10.h),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _WarningBanner(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Main Section Container
class _Section extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;

  const _Section({required this.title, this.subtitle, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Arimo',
              color: Color(0xFF246268),
            ),
          ),
          if (subtitle != null) ...[
            SizedBox(height: 4.h),
            Text(
              subtitle!,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade600,
                fontFamily: 'Arimo',
              ),
            ),
          ],
          SizedBox(height: 12.h),
          child,
        ],
      ),
    );
  }
}

/// Section Header
class _SectionHeader extends StatelessWidget {
  final String label;
  final IconData? icon;

  const _SectionHeader({required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 16.sp, color: Colors.grey.shade700),
          SizedBox(width: 8.w),
        ],
        Text(
          label,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

/// Warning Banner
class _WarningBanner extends StatelessWidget {
  const _WarningBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 16.sp, color: Colors.orange.shade700),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              'Please join 5 minutes before the session starts',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.orange.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// PUBLIC REUSABLE WIDGETS
// ============================================================================

/// Class Card Widget
class ClassCard extends StatelessWidget {
  final String courseName;
  final String instructorName;
  final String status;
  final Color statusColor;
  final String? imageUrl;
  final VoidCallback onJoinClass;
  final IconData instructorIcon;

  const ClassCard({
    super.key,
    required this.courseName,
    required this.instructorName,
    required this.status,
    this.statusColor = const Color(0xFFD4E4E1),
    this.imageUrl,
    required this.onJoinClass,
    this.instructorIcon = Icons.person,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course Image
          if (imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
              child: Image.asset(
                imageUrl!,
                height: 120.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

          // Content
          Padding(
            padding: EdgeInsets.all(14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Course Name
                Text(
                  courseName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10.h),

                // Instructor & Status Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: _InlineInfo(
                        icon: instructorIcon,
                        text: "Instructor: $instructorName",
                        iconSize: 14.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    _StatusBadge(status: status, backgroundColor: statusColor),
                  ],
                ),
                SizedBox(height: 12.h),

                // Join Button
                SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: CustomButton(
                    text: 'Join Class',
                    onPressed: () {},
                    icon: Icon(
                      Icons.video_call,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                    isGradient: true,
                    textColor: Colors.white,
                  ),
                ),
                
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

/// Session Card Widget
class SessionCard extends StatelessWidget {
  final String sessionName;
  final String date;
  final String time;
  final String zoomLink;
  final VoidCallback onCopyZoomLink;

  const SessionCard({
    super.key,
    required this.sessionName,
    required this.date,
    required this.time,
    required this.zoomLink,
    required this.onCopyZoomLink,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Session Title
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey, width: 1.sp),
              ),
              child: Column(
                children: [
                  Text(
                    sessionName,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12.h),

                  // Date & Time
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 80.w) / 2,
                    child: _InlineInfo(
                      icon: Icons.calendar_today,
                      text: date,
                      iconSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 80.w) / 2,
                    child: _InlineInfo(
                      icon: Icons.access_time,
                      text: time,
                      iconSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),

            // Zoom Meeting Details
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey, width: 1.sp),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Zoom Meeting Details:',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Meeting ID: ${zoomLink.split('/j/').last}',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: const Color(0xFF0066CC),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: onCopyZoomLink,
                    child: Text(
                      'Copy',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF2B7A78),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// HELPER WIDGETS
// ============================================================================

/// Inline Info Widget (Icon + Text)
class _InlineInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  final double iconSize;
  final TextStyle? textStyle;

  const _InlineInfo({
    required this.icon,
    required this.text,
    this.iconSize = 14,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: iconSize, color: Colors.grey),
        SizedBox(width: 6.w),
        Expanded(
          child: Text(
            text,
            style:
                textStyle ??
                TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Status Badge Widget
class _StatusBadge extends StatelessWidget {
  final String status;
  final Color backgroundColor;
  final Color textColor;

  const _StatusBadge({
    required this.status,
    required this.backgroundColor,
    this.textColor = const Color(0xFF2B7A78),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 11.sp,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
