import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/core/app_theme.dart';
import 'package:sakeena/features/guest/course/assignment_dialog.dart';
import 'package:sakeena/features/guest/course/quiz_result_dialog.dart';
import 'package:sakeena/features/guest/course/review_card.dart';
import 'package:sakeena/features/guest/course/review_dialog.dart';
import 'package:sakeena/features/guest/course/show_quiz_dialog_box.dart';
import 'package:sakeena/model/course_details_model.dart';
import 'package:sakeena/model/course_model.dart';
import 'package:sakeena/model/course_module_model.dart';
import 'package:sakeena/model/course_review_model.dart';
import 'package:sakeena/model/instructior_data_model.dart';
import 'package:sakeena/model/quiz_question_model.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';
import 'package:sakeena/widgets/custom_button.dart';
import 'package:sakeena/widgets/custom_text_field.dart';

extension CourseStatusExt on CourseStatus {
  String get label {
    switch (this) {
      case CourseStatus.upcoming:
        return 'Upcoming';
      case CourseStatus.live:
        return 'Live';
      case CourseStatus.recorded:
        return 'Recorded';
    }
  }

  Color get badgeColor {
    switch (this) {
      case CourseStatus.upcoming:
        return AppTheme.successColor; // Green
      case CourseStatus.live:
        return Colors.red; // Red for live
      case CourseStatus.recorded:
        return Colors.blue; // Blue for recorded
    }
  }
}

extension EnrollmentStatusExt on EnrollmentStatus {
  String get buttonLabel {
    switch (this) {
      case EnrollmentStatus.notEnrolled:
        return 'Register';
      case EnrollmentStatus.enrolled:
        return 'Enrolled';
      case EnrollmentStatus.completed:
        return 'Completed';
    }
  }

  bool get isOutlined {
    return this != EnrollmentStatus.notEnrolled;
  }

  bool get isGradient {
    return this == EnrollmentStatus.notEnrolled;
  }

  Color get textColor {
    switch (this) {
      case EnrollmentStatus.notEnrolled:
        return Colors.white;
      case EnrollmentStatus.enrolled:
        return Colors.black;
      case EnrollmentStatus.completed:
        return Colors.black;
    }
  }
}

class CourseLessonItem {
  final String title;
  final String duration;

  const CourseLessonItem({required this.title, required this.duration});
}

// ============ MAIN SCREEN ============
class CourseDetailScreen extends StatefulWidget {
  final CourseData courseData;

  const CourseDetailScreen({super.key, CourseData? courseData})
    : courseData =
          courseData ??
          const CourseData(
            reviews: [],
            title: '',
            imageAsset: '',
            price: '',
            courseStatus: CourseStatus.upcoming,
            enrollmentStatus: EnrollmentStatus.notEnrolled,
            description: '',
            outcomes: [],
            modules: [],
            courseDetails: CourseDetails(
              level: '',
              duration: '',
              lessons: 0,
              modules: 0,
            ),
            instructor: InstructorData(
              name: '',
              title: '',
              bio: '',
              studentCount: 0,
              courseCount: 0,
            ),
            requirements: [],
          );

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<bool> _expandedModules;
  late CourseData _courseData;

