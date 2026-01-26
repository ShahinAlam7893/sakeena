import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/widgets/custom_button.dart';

class BookDetailsPage extends StatelessWidget {
  final String bookId;

  const BookDetailsPage({super.key, required this.bookId});

  Map<String, dynamic> _getBookData() {
    final booksData = {
      '1': {
        'title': 'Prayers for the Anxious Heart',
        'author': 'Dr. Fatima Rahman',
        'image': 'assets/images/book_image.png',
        'rating': 4.8,
        'reviews': 234,
        'description': 'A comprehensive guide integrating Islamic prayers with modern psychological approaches to manage anxiety. This book combines spiritual wisdom with evidence-based techniques.',
        'details': {
          'Language': 'English',
          'Pages': '320',
          'Format': 'Hardcover',
          'Edition': '2nd Edition',
          'Publisher': 'Sakeena Institute Press',
          'Published': 'November 2025',
          'ISBN': '978-1-234567-89-0',
        },
        'price': '\$99',
      },
      '2': {
        'title': 'Peace Movements in Islam',
        'author': 'Sheikh Hassan',
        'image': 'assets/images/book_two.png',
        'rating': 4.6,
        'reviews': 189,
        'description': 'Explore the rich history of peaceful movements in Islamic tradition. This book delves into historical and contemporary examples of nonviolent resistance.',
        'details': {
          'Language': 'English',
          'Pages': '384',
          'Format': 'Paperback',
          'Edition': '1st Edition',
          'Publisher': 'Islamic Heritage Press',
          'Published': 'September 2025',
          'ISBN': '978-1-234567-90-6',
        },
        'price': '\$79',
      },
    };

    return booksData[bookId] ??
        {
          'title': 'Unknown Book',
          'author': 'Unknown Author',
          'image': 'assets/images/book_image.png',
          'rating': 0.0,
          'reviews': 0,
          'description': 'No description available',
          'details': {},
          'price': '\$0',
        };
  }

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);
    final book = _getBookData();
    final details = book['details'] as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => context.pop()),
        title: const Text('Back to Courses', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // Book Image
              Padding(
                padding: EdgeInsets.all(16.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(book['image'] as String, height: 280.h, width: double.infinity, fit: BoxFit.cover),
                ),
              ),

              // Rating & Reviews
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 16.sp, color: teal),
                    SizedBox(width: 4.w),
                    Text('${book['rating']}', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: teal)),
                    SizedBox(width: 4.w),
                    Text('(${book['reviews']} reviews)', style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600)),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Book Info
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(book['title'] as String, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black87)),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        CircleAvatar(radius: 20.r, backgroundImage: AssetImage(book['image'] as String)),
                        SizedBox(width: 10.w),
                        Expanded(child: Text(book['author'] as String, style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600))),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // Description
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About This Book', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black87)),
                    SizedBox(height: 8.h),
                    Text(book['description'] as String, style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade700, height: 1.6)),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // Book Details
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Book Details', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black87)),
                    SizedBox(height: 12.h),
                    ...details.entries.map((entry) => Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(entry.key, style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600, fontWeight: FontWeight.w500)),
                          Expanded(child: Text(entry.value.toString(), style: TextStyle(fontSize: 12.sp, color: Colors.black87), textAlign: TextAlign.end)),
                        ],
                      ),
                    )).toList(),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Add to Cart',
                      onPressed: () {},
                      isGradient: true,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 12.h),
                    CustomButton(
                      text: 'Read Preview',
                      onPressed: () {},
                      isGradient: false,
                      textColor: const Color(0xFF2C7A7B),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}