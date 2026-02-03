import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/features/guest/course/course_screen.dart';
import 'package:sakeena/widgets/book_card.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';
import 'package:sakeena/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/widgets/book_card.dart';
import 'package:sakeena/widgets/custom_button.dart';
import 'package:sakeena/widgets/filter_section.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  String selectedCategory = 'All';

  final categories = ['All', 'Mental Health', 'Spiritual Growth'];

  final books = [
    {
      'title': 'Healing the Anxious Heart',
      'author': 'Dr. Sarah Ahmed',
      'price': '\$99',
      'image': 'assets/images/book_image.png',
      'tag': 'Both',
      'tagColor': Colors.green,
    },
    {
      'title': 'Peace Movements in Islam',
      'author': 'Sheikh Hassan',
      'price': '\$99',
      'image': 'assets/images/book_two.png',
      'tag': 'eBook',
      'tagColor': Colors.blue,
    },
    {
      'title': 'Islamic Counseling Guide',
      'author': 'Dr. Fatima Rahman',
      'price': '\$89',
      'image': 'assets/images/book_three.png',
      'tag': 'Physical',
      'tagColor': Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                        Text(
                          'Books & Publications',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Discover curated Islamic and psychology books',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade600,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              // Filter Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    FilterSection(
                      title: 'Category',
                      items: categories,
                      selectedItem: selectedCategory,
                      onSelected: (value) =>
                          setState(() => selectedCategory = value),
                      isHorizontal: true,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // Books List
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: books.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map book = entry.value;

                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index == books.length - 1 ? 0 : 16.h,
                      ),
                      child: _CenteredBookCard(
                        child: BookCard(
                          title: book['title'] as String,
                          author: book['author'] as String,
                          price: book['price'] as String,
                          imagePath: book['image'] as String,
                          tagText: book['tag'] as String,
                          tagColor: book['tagColor'] as Color,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: 20.h),

              // View All Button
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16.w),
              //   child: CustomButton(
              //     text: 'View all',
              //     onPressed: () {},
              //     isGradient: true,
              //     textColor: Colors.white,
              //   ),
              // ),

              // SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------ Centered Book Card ------------------

class _CenteredBookCard extends StatelessWidget {
  final Widget child;

  const _CenteredBookCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(width: 0.95.sw, child: child),
    );
  }
}