  @override
  void initState() {
    super.initState();
    _courseData = widget.courseData.title.isEmpty
        ? CourseData.mock()
        : widget.courseData;
    _tabController = TabController(length: 5, vsync: this);
    _expandedModules = List<bool>.filled(_courseData.modules.length, false);
    if (_courseData.modules.isNotEmpty) _expandedModules[0] = true;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildOverview(),
                  _buildCurriculum(),
                  _buildReviews(),
                  _buildCertificate(),
                  _buildScholarship(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() => Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          onPressed: context.pop,
          icon: const Icon(Icons.arrow_back),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
        ),
      ),
      Material(
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: AppTheme.primaryColor,
          labelColor: AppTheme.primaryColor,
          unselectedLabelColor: Colors.grey.shade600,
          labelStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Curriculum'),
            Tab(text: 'Reviews'),
            Tab(text: 'Certificate'),
            Tab(text: 'Scholarship'),
          ],
        ),
      ),
    ],
  );

  Widget _buildOverview() => SingleChildScrollView(
    padding: EdgeInsets.all(16.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageWithOverlay(),
        SizedBox(height: 16.h),
        _buildTitlePriceBadge(),
        SizedBox(height: 12.h),
        _buildShareButtons(),
        SizedBox(height: 16.h),
        _buildDivider(),
        SizedBox(height: 16.h),
        _buildDescriptionAndOutcomes(),
        SizedBox(height: 16.h),
        _buildDivider(),
        SizedBox(height: 16.h),
        _buildCourseDetailsCard(),
        SizedBox(height: 16.h),
        _buildDivider(),
        SizedBox(height: 16.h),
        _buildInstructorCard(),
        SizedBox(height: 16.h),
        _buildDivider(),
        SizedBox(height: 16.h),
        _buildRequirementsCard(),
        SizedBox(height: 16.h),
        _buildDivider(),
        SizedBox(height: 16.h),
        _buildCommunityChat(),
        SizedBox(height: 24.h),
      ],
    ),
  );

  Widget _buildImageWithOverlay() => Stack(
    alignment: Alignment.center,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.asset(
          _courseData.imageAsset,
          height: 200.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Icon(
        Icons.play_circle_filled,
        size: 56.sp,
        color: Colors.white.withOpacity(0.9),
      ),
    ],
  );

  Widget _buildTitlePriceBadge() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: _courseData.courseStatus.badgeColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          _courseData.courseStatus.label,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      SizedBox(height: 12.h),
      Text(
        _courseData.title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
      ),
      SizedBox(height: 16.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _courseData.price,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryColor,
            ),
          ),
          CustomButton(
            text: _courseData.enrollmentStatus.buttonLabel,
            onPressed: () {
              if (_courseData.enrollmentStatus ==
                  EnrollmentStatus.notEnrolled) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Registering for ${_courseData.title}'),
                  ),
                );
              }
            },
            height: 32.h,
            width: 110.w,
            isGradient: _courseData.enrollmentStatus.isGradient,
            isOutlined: _courseData.enrollmentStatus.isOutlined,
            textColor: _courseData.enrollmentStatus.textColor,
          ),
        ],
      ),
    ],
  );

  Widget _buildShareButtons() => Row(
    children: [
      Text(
        'Share this course',
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade700,
        ),
      ),
      SizedBox(width: 12.w),
      _buildShareIcon(Icons.facebook),
      SizedBox(width: 8.w),
      _buildShareIcon(Icons.facebook),
      SizedBox(width: 8.w),
      _buildShareIcon(Icons.share),
    ],
  );

  Widget _buildShareIcon(IconData icon) => Container(
    padding: EdgeInsets.all(6.w),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      shape: BoxShape.circle,
    ),
    child: Icon(icon, size: 16.sp, color: Colors.grey.shade600),
  );

  Widget _buildDescriptionAndOutcomes() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        _courseData.description,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade700,
          height: 1.6,
        ),
      ),
      SizedBox(height: 24.h),
      Text(
        'What You\'ll Learn',
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
      ),
      SizedBox(height: 12.h),
      ..._courseData.outcomes
          .map(
            (outcome) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.radio_button_unchecked,
                    size: 16.sp,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      outcome,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    ],
  );

  Widget _buildCourseDetailsCard() => Container(
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Course Details',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8.h),
        _buildDivider(),
        _buildDetailRow('Level', _courseData.courseDetails.level),
        _buildDivider(),
        _buildDetailRow('Duration', _courseData.courseDetails.duration),
        _buildDivider(),
        _buildDetailRow(
          'Lessons',
          _courseData.courseDetails.lessons.toString(),
        ),
        _buildDivider(),
        _buildDetailRow('Module', _courseData.courseDetails.modules.toString()),
      ],
    ),
  );

  Widget _buildDetailRow(String label, String value) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade600,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        child: Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );

  Widget _buildInstructorCard() => Container(
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Instructor',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 16.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(radius: 24.r, backgroundColor: Colors.grey.shade300),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _courseData.instructor.name,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _courseData.instructor.title,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          _courseData.instructor.bio,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade700,
            height: 1.5,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Icon(Icons.people, size: 16.sp, color: Colors.grey.shade600),
            SizedBox(width: 8.w),
            Text(
              '${_courseData.instructor.studentCount} students',
              style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade600),
            ),
            SizedBox(width: 16.w),
            Icon(
              Icons.video_camera_back,
              size: 16.sp,
              color: Colors.grey.shade600,
            ),
            SizedBox(width: 8.w),
            Text(
              '${_courseData.instructor.courseCount} courses',
              style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade600),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _buildRequirementsCard() => Container(
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Requirements',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 12.h),
        ..._courseData.requirements
            .map(
              (requirement) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 16.sp,
                      color: Colors.grey.shade600,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        requirement,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    ),
  );

  Widget _buildCommunityChat() => Container(
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: AppTheme.primaryColor.withOpacity(0.08),
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: AppTheme.primaryColor.withOpacity(0.2)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.forum, size: 20.sp, color: AppTheme.primaryColor),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Community Chat',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        '24 online',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          'Connect with others on the same healing journey',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade700,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, size: 16.sp, color: Colors.grey.shade600),
                SizedBox(width: 8.w),
                Text(
                  'Available after purchase',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildDivider() => Divider(color: Colors.grey.shade200, height: 1.h);

  Widget _buildCurriculum() => SingleChildScrollView(
    padding: EdgeInsets.all(16.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Course Curriculum',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8.h),
        Text(
          '${_courseData.modules.fold(0, (sum, m) => sum + m.lessons.length)} lessons • 3 weeks',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: 16.h),
        ..._courseData.modules
            .asMap()
            .entries
            .map((e) => _buildModuleCard(e.key, e.value))
            .toList(),
      ],
    ),
  );

  Widget _buildModuleCard(int index, CourseModule module) => Card(
    margin: EdgeInsets.only(bottom: 12.h),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.r),
      side: BorderSide(color: Colors.grey.shade200),
    ),
    child: ExpansionTile(
      initiallyExpanded: _expandedModules[index],
      onExpansionChanged: (expanded) =>
          setState(() => _expandedModules[index] = expanded),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            module.title.replaceAll('Module ', 'Module '),
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 4.h),
          Text(
            module.duration,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
      children: [
        // Lessons
        ...module.lessons.map(
          (lesson) => Padding(
            padding: EdgeInsets.fromLTRB(24.w, 10.h, 16.w, 10.h),
            child: Row(
              children: [
                Icon(
                  Icons.circle_outlined,
                  size: 16.sp,
                  color: Colors.grey.shade500,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    lesson.title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                Text(
                  lesson.duration,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),

        // ── QUIZ SECTION ──
        if (module.quiz != null && module.quiz!.isNotEmpty)
          buildSubSectionTile(
            title: 'Quiz',
            icon: Icons.quiz_outlined,
            iconColor: Colors.grey,
            hasContent: true,
            onTap: () => showQuizDialog(context, module.title, module.quiz!),
          ),

        // ── ASSIGNMENT SECTION ──
        if (module.assignmentDescription != null &&
            module.assignmentDescription!.isNotEmpty)
          buildSubSectionTile(
            title: 'Assignment',
            icon: Icons.description_outlined,
            iconColor: Colors.grey,
            hasContent: true,
            onTap: () => showAssignmentDialog(
              context,
              module.title,
              module.assignmentDescription!,
            ),
          ),
      ],
    ),
  );

  Widget _buildReviews() => SingleChildScrollView(
    padding: EdgeInsets.all(16.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '4.7',
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.star, color: Colors.amber, size: 28.sp),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                '(245 reviews)',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),
        ..._courseData.reviews.map((review) => buildReviewCard(review)),

        SizedBox(height: 32.h),
        Center(
          child: CustomButton(
            text: 'Write Review',
            onPressed: () => showWriteReviewDialog(context),
            height: 52.h,
            width: 220.w,
            isGradient: true,
            textColor: Colors.white,
          ),
        ),

        SizedBox(height: 40.h),
      ],
    ),
  );

  Widget _buildCertificate() => SingleChildScrollView(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
    child: Column(
      children: [
        SizedBox(height: 40.h),

        Container(
          width: double.infinity,
          constraints: BoxConstraints(maxWidth: 500.w),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SvgPicture.asset(
                    'assets/images/certificate_part.svg',
                    fit: BoxFit.cover,
                  ),
                  // Positioned button...
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),

        Positioned(
          bottom: 20.h,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomButton(
              text: 'Download Certificate',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Certificate download started...'),
                  ),
                );
              },
              height: 52.h,
              width: double.infinity,
              isGradient: true,
              textColor: Colors.white,
            ),
          ),
        ),

        SizedBox(height: 24.h),

        Text(
          "Download in PDF format and share with others",
          style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 40.h),
      ],
    ),
  );


  Widget _buildScholarship() {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final addressController = TextEditingController();
    String? selectedLevel = 'High School';

    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          Text(
            "APPLY NOW FOR OUR EDUCATION SUPPORT SCHOLARSHIP.",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C7A7B),
            ),
          ),
          SizedBox(height: 28.h),

          CustomTextField(
            controller: nameController,
            labelText: "Name*",
            hintText: "Full Name",
          ),
          SizedBox(height: 16.h),

          CustomTextField(
            controller: emailController,
            labelText: "Email*",
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16.h),

          CustomTextField(
            controller: phoneController,
            labelText: "Phone Number",
            hintText: "Phone Number",
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 16.h),

          CustomTextField(
            controller: addressController,
            labelText: "Address",
            hintText: "City/Country",
          ),
          SizedBox(height: 24.h),

          Text(
            "Current Level of Study",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: DropdownButton<String>(
              value: selectedLevel,
              isExpanded: true,
              underline: const SizedBox(),
              items: const [
                DropdownMenuItem(
                  value: "High School",
                  child: Text("High School"),
                ),
                DropdownMenuItem(
                  value: "Undergraduate",
                  child: Text("Undergraduate"),
                ),
                DropdownMenuItem(
                  value: "Postgraduate",
                  child: Text("Postgraduate"),
                ),
                DropdownMenuItem(value: "Other", child: Text("Other")),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedLevel = value);
                }
              },
            ),
          ),

          SizedBox(height: 24.h),

          CustomTextField(
            labelText: "Field of Study / Major",
            hintText: "Provide Qualifications and Interests in Detail",
            // maxLength:3, // Note: your CustomTextField supports maxLines via TextFormField
          ),

          SizedBox(height: 24.h),

          Text(
            "Why are you applying for this scholarship?",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8.h),
          CustomTextField(
            hintText:
                "Write a brief explanation of your need and motivation...",
            // maxLength: 4,
          ),

          SizedBox(height: 24.h),

          Text(
            "How will this scholarship help you achieve your goals?",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8.h),
          CustomTextField(
            hintText: "Explain your career goals and how this support helps...",
            // maxLength: 4,
          ),

          SizedBox(height: 24.h),

          Text(
            "Upload Personal Statement or Motivation Letter",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8.h),
          GestureDetector(
            onTap: () {
              // TODO: file picker logic
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.attach_file, color: const Color(0xFF2C7A7B)),
                  SizedBox(width: 12.w),
                  Text(
                    "Choose File",
                    style: TextStyle(
                      color: const Color(0xFF2C7A7B),
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16.h),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(value: false, onChanged: (v) {}),
              Expanded(
                child: Text(
                  "I agree to be contacted for further discussion and opportunities.",
                  style: TextStyle(fontSize: 13.sp, height: 1.4),
                ),
              ),
            ],
          ),

          SizedBox(height: 40.h),

          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Cancel',
                  onPressed: () {
                  },
                  isOutlined: true,
                  height: 52.h,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: CustomButton(
                  text: 'Send Application',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Application submitted (demo mode)'),
                      ),
                    );
                  },
                  isGradient: true,
                  height: 52.h,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),

          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sakeena/core/app_theme.dart';
