import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/features/subscription/bundle_details_dialog.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/auth_required_dialog.dart';
import 'package:sakeena/widgets/subscription_card.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  void _showBundleDetails(
    BuildContext context, {
    required String title,
    required String description,
    required String price,
    required String originalPrice,
    required List<String> courses,
    required List<String> courseCategories,
    required List<String> coursePrices,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return BundleDetailsDialog(
          title: title,
          description: description,
          price: price,
          originalPrice: originalPrice,
          courses: courses,
          courseCategories: courseCategories,
          coursePrices: coursePrices,
          onCourseTapped: (index, courseName) {
            // Handle course tap - navigate to course details
            Navigator.pop(context); // Close bundle dialog
            context.push(AppRoutes.courseDetails, extra: {
              'courseName': courseName,
              'courseCategory': courseCategories[index],
              'coursePrice': coursePrices[index],
            });
          },
          onBuyPressed: () {
            Navigator.pop(context); // Close bundle details
            _showAuthDialog(context);
          },
        );
      },
    );
  }

  void _showAuthDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AuthRequiredDialog(
          onSignIn: () {
            Navigator.pop(context);
            context.push(AppRoutes.login);
          },
          onCreateAccount: () {
            Navigator.pop(context);
            context.push(AppRoutes.signup);
          },
          onBrowse: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Mastery Bundle',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            SubscriptionCard(
              tag: 'Published',
              tagColor: Colors.green,
              title: 'Web Development Mastery Bundle',
              description:
                  'Complete web development stack from frontend to backend',
              price: '\$599',
              originalPrice: '\$1,344',
              discount: 'Save 55%',
              courses: [
                'Data Science Fundamentals',
                'Node js Backend Development',
                'CSS Masterclass',
                'Advanced React Patterns',
              ],
              courseCategories: [
                'Data Science',
                'Web Development',
                'Web Development',
                'Web Development',
              ],
              coursePrices: ['\$299', '\$299', '\$299', '\$299'],
              sales: 47,
              created: '1/10/2024',
              onViewDetailsPressed: () {
                _showBundleDetails(
                  context,
                  title: 'Web Development Mastery Bundle',
                  description:
                      'Complete web development stack from frontend to backend',
                  price: '\$599',
                  originalPrice: '\$1,344',
                  courses: [
                    'Data Science Fundamentals',
                    'Node js Backend Development',
                    'CSS Masterclass',
                    'Advanced React Patterns',
                  ],
                  courseCategories: [
                    'Data Science',
                    'Web Development',
                    'Web Development',
                    'Web Development',
                  ],
                  coursePrices: ['\$299', '\$299', '\$299', '\$299'],
                );
              },
            ),
            SizedBox(height: 20.h),
            SubscriptionCard(
              tag: 'Draft',
              tagColor: const Color(0xFFA0A0A0),
              title: 'Web Development Mastery Bundle',
              description:
                  'Complete web development stack from frontend to backend',
              price: '\$599',
              originalPrice: '\$1,344',
              discount: 'Save 55%',
              courses: [
                'Data Science Fundamentals',
                'Node js Backend Development',
                'CSS Masterclass',
                'Advanced React Patterns',
              ],
              courseCategories: [
                'Data Science',
                'Web Development',
                'Web Development',
                'Web Development',
              ],
              coursePrices: ['\$299', '\$299', '\$299', '\$299'],
              sales: 47,
              created: '1/10/2024',
              onViewDetailsPressed: () {
                _showBundleDetails(
                  context,
                  title: 'Web Development Mastery Bundle',
                  description:
                      'Complete web development stack from frontend to backend',
                  price: '\$599',
                  originalPrice: '\$1,344',
                  courses: [
                    'Data Science Fundamentals',
                    'Node js Backend Development',
                    'CSS Masterclass',
                    'Advanced React Patterns',
                  ],
                  courseCategories: [
                    'Data Science',
                    'Web Development',
                    'Web Development',
                    'Web Development',
                  ],
                  coursePrices: ['\$299', '\$299', '\$299', '\$299'],
                );
              },
            ),
            SizedBox(height: 20.h),
            SubscriptionCard(
              tag: 'Draft',
              tagColor: const Color(0xFFA0A0A0),
              title: 'Web Development Mastery Bundle',
              description:
                  'Complete web development stack from frontend to backend',
              price: '\$599',
              originalPrice: '\$1,344',
              discount: 'Save 55%',
              courses: [
                'Data Science Fundamentals',
                'Node js Backend Development',
                'CSS Masterclass',
                'Advanced React Patterns',
              ],
              courseCategories: [
                'Data Science',
                'Web Development',
                'Web Development',
                'Web Development',
              ],
              coursePrices: ['\$299', '\$299', '\$299', '\$299'],
              sales: 47,
              created: '1/10/2024',
              onViewDetailsPressed: () {
                _showBundleDetails(
                  context,
                  title: 'Web Development Mastery Bundle',
                  description:
                      'Complete web development stack from frontend to backend',
                  price: '\$599',
                  originalPrice: '\$1,344',
                  courses: [
                    'Data Science Fundamentals',
                    'Node js Backend Development',
                    'CSS Masterclass',
                    'Advanced React Patterns',
                  ],
                  courseCategories: [
                    'Data Science',
                    'Web Development',
                    'Web Development',
                    'Web Development',
                  ],
                  coursePrices: ['\$299', '\$299', '\$299', '\$299'],
                );
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}