import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/widgets/testimonial_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final PageController _pageController = PageController(viewportFraction: 0.88);

  final List<Map<String, String>> testimonials = [
    {
      'quote':
          '"Sakeena Institute changed my life. The courses helped me understand my struggles through an Islamic lens and gave me practical tools to heal. Forever grateful!"',
      'name': 'Amina Hassan',
      'location': 'London, UK',
    },
    {
      'quote':
          '"As a community leader, the Islamic counseling training I received here has enabled me to better support my community. The instructors are world-class."',
      'name': 'Yusuf Ahmed',
      'location': 'Toronto, Canada',
    },
    {
      'quote':
          '"The blend of authentic Islamic knowledge and modern psychology is exactly what our Ummah needs. This platform is a blessing for so many struggling in silence."',
      'name': 'Mariam Al-Rashid',
      'location': 'Dubai, UAE',
    },
  ];

  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What Our Students Say About Sakeena Institute',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Real stories of transformation and healing',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          // Carousel
          SizedBox(
            height: 280.h, // adjust height based on your card design
            child: PageView.builder(
              controller: _pageController,
              itemCount: testimonials.length,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemBuilder: (context, index) {
                final testimonial = testimonials[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: TestimonialCard(
                    quote: testimonial['quote']!,
                    authorName: testimonial['name']!,
                    authorLocation: testimonial['location']!,
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 16.h),

          // Page indicators (dots)
          Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: testimonials.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8.h,
                dotWidth: 8.w,
                spacing: 8.w,
                expansionFactor: 3,
                activeDotColor: const Color(0xFF2C7A7B), // your brand teal
                dotColor: Colors.grey.shade300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}