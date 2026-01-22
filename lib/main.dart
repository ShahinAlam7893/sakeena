import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/view_model/auth_view_model.dart';
import 'package:sakeena/view_model/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          child: Consumer<UserProvider>(
            builder: (context, userProvider, _) {
              final router = createRouter();
              return MaterialApp.router(
                title: 'Sakeena Institute',
                debugShowCheckedModeBanner: false,
                routerConfig: router,
                theme: ThemeData(
                  primaryColor: const Color(0xFF2C7A7B),
                  scaffoldBackgroundColor: Colors.grey.shade50,
                  useMaterial3: true,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color(0xFF2C7A7B),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}