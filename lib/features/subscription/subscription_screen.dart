import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/auth_required_dialog.dart';
import 'package:sakeena/widgets/subscription_card.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final teal = const Color(0xFF2C7A7B);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Subscription',
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
              sales: 47,
              created: '1/10/2024',
              onBuyPressed: () {
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
              sales: 47,
              created: '1/10/2024',
              onBuyPressed: () {
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
              sales: 47,
              created: '1/10/2024',
              onBuyPressed: () {
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
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