// import 'package:sakeena/widgets/custom_app_bar.dart';
// import 'package:sakeena/widgets/custom_button.dart';

// class CourseDetailScreen extends StatefulWidget {
//   const CourseDetailScreen({super.key});

//   @override
//   State<CourseDetailScreen> createState() => _CourseDetailScreenState();
// }

// class _CourseDetailScreenState extends State<CourseDetailScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final List<bool> _expandedModules = [true, false, false, false, false];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Tab Bar
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     context.pop(context);
//                   },
//                   icon: Icon(Icons.arrow_back),
//                 ),
//               ],
//             ),
//             Container(
//               color: Colors.white,
//               child: TabBar(
//                 controller: _tabController,
//                 indicatorColor: AppTheme.primaryColor,
//                 labelColor: AppTheme.primaryColor,
//                 unselectedLabelColor: Colors.grey.shade600,
//                 labelStyle: TextStyle(
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 unselectedLabelStyle: TextStyle(
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 tabs: const [
//                   Tab(text: 'Overview'),
//                   Tab(text: 'Curriculum'),
//                   Tab(text: 'Reviews'),
//                 ],
//               ),
//             ),
//             // Tab Content
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   // Overview Tab
//                   _buildOverviewTab(),
//                   // Curriculum Tab
//                   _buildCurriculumTab(),
//                   // Reviews Tab
//                   _buildReviewsTab(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildOverviewTab() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Course Image with Play Button
//           // Stack(
//           //   children: [
//           //     Image.network(
//           //       'https://images.unsplash.com/photo-1506126613408-eca07ce68773?w=500&h=300&fit=crop',
//           //       height: 250.h,
//           //       width: double.infinity,
//           //       fit: BoxFit.cover,
//           //       errorBuilder: (context, error, stackTrace) {
//           //         return Container(
//           //           height: 250.h,
//           //           color: Colors.grey.shade300,
//           //         );
//           //       },
//           //     ),
//           //     Center(
//           //       child: Container(
//           //         padding: EdgeInsets.all(12.w),
//           //         decoration: BoxDecoration(
//           //           color: AppTheme.primaryColor.withOpacity(0.9),
//           //           shape: BoxShape.circle,
//           //         ),
//           //         child: Icon(
//           //           Icons.play_arrow,
//           //           color: Colors.white,
//           //           size: 28.sp,
//           //         ),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           // Course Title and Description
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Image.asset(
//                 'assets/images/quran_recite_image.png',
//                 height: 200.h,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//               Icon(
//                 Icons.play_circle_filled,
//                 size: 60.sp,
//                 color: Colors.white.withOpacity(0.8),
//               ),
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.all(16.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Title
//                 Text(
//                   '40 Days Towards Change \'Faith-centered emotional healing journey\'',
//                   style: TextStyle(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 12.h),
//                 // Description
//                 Text(
//                   'This comprehensive healing program integrates Islamic spiritual practices with modern-based psychological approaches. Through 5 carefully designed modules over 6 weeks (40 Days), you will learn tools and insights to overcome stress, build emotional resilience, and cultivate lasting behavior change.\n\nThe course combines video lessons, guided exercises, daily routines, and community support to give you lasting healing healing and practical skills practices noted in Islamic teachings. Each session is 2 hours, designed to give you deep understanding and practical application.',
//                   style: TextStyle(
//                     fontSize: 12.sp,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.grey.shade700,
//                     height: 1.6,
//                   ),
//                 ),
//                 SizedBox(height: 24.h),
//                 // What You'll Learn
//                 Text(
//                   'What You\'ll Learn',
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 12.h),
//                 ..._buildLearningOutcomes(),
//                 SizedBox(height: 24.h),
//                 // Course Image
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8.r),
//                   child: Image.network(
//                     'https://images.unsplash.com/photo-1506126613408-eca07ce68773?w=500&h=300&fit=crop',
//                     height: 200.h,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Container(
//                         height: 200.h,
//                         color: Colors.grey.shade300,
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 16.h),
//                 // Status Badge and Price
//                 Row(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 12.w,
//                         vertical: 6.h,
//                       ),
//                       decoration: BoxDecoration(
//                         color: AppTheme.successColor,
//                         borderRadius: BorderRadius.circular(16.r),
//                       ),
//                       child: Text(
//                         'Upcoming',
//                         style: TextStyle(
//                           fontSize: 11.sp,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 12.h),
//                 // Title
//                 Text(
//                   'Mindfulness in Islam',
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 12.h),
//                 // Price and Button
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '\$99',
//                       style: TextStyle(
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w700,
//                         color: AppTheme.primaryColor,
//                       ),
//                     ),
//                     CustomButton(
//                       text: "Enrolled",
//                       onPressed: () {},
//                       height: 30.h,
//                       width: 100.w,
//                       isGradient: false,
//                       isOutlined: true,
//                       textColor: Colors.black,
//                     ),
//                     // ElevatedButton(
//                     //   onPressed: () {},
//                     //   style: ElevatedButton.styleFrom(
//                     //     backgroundColor: Colors.white,
//                     //     side: BorderSide(color: Colors.grey.shade300),
//                     //     padding: EdgeInsets.symmetric(
//                     //       horizontal: 20.w,
//                     //       vertical: 10.h,
//                     //     ),
//                     //   ),
//                     //   child: Text(
//                     //     'Enrolled',
//                     //     style: TextStyle(
//                     //       fontSize: 12.sp,
//                     //       fontWeight: FontWeight.w600,
//                     //       color: Colors.black,
//                     //     ),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCurriculumTab() {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.all(16.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Course Curriculum Header
//             Text(
//               'Course Curriculum',
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: 8.h),
//             Text(
//               '22 lessons • 3 weeks',
//               style: TextStyle(
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.grey.shade600,
//               ),
//             ),
//             SizedBox(height: 16.h),
//             // Modules
//             ..._buildCurriculumModules(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildReviewsTab() {
//     return Center(
//       child: Text(
//         'No reviews yet',
//         style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
//       ),
//     );
//   }

