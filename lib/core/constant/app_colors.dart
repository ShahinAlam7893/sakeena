// app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF4CAF50);    
  static const primaryLight = Color(0xFFE8F5E9);
  static const background = Color(0xFFF5F9F5);
  static const textDark = Color(0xFF1A3C34);
  static const textGrey = Color(0xFF6B8E7D);
  static const cardBorder = Color(0xFFE0F2E9);
  
  static const LinearGradient homeBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF4EFE8), // #f4efe8
      Color(0xFFEFE8DD), // #efe8dd
    ],
  );
}