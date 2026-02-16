import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/features/teachers/submission/presentation/providers/submission_provider.dart';
import 'package:sakeena/features/teachers/submission/widgets/assignment_section_widget.dart';
import 'package:sakeena/features/teachers/submission/widgets/quiz_card.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';

class SubmissionManagementPage extends StatefulWidget {
  const SubmissionManagementPage({super.key});

  @override
  State<SubmissionManagementPage> createState() =>
      _SubmissionManagementPageState();
}

class _SubmissionManagementPageState extends State<SubmissionManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Future.microtask(() {
      context.read<SubmissionProvider>().loadAllSubmissions();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBackButton: true, onBack: () => context.pop()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Text(
              "Submission Management",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
          ),

          // Simple filter chips / tabs
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: const Color(0xFF205A60),
              unselectedLabelColor: Colors.grey[600],
              indicatorColor: const Color(0xFF3B8F97),
              tabs: const [
                Tab(text: "Assignments"),
                Tab(text: "Quizzes"),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search by student name or title...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
            ),
          ),

          SizedBox(height: 16.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "Advanced React Patterns",
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF205A60),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          Expanded(
            child: Consumer<SubmissionProvider>(
              builder: (context, provider, _) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (provider.error != null) {
                  return Center(child: Text(provider.error!));
                }

                return TabBarView(
                  controller: _tabController,
                  children: [
                    // Assignments tab
                    _buildAssignmentList(provider),

                    // Quizzes tab
                    _buildQuizList(provider),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignmentList(SubmissionProvider provider) {
    if (provider.assignmentGroups.isEmpty) {
      return const Center(child: Text("No assignment submissions yet"));
    }
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemCount: provider.assignmentGroups.length,
      itemBuilder: (context, index) {
        final group = provider.assignmentGroups[index];
        return AssignmentGroupSection(group: group);
      },
    );
  }

  Widget _buildQuizList(SubmissionProvider provider) {
    if (provider.quizSubmissions.isEmpty) {
      return const Center(child: Text("No quiz submissions yet"));
    }
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemCount: provider.quizSubmissions.length,
      itemBuilder: (context, index) {
        final quiz = provider.quizSubmissions[index];
        return QuizCard(quiz: quiz);
      },
    );
  }
}