//   List<Widget> _buildLearningOutcomes() {
//     final outcomes = [
//       'Understanding anxiety from both Islamic and psychological perspectives',
//       'Integrate dhikr and mindfulness techniques for anxiety relief',
//       'Apply cognitive behavioral strategies noted in Islamic teachings',
//       'Build lasting emotional resilience through faith practices',
//       'Recognizing triggers and developing coping mechanisms',
//     ];

//     return outcomes
//         .map(
//           (outcome) => Padding(
//             padding: EdgeInsets.only(bottom: 12.h),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Icon(
//                   Icons.radio_button_unchecked,
//                   size: 16.sp,
//                   color: Colors.grey.shade600,
//                 ),
//                 SizedBox(width: 12.w),
//                 Expanded(
//                   child: Text(
//                     outcome,
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.grey.shade700,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//         .toList();
//   }

//   List<Widget> _buildCurriculumModules() {
//     final modules = [
//       {
//         'title': 'Module 1: Understanding Anxiety',
//         'duration': '4 lessons • 52 min',
//         'lessons': [
//           'Introduction to the Course',
//           'What is Anxiety?',
//           'Islamic Perspective on Anxiety',
//           'Types of Anxiety Disorders',
//         ],
//       },
//       {
//         'title': 'Module 2: Dhikr & Mindfulness',
//         'duration': '4 lessons • 48 min',
//         'lessons': [
//           'Introduction to Dhikr',
//           'Mindfulness Practices',
//           'Combining Dhikr and Mindfulness',
//         ],
//       },
//       {
//         'title': 'Module 3: Cognitive Approaches',
//         'duration': '4 lessons • 56 min',
//         'lessons': [
//           'Cognitive Behavioral Therapy Basics',
//           'Identifying Negative Thoughts',
//         ],
//       },
//       {
//         'title': 'Module 4: Tawakkul & Trust',
//         'duration': '5 lessons • 62 min',
//         'lessons': ['Understanding Tawakkul', 'Building Trust in Allah'],
//       },
//       {
//         'title': 'Module 5: Building Resilience',
//         'duration': '3 lessons • 54 min',
//         'lessons': ['Creating Resilience Plans', 'Long-term Strategies'],
//       },
//     ];

