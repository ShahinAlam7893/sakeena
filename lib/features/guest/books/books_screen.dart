import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/widgets/book_card.dart';
import 'package:sakeena/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/widgets/book_card.dart';
import 'package:sakeena/widgets/custom_button.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Back to Courses',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
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
                    Text(
                      'Books & Publications',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomButton(
                  text: 'View all',
                  onPressed: () {},
                  isGradient: true,
                  textColor: Colors.white,
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
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
