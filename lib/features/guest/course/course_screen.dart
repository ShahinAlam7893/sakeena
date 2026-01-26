import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/course_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  String selectedCategory = 'All';
  String selectedCourseType = 'All';

  @override
  Widget build(BuildContext context) {
    const categories = ['All', 'Mental Health', 'Spiritual Growth'];
    const courseTypes = ['All', 'Live', 'Recorded'];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 80.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w, bottom: 10.h),
          child: SvgPicture.asset(
            'assets/images/sakeena_logo.svg',
            width: 42.w,
            height: 42.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF7AA4A5), Color(0xFF205A60)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0x33FFFFFF),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: Colors.white70),
                    ),
                    child: Text(
                      'Explore Our Courses',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  SizedBox(height: 14.h),

                  // Title
                  Text(
                    'Learn, Grow, Heal',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Arimo",
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  // Subtitle
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Discover courses that integrate Islamic wisdom with modern psychology',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontFamily: 'Arimo',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ),

                  SizedBox(height: 18.h),

                  // Search Field
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 13.sp,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white.withOpacity(0.8),
                        size: 20.sp,
                      ),
                      filled: true,
                      fillColor: Color(0x1AFFFFFF),
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Filter
                  FilterSection(
                    title: 'Category',
                    items: categories,
                    selectedItem: selectedCategory,
                    onSelected: (v) => setState(() => selectedCategory = v),
                    isHorizontal: true,
                  ),
                  SizedBox(height: 20.h),

                  // Course Type Filter
                  FilterSection(
                    title: 'Course Type',
                    items: courseTypes,
                    selectedItem: selectedCourseType,
                    onSelected: (v) => setState(() => selectedCourseType = v),
                    isHorizontal: true,
                  ),
                  SizedBox(height: 24.h),

                  // Courses
                  Column(
                    children: [
                      _CenteredCourseCard(
                        child: CourseCard(
                          title: 'Mindfulness in Islam',
                          instructor: 'Sheikh Omar Ibrahim',
                          lessons: 24,
                          price: '\$99',
                          imageUrl: 'assets/images/quran_recite_image.png',
                          category: 'Mental Health',
                          weeks: 12,
                          totalHours: 18,
                          hoursPerSession: 1.5,
                          onViewDetails: () {},
                        ),
                      ),
                      SizedBox(height: 16.h),
                      _CenteredCourseCard(
                        child: CourseCard(
                          title: 'Islamic Psychology Basics',
                          instructor: 'Dr. Aisha Khan',
                          lessons: 16,
                          price: '\$79',
                          imageUrl: 'assets/images/quran_image.png',
                          category: 'Spiritual Growth',
                          weeks: 8,
                          totalHours: 8,
                          hoursPerSession: 1.0,
                          onViewDetails: () {},
                        ),
                      ),
                      SizedBox(height: 16.h),
                      _CenteredCourseCard(
                        child: CourseCard(
                          title: 'Quran & Mental Wellness',
                          instructor: 'Prof. Ahmed Hassan',
                          lessons: 20,
                          price: '\$89',
                          imageUrl: 'assets/images/quran_recite_image.png',
                          category: 'Mental Health',
                          weeks: 10,
                          totalHours: 12.5,
                          hoursPerSession: 1.25,
                          onViewDetails: () {},
                        ),
                      ),
                    ],
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

// ------------------ Filter Section ------------------

class FilterSection extends StatelessWidget {
  final String title;
  final List<String> items;
  final String selectedItem;
  final Function(String) onSelected;
  final bool isHorizontal;

  const FilterSection({
    super.key,
    required this.title,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);

    final buttons = items.map((item) {
      final isSelected = selectedItem == item;
      return Padding(
        padding: EdgeInsets.only(right: 8.w),
        child: GestureDetector(
          onTap: () => onSelected(item),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isSelected ? teal : Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: isSelected ? teal : Colors.grey.shade400,
              ),
            ),
            child: Center(
              child: Text(
                item,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: buttons),
        ),
      ],
    );
  }
}

// ------------------ Centered Course Card ------------------

class _CenteredCourseCard extends StatelessWidget {
  final Widget child;

  const _CenteredCourseCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(width: 0.95.sw, child: child),
    );
  }
}