//     return List.generate(
//       modules.length,
//       (index) => _buildModuleCard(
//         index,
//         modules[index]['title'] as String,
//         modules[index]['duration'] as String,
//         modules[index]['lessons'] as List<String>,
//       ),
//     );
//   }

//   Widget _buildModuleCard(
//     int index,
//     String title,
//     String duration,
//     List<String> lessons,
//   ) {
//     return Card(
//       margin: EdgeInsets.only(bottom: 12.h),
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8.r),
//         side: BorderSide(color: Colors.grey.shade200),
//       ),
//       child: ExpansionTile(
//         initiallyExpanded: _expandedModules[index],
//         onExpansionChanged: (expanded) {
//           setState(() {
//             _expandedModules[index] = expanded;
//           });
//         },
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: 4.h),
//             Text(
//               duration,
//               style: TextStyle(
//                 fontSize: 11.sp,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.grey.shade600,
//               ),
//             ),
//           ],
//         ),
//         children: lessons
//             .map(
//               (lesson) => Padding(
//                 padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.radio_button_unchecked,
//                       size: 16.sp,
//                       color: Colors.grey.shade400,
//                     ),
//                     SizedBox(width: 12.w),
//                     Expanded(
//                       child: Text(
//                         lesson,
//                         style: TextStyle(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.grey.shade700,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sakeena/widgets/custom_button.dart';

