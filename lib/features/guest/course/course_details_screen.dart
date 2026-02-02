import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/core/app_theme.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';
import 'package:sakeena/widgets/custom_button.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<bool> _expandedModules = [true, false, false, false, false];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
            // Tab Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    context.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                indicatorColor: AppTheme.primaryColor,
                labelColor: AppTheme.primaryColor,
                unselectedLabelColor: Colors.grey.shade600,
                labelStyle: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
                tabs: const [
                  Tab(text: 'Overview'),
                  Tab(text: 'Curriculum'),
                  Tab(text: 'Reviews'),
                ],
              ),
            ),
            // Tab Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Overview Tab
                  _buildOverviewTab(),
                  // Curriculum Tab
                  _buildCurriculumTab(),
                  // Reviews Tab
                  _buildReviewsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course Image with Play Button
          // Stack(
          //   children: [
          //     Image.network(
          //       'https://images.unsplash.com/photo-1506126613408-eca07ce68773?w=500&h=300&fit=crop',
          //       height: 250.h,
          //       width: double.infinity,
          //       fit: BoxFit.cover,
          //       errorBuilder: (context, error, stackTrace) {
          //         return Container(
          //           height: 250.h,
          //           color: Colors.grey.shade300,
          //         );
          //       },
          //     ),
          //     Center(
          //       child: Container(
          //         padding: EdgeInsets.all(12.w),
          //         decoration: BoxDecoration(
          //           color: AppTheme.primaryColor.withOpacity(0.9),
          //           shape: BoxShape.circle,
          //         ),
          //         child: Icon(
          //           Icons.play_arrow,
          //           color: Colors.white,
          //           size: 28.sp,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // Course Title and Description
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/quran_recite_image.png',
                height: 200.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Icon(
                Icons.play_circle_filled,
                size: 60.sp,
                color: Colors.white.withOpacity(0.8),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  '40 Days Towards Change \'Faith-centered emotional healing journey\'',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 12.h),
                // Description
                Text(
                  'This comprehensive healing program integrates Islamic spiritual practices with modern-based psychological approaches. Through 5 carefully designed modules over 6 weeks (40 Days), you will learn tools and insights to overcome stress, build emotional resilience, and cultivate lasting behavior change.\n\nThe course combines video lessons, guided exercises, daily routines, and community support to give you lasting healing healing and practical skills practices noted in Islamic teachings. Each session is 2 hours, designed to give you deep understanding and practical application.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 24.h),
                // What You'll Learn
                Text(
                  'What You\'ll Learn',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 12.h),
                ..._buildLearningOutcomes(),
                SizedBox(height: 24.h),
                // Course Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1506126613408-eca07ce68773?w=500&h=300&fit=crop',
                    height: 200.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200.h,
                        color: Colors.grey.shade300,
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                // Status Badge and Price
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.successColor,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        'Upcoming',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                // Title
                Text(
                  'Mindfulness in Islam',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 12.h),
                // Price and Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$99',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    CustomButton(
                      text: "Enrolled",
                      onPressed: () {},
                      height: 30.h,
                      width: 100.w,
                      isGradient: false,
                      isOutlined: true,
                      textColor: Colors.black,
                    ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.white,
                    //     side: BorderSide(color: Colors.grey.shade300),
                    //     padding: EdgeInsets.symmetric(
                    //       horizontal: 20.w,
                    //       vertical: 10.h,
                    //     ),
                    //   ),
                    //   child: Text(
                    //     'Enrolled',
                    //     style: TextStyle(
                    //       fontSize: 12.sp,
                    //       fontWeight: FontWeight.w600,
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurriculumTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Curriculum Header
            Text(
              'Course Curriculum',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '22 lessons • 3 weeks',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 16.h),
            // Modules
            ..._buildCurriculumModules(),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewsTab() {
    return Center(
      child: Text(
        'No reviews yet',
        style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
      ),
    );
  }

  List<Widget> _buildLearningOutcomes() {
    final outcomes = [
      'Understanding anxiety from both Islamic and psychological perspectives',
      'Integrate dhikr and mindfulness techniques for anxiety relief',
      'Apply cognitive behavioral strategies noted in Islamic teachings',
      'Build lasting emotional resilience through faith practices',
      'Recognizing triggers and developing coping mechanisms',
    ];

    return outcomes
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
        .toList();
  }

  List<Widget> _buildCurriculumModules() {
    final modules = [
      {
        'title': 'Module 1: Understanding Anxiety',
        'duration': '4 lessons • 52 min',
        'lessons': [
          'Introduction to the Course',
          'What is Anxiety?',
          'Islamic Perspective on Anxiety',
          'Types of Anxiety Disorders',
        ],
      },
      {
        'title': 'Module 2: Dhikr & Mindfulness',
        'duration': '4 lessons • 48 min',
        'lessons': [
          'Introduction to Dhikr',
          'Mindfulness Practices',
          'Combining Dhikr and Mindfulness',
        ],
      },
      {
        'title': 'Module 3: Cognitive Approaches',
        'duration': '4 lessons • 56 min',
        'lessons': [
          'Cognitive Behavioral Therapy Basics',
          'Identifying Negative Thoughts',
        ],
      },
      {
        'title': 'Module 4: Tawakkul & Trust',
        'duration': '5 lessons • 62 min',
        'lessons': ['Understanding Tawakkul', 'Building Trust in Allah'],
      },
      {
        'title': 'Module 5: Building Resilience',
        'duration': '3 lessons • 54 min',
        'lessons': ['Creating Resilience Plans', 'Long-term Strategies'],
      },
    ];

    return List.generate(
      modules.length,
      (index) => _buildModuleCard(
        index,
        modules[index]['title'] as String,
        modules[index]['duration'] as String,
        modules[index]['lessons'] as List<String>,
      ),
    );
  }

  Widget _buildModuleCard(
    int index,
    String title,
    String duration,
    List<String> lessons,
  ) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ExpansionTile(
        initiallyExpanded: _expandedModules[index],
        onExpansionChanged: (expanded) {
          setState(() {
            _expandedModules[index] = expanded;
          });
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              duration,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        children: lessons
            .map(
              (lesson) => Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.radio_button_unchecked,
                      size: 16.sp,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        lesson,
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
      ),
    );
  }
}



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
// }