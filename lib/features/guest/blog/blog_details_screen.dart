import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/blog_author_info_card.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';
import 'package:sakeena/widgets/custom_button.dart';
import 'package:sakeena/widgets/related_article_card.dart';

class BlogDetailsPage extends StatelessWidget {
  const BlogDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);
    const lightTeal = Color(0xFF3A6E73);

    return Scaffold(
      appBar: const CustomAppBar(showBackButton: true),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar: Back + Notification
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            size: 24.sp,
                            color: Colors.black87,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Back to Courses',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.notifications_outlined,
                      size: 24.sp,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),

              // Hero Image with overlay
              Stack(
                children: [
                  Image.asset(
                    'assets/images/blog_hero_prayer.png',
                    width: double.infinity,
                    height: 240.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.4),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // NEW: The Missing Card (Clock + Date + Read Time)
              Center(
                child: Transform.translate(
                  offset: Offset(0, -70.h),
                  child: Container(
                    width: 360.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: BlogAuthorInfoCard(),
                  ),
                ),
              ),

              // Main Content
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'In our fast-paced world, finding moments of peace and tranquility can seem like an impossible task. However, Islamic tradition offers a wealth of mindfulness practices that have been used for centuries to cultivate inner peace and spiritual awareness.\n\nDhikr (remembrance of Allah) is perhaps the most powerful form of mindfulness in Islam. When we engage in dhikr with presence and intention, we create a state of mindfulness that anchors us in the present moment. The Prophet Muhammad (peace be upon him) said: "The one who remembers his Lord and the one who does not are like the living and the dead."\n\nThese practices help us detach from worldly distractions and reconnect with our spiritual essence. Through consistent dhikr, we train our minds to stay present, reduce anxiety, and find deep inner peace.',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black87,
                        height: 1.7,
                      ),
                    ),

                    SizedBox(height: 40.h),

                    // Text(
                    //   'Related Articles',
                    //   style: TextStyle(
                    //     fontSize: 18.sp,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black87,
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Related Articles',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF3A6E73),
                            fontFamily: 'Arimo',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.push(AppRoutes.blogScreen);
                          },
                          child: Row(
                            children: [
                              Text(
                                'View all',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFF2C7A7B),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Icon(
                                Icons.arrow_circle_right_outlined,
                                size: 14.w,
                                color: const Color(0xFF2C7A7B),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12.h),

                    // ------------------ Articles List ------------------
                    RelatedArticleCard(
                      imagePath: 'assets/images/related_artical_image.jpg',
                      category: 'Spiritual Growth',
                      title: 'The Power of Dhikr in Daily Life',
                      description:
                          'Discover how the remembrance of Allah can transform your mental health and bring consistent peace.',
                      author: 'Sheikh Omar Hassan',
                      readTime: '6 min read',
                      onTap: () {
                        // Navigate to article details
                      },
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF7AA4A5), Color(0xFF205A60)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Continue Your Learning Journey",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "Explore our courses and resources to deepen your\nunderstanding of Islamic psychology",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    CustomButton(
                      text: "Browse Courses",
                      onPressed: () {
                        context.go('/courses');
                      },
                      isGradient: false,
                      textColor: teal,
                      width: 220.w,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