// // Reusable Widgets

// // 1. Reusable Chip (for "Upcoming", "Beginner", etc.)
// class CourseChip extends StatelessWidget {
//   final String text;
//   final Color backgroundColor;
//   final Color textColor;

//   const CourseChip({
//     super.key,
//     required this.text,
//     this.backgroundColor = Colors.green,
//     this.textColor = Colors.white,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(20.r),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w600,
//           color: textColor,
//         ),
//       ),
//     );
//   }
// }

// // 2. Reusable Expandable Module (for curriculum accordions)
// class ExpandableModule extends StatefulWidget {
//   final String title;
//   final List<Map<String, String>> lessons; // Each lesson: {'name': 'Introduction', 'duration': '3:30'}

//   const ExpandableModule({
//     super.key,
//     required this.title,
//     required this.lessons,
//   });

//   @override
//   State<ExpandableModule> createState() => _ExpandableModuleState();
// }

// class _ExpandableModuleState extends State<ExpandableModule> {
//   bool _isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 12.h),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade200,
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: ExpansionPanelList(
//         expandedHeaderPadding: EdgeInsets.zero,
//         expansionCallback: (int index, bool isExpanded) {
//           setState(() => _isExpanded = !isExpanded);
//         },
//         children: [
//           ExpansionPanel(
//             isExpanded: _isExpanded,
//             headerBuilder: (context, isExpanded) {
//               return ListTile(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//                 title: Text(
//                   widget.title,
//                   style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
//                 ),
//                 trailing: Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
//               );
//             },
//             body: Column(
//               children: widget.lessons.map((lesson) {
//                 return ListTile(
//                   contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 4.h),
//                   title: Text(
//                     lesson['name'] ?? '',
//                     style: TextStyle(fontSize: 14.sp),
//                   ),
//                   trailing: Text(
//                     lesson['duration'] ?? '',
//                     style: TextStyle(fontSize: 12.sp, color: Colors.grey),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // 3. Reusable Bullet Point (for "What you'll learn" or requirements)
// class BulletPoint extends StatelessWidget {
//   final String text;

//   const BulletPoint({super.key, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 8.h),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(Icons.circle, size: 8.sp, color: const Color(0xFF2C7A7B)),
//           SizedBox(width: 8.w),
//           Expanded(
//             child: Text(
//               text,
//               style: TextStyle(fontSize: 14.sp, color: Colors.black87),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // 4. Reusable Course Instructor Card
// class InstructorCard extends StatelessWidget {
//   final String name;
//   final String date;
//   final String review;
//   final double rating;

//   const InstructorCard({
//     super.key,
//     required this.name,
//     required this.date,
//     required this.review,
//     required this.rating,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade200,
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   name,
//                   style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
//                 ),
//               ),
//               Text(
//                 date,
//                 style: TextStyle(fontSize: 12.sp, color: Colors.grey),
//               ),
//             ],
//           ),
//           SizedBox(height: 4.h),
//           Row(
//             children: List.generate(5, (index) {
//               return Icon(
//                 index < rating ? Icons.star : Icons.star_border,
//                 size: 16.sp,
//                 color: Colors.amber,
//               );
//             }),
//           ),
//           SizedBox(height: 8.h),
//           Text(
//             review,
//             style: TextStyle(fontSize: 13.sp, color: Colors.black87),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Main Course Details Page
// class CourseDetailsPage extends StatefulWidget {
//   const CourseDetailsPage({super.key});

//   @override
//   State<CourseDetailsPage> createState() => _CourseDetailsPageState();
// }

// class _CourseDetailsPageState extends State<CourseDetailsPage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade50,

//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leadingWidth: 80.w,
//         leading: Padding(
//           padding: EdgeInsets.only(left: 16.w, bottom: 10.h),
//           child: SvgPicture.asset(
//             'assets/images/sakeena_logo.svg',
//             width: 42.w,
//             height: 42.h,
//             fit: BoxFit.contain,
//           ),
//         ),
//         centerTitle: true,
//         bottom: TabBar(
//           controller: _tabController,
//           labelColor: const Color(0xFF2C7A7B),
//           unselectedLabelColor: Colors.grey,
//           indicatorColor: const Color(0xFF2C7A7B),
//           tabs: const [
//             Tab(text: 'Course Curriculum'),
//             Tab(text: 'Course Overview'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: const [
//           // Tab 1: Curriculum
//           CurriculumTab(),
//           // Tab 2: Overview
//           OverviewTab(),
//         ],
//       ),
//     );
//   }
// }

// // Tab 1: Course Curriculum Tab
// class CurriculumTab extends StatelessWidget {
//   const CurriculumTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // Hero Image + Play Button
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Image.asset(
//                 'assets/images/quran_recite_image.png', 
//                 height: 200.h,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//               Icon(
//                 Icons.play_circle_filled,
//                 size: 60.sp,
//                 color: Colors.white.withOpacity(0.8),
//               ),
//             ],
//           ),

//           Padding(
//             padding: EdgeInsets.all(16.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Course Title
//                 Text(
//                   'Mindfulness in Islam',
//                   style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
//                 ),

//                 SizedBox(height: 8.h),

//                 // Upcoming Chip
//                 const CourseChip(text: 'Upcoming', backgroundColor: Colors.green),

//                 SizedBox(height: 12.h),

//                 // Price + Enrolled Button
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '\$99',
//                       style: TextStyle(
//                         fontSize: 24.sp,
//                         fontWeight: FontWeight.bold,
//                         color: const Color(0xFF2C7A7B),
//                       ),
//                     ),
//                     CustomButton(
//                       text: 'Enrolled',
//                       width: 100.w,
//                       height: 36.h,
//                       isGradient: false,
//                       isOutlined: true,
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 16.h),

//                 // Share this course
//                 Row(
//                   children: [
//                     Text(
//                       'Share this course',
//                       style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
//                     ),
//                     SizedBox(width: 12.w),
//                     Icon(Icons.facebook, color: Colors.blue, size: 24.sp),
//                     SizedBox(width: 12.w),
//                     Icon(Icons.whatshot, color: Colors.green, size: 24.sp), // WhatsApp icon
//                     SizedBox(width: 12.w),
//                     Icon(Icons.facebook, color: Colors.black, size: 24.sp), // X/Twitter
//                   ],
//                 ),

//                 SizedBox(height: 24.h),

//                 // Curriculum Modules
//                 Text(
//                   'Course Curriculum',
//                   style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(height: 12.h),
//                 const ExpandableModule(
//                   title: 'Module 1: Understanding Anxiety',
//                   lessons: [
//                     {'name': 'Introduction to the Course', 'duration': '3:30'},
//                     {'name': 'What is Anxiety?', 'duration': '12:16'},
//                     {'name': 'Islamic Perspective on Anxiety', 'duration': '19:28'},
//                     {'name': 'Types of Anxiety Disorders', 'duration': '11:30'},
//                   ],
//                 ),
//                 const ExpandableModule(
//                   title: 'Module 2: Dhikr & Mindfulness',
//                   lessons: [
//                     {'name': 'Dhikr Basics', 'duration': '8:45'},
//                     {'name': 'Daily Practice', 'duration': '15:20'},
//                   ],
//                 ),
//                 const ExpandableModule(
//                   title: 'Module 3: Cognitive Approaches',
//                   lessons: [
//                     {'name': 'Thought Challenging', 'duration': '14:50'},
//                   ],
//                 ),
//                 const ExpandableModule(
//                   title: 'Module 4: Tawakkul & Trust',
//                   lessons: [
//                     {'name': 'Building Resilience', 'duration': '13:45'},
//                   ],
//                 ),
//                 // Add more modules as needed
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Tab 2: Course Overview Tab
// class OverviewTab extends StatelessWidget {
//   const OverviewTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // Hero Image + Play Button
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Image.asset(
//                 'assets/images/quran_recite_image.png', // your course image
//                 height: 200.h,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//               Icon(
//                 Icons.play_circle_filled,
//                 size: 60.sp,
//                 color: Colors.white.withOpacity(0.8),
//               ),
//             ],
//           ),

//           Padding(
//             padding: EdgeInsets.all(16.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Course Title
//                 Text(
//                   'Mindfulness in Islam',
//                   style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
//                 ),

//                 SizedBox(height: 12.h),

//                 // Price + Register Button
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '\$99',
//                       style: TextStyle(
//                         fontSize: 24.sp,
//                         fontWeight: FontWeight.bold,
//                         color: const Color(0xFF2C7A7B),
//                       ),
//                     ),
//                     CustomButton(
//                       text: 'Register',
//                       width: 120.w,
//                       height: 40.h,
//                       isGradient: true,
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 16.h),

//                 // Description
//                 Text(
//                   'In this transformative course, you\'ll learn...',
//                   style: TextStyle(fontSize: 14.sp, color: Colors.black87),
//                 ),

//                 SizedBox(height: 24.h),

//                 // What You'll Learn
//                 Text(
//                   'What You\'ll Learn',
//                   style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(height: 12.h),
//                 const BulletPoint(text: 'Understand anxiety from an Islamic perspective'),
//                 const BulletPoint(text: 'Practice dhikr for mindfulness'),
//                 const BulletPoint(text: 'Apply cognitive techniques rooted in faith'),

//                 SizedBox(height: 24.h),

//                 // Course Details
//                 Text(
//                   'Course Details',
//                   style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(height: 12.h),
//                 const BulletPoint(text: 'Level: Beginner'),
//                 const BulletPoint(text: 'Lessons: 22 lessons'),
//                 const BulletPoint(text: 'Duration: 3 weeks'),

//                 SizedBox(height: 24.h),

//                 // Requirements
//                 Text(
//                   'Requirements',
//                   style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(height: 12.h),
//                 const BulletPoint(text: 'Open mind and willingness to learn'),
//                 const BulletPoint(text: 'Notebook for exercises'),
//                 const BulletPoint(text: 'Commitment to daily practice'),

//                 SizedBox(height: 24.h),

//                 // Community Chat
//                 Container(
//                   padding: EdgeInsets.all(16.w),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade100,
//                     borderRadius: BorderRadius.circular(16.r),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.chat_bubble_outline, color: const Color(0xFF2C7A7B), size: 24.sp),
//                       SizedBox(width: 12.w),
//                       Expanded(
//                         child: Text(
//                           'Community Chat Available\nJoin the discussion with fellow students',
//                           style: TextStyle(fontSize: 14.sp, color: Colors.black87),
//                         ),
//                       ),
//                       CustomButton(
//                         text: 'Purchase',
//                         width: 100.w,
//                         height: 36.h,
//                         isGradient: true,
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ),

//                 SizedBox(height: 24.h),

//                 // Instructor Reviews
//                 Text(
//                   'Instructor Reviews',
//                   style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(height: 12.h),
//                 const InstructorCard(
//                   name: 'Fatima Ahmed',
//                   date: 'Jan 2024',
//                   review: 'The course completely changed my perspective on anxiety. Combining psychology with Islamic teachings was brilliant!',
//                   rating: 5.0,
//                 ),
//                 SizedBox(height: 12.h),
//                 const InstructorCard(
//                   name: 'Ahmed Khan',
//                   date: 'Feb 2024',
//                   review: 'Practical and spiritual. Highly recommended for anyone struggling with stress.',
//                   rating: 4.5,
//                 ),
//                 // Add more reviews as needed
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }