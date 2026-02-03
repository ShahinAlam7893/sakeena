import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/view_model/auth_view_model.dart';
import 'package:sakeena/view_model/user_provider.dart';

void main() {
final router = createRouter();
  runApp( MyApp(router: router,));
}

class MyApp extends StatelessWidget {
  final GoRouter router;
   MyApp({super.key,required this.router});

  static const Color primaryColor = Color(0xFF2C7A7B);
  static const Color backgroundColor = Color(0xFFFFFEF8);
  static const Color notificationDotColor = Color(0xFFE53E3E);

  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => UserProvider()),
            ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ],
          child: MaterialApp.router(
                title: 'Sakeena Institute',
                debugShowCheckedModeBanner: false,
                routerConfig: router,
                theme: ThemeData(
                  primaryColor: primaryColor,
                  scaffoldBackgroundColor: Colors.grey.shade50,
                  useMaterial3: true,
                  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
                ),
              )
        );
      },
    );
  }
}
