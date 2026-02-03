import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/consultation_revenue.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';
import 'package:sakeena/widgets/earnings_header.dart';
import 'package:sakeena/widgets/earnings_stats.dart';
import 'package:sakeena/widgets/revenue_breakdown.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  // Sample data - replace with actual API calls
  final double totalEarnings = 12400;
  final double courseRevenue = 9800;
  final int totalStudents = 247;

  final List<CourseRevenueData> courseRevenueData = [
    CourseRevenueData(
      courseName: 'Mindfulness in Islam',
      students: 42,
      revenue: 99,
    ),
    CourseRevenueData(
      courseName: 'Mindfulness in Islam',
      students: 42,
      revenue: 99,
    ),
    CourseRevenueData(
      courseName: 'Mindfulness in Islam',
      students: 42,
      revenue: 99,
    ),
  ];

  final List<ConsultationRevenueData> consultationRevenueData = [
    ConsultationRevenueData(
      period: 'Jan, 2026',
      sessions: 12,
      hours: 12,
      revenue: 4158,
    ),
    ConsultationRevenueData(
      period: 'Nov, 2025',
      sessions: 14,
      hours: 2,
      revenue: 4158,
    ),
    ConsultationRevenueData(
      period: 'Dec, 2025',
      sessions: 10,
      hours: 8,
      revenue: 4158,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: CustomAppBar(onNotificationTap: () {},),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: EarningsHeader(),
            ),

            // Stats Cards
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Row(
                  children: [
                    Expanded(
                      child: EarningStatsCard(
                        icon: Icons.trending_up_rounded,
                        title: 'Total Earnings',
                        amount: totalEarnings,
                        subtitle: 'All time',
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: EarningStatsCard(
                        icon: Icons.school_rounded,
                        title: 'Course Revenue',
                        amount: courseRevenue,
                        subtitle: '$totalStudents students',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Course Revenue Breakdown
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: RevenueBreakdownSection(
                  data: courseRevenueData,
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 16.h)),

            // Consultation Revenue Breakdown
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ConsultationRevenueSection(
                  data: consultationRevenueData,
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 16.h)),

            // Read Only Section
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const ReadOnlySection(),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          ],
        ),
      ),
    );
  }
}

// Data Models
class CourseRevenueData {
  final String courseName;
  final int students;
  final double revenue;

  CourseRevenueData({
    required this.courseName,
    required this.students,
    required this.revenue,
  });
}

class ConsultationRevenueData {
  final String period;
  final int sessions;
  final int hours;
  final double revenue;

  ConsultationRevenueData({
    required this.period,
    required this.sessions,
    required this.hours,
    required this.revenue,
  });
}

class ReadOnlySection extends StatelessWidget {
  final String title;
  final String message;
  final String actionHint;

  const ReadOnlySection({
    super.key,
    this.title = 'Read-Only Section',
    this.message = 'Happy New Year 2025! Your earnings data is set and managed by admin. Contact admin for any sales-related inquiries or discrepancies.',
    this.actionHint = 'Contact admin for any sales-related inquiries or discrepancies.',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFFFE0B2),
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(14.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Lock Icon
          Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFFD54F).withOpacity(0.3),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Icon(
                Icons.lock_outline,
                color: const Color(0xFFE65100),
                size: 18.sp,
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFE65100),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  actionHint,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFD84315),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}