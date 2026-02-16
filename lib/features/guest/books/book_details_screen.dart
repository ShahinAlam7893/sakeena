import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/about_book_section.dart';
import 'package:sakeena/widgets/custom_button.dart';
import 'package:sakeena/widgets/format_selection_section.dart';
import 'package:sakeena/widgets/book_format_selection.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookDetailsPage extends StatefulWidget {
  final String bookId;

  const BookDetailsPage({super.key, required this.bookId});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  int currentImageIndex = 0;

  Map<String, dynamic> _getBookData() {
    final booksData = {
      '1': {
        'title': 'Prayers for the Anxious Heart',
        'author': 'Dr. Fatima Rahman',
        'authorImage': 'assets/images/author_fatima.jpg',
        'images': [
          'assets/images/book_image.png',
          'assets/images/book_two.png',
          'assets/images/book_three.png',
        ],
        'rating': 4.8,
        'reviews': 234,
        'description':
            'Discover the transformative power of Sabr (patience) in navigating life\'s challenges. This groundbreaking book combines classical Islamic teachings with modern psychological research to provide practical tools for building resilience, managing stress, and finding peace in difficult times.',
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
        'pdfPath': 'assets/pdfs/demo.pdf',
        'videoPath': 'https://www.youtube.com/watch?v=JnX7Oc8LqD8&t=11s',
      },
      '2': {
        'title': 'Peace Movements in Islam',
        'author': 'Sheikh Hassan',
        'authorImage': null,
        'images': ['assets/images/book_two.png', 'assets/images/book_two.png'],
        'rating': 4.6,
        'reviews': 189,
        'description':
            'Explore the rich history of peaceful movements in Islamic tradition. This book delves into historical and contemporary examples of nonviolent resistance.',
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
        'pdfPath': 'assets/documents/book_2.pdf',
        'videoPath': 'assets/videos/book_2_intro.mp4',
      },
    };

    return booksData[widget.bookId] ??
        {
          'title': 'Unknown Book',
          'author': 'Unknown Author',
          'authorImage': null,
          'images': ['assets/images/book_image.png'],
          'rating': 0.0,
          'reviews': 0,
          'description': 'No description available',
          'details': {},
          'price': '\$0',
          'pdfPath': 'assets/documents/default.pdf',
          'videoPath': 'assets/videos/default.mp4',
        };
  }

  void _openPDFViewer() {
    final book = _getBookData();
    context.push(
      AppRoutes.booksPdf,
      extra: {
        'title': book['title'],
        'pdfPath': book['pdfPath'],
      },
    );
  }

  void _openVideoPlayer() {
    final book = _getBookData();
    context.push(
      AppRoutes.booksVideo,
      extra: {
        'title': book['title'],
        'videoPath': book['videoPath'],
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);
    final book = _getBookData();
    final details = book['details'] as Map<String, dynamic>? ?? {};
    final images =
        (book['images'] as List<dynamic>?)?.cast<String>() ??
        ['assets/images/book_image.png'];
    final authorImage = book['authorImage'] as String?;
    final chapters = [
      "Chapter 1: The Essence of Sabr",
      "Chapter 2: Sabr in the Quran and Sunnah",
      "Chapter 3: The Psychology of Patience",
      "Chapter 4: Daily Practices for Building Sabr",
      "Chapter 5: Patience with Life's Trials",
      "Chapter 6: Living Sabr: Case Studies",
      "Chapter 7: Sabr in Modern Mental Health",
      "Chapter 8: Teaching Sabr to Children",
      "Chapter 9: The Journey Continues",
    ];

    return Scaffold(    
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
            children: [
              // Book Images Carousel
              SizedBox(
                height: 280.h,
                child: PageView.builder(
                  itemCount: images.length,
                  onPageChanged: (index) =>
                      setState(() => currentImageIndex = index),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          images[index],
                          height: 280.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Dots Indicator
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    width: currentImageIndex == index ? 12.w : 8.w,
                    height: currentImageIndex == index ? 12.w : 8.w,
                    decoration: BoxDecoration(
                      color: currentImageIndex == index
                          ? teal
                          : Colors.grey.shade400,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              // Book Info
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book['title'] as String? ?? 'Unknown',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        authorImage != null
                            ? CircleAvatar(
                                radius: 20.r,
                                backgroundImage: AssetImage(authorImage),
                              )
                            : CircleAvatar(
                                radius: 20.r,
                                backgroundColor: teal,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            book['author'] as String? ?? 'Unknown',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // Book Details
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Book Details',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ...details.entries.map(
                      (entry) => Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              entry.key,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                entry.value.toString(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: BookAboutSection(
                  description:
                      book['description'] as String? ??
                      'No description available',
                  chapters: chapters,
                ),
              ),

              SizedBox(height: 24.h),

              // Read Book / Watch Video Format Selection
              BookFormatSelection(
                bookTitle: book['title'] as String? ?? 'Book',
                onReadBook: _openPDFViewer,
                onWatchVideo: _openVideoPlayer,
              ),

              SizedBox(height: 24.h),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "What You'll Learn",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ...[
                      'The three types of Sabr and their psychological benefits',
                      'How to cultivate patience in daily life',
                      'Islamic techniques for stress management',
                      'Building emotional resilience through faith',
                      'Dealing with grief, loss, and hardship',
                      'The relationship between Sabr and mental health',
                      'Practical exercises and reflection prompts',
                      'Real-life case studies and examples',
                    ].map(
                      (feature) => Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/circle_check_Icon.svg',
                              width: 20.w,
                              height: 20.h,
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Text(
                                feature,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: 'Arimo',
                                  color: Colors.black,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
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