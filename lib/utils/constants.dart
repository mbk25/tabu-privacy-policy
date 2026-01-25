import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF6C5CE7);
  static const primaryDark = Color(0xFF5F4FD1);
  static const secondary = Color(0xFF00D2D3);
  static const success = Color(0xFF00B894);
  static const danger = Color(0xFFFF6B6B);
  static const warning = Color(0xFFFDCB6E);
  static const dark = Color(0xFF2D3436);
  static const light = Color(0xFFDFE6E9);
  static const bg = Color(0xFF0F1419);
  static const bgCard = Color(0xFF1A1F29);
  static const textPrimary = Colors.white;
  static const textSecondary = Color(0xFFB2BAC2);
}

class AppGradients {
  static const background = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF667eea), Color(0xFF764ba2)],
  );
  
  static const primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primary, AppColors.primaryDark],
  );
  
  static const success = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.success, Color(0xFF00A77D)],
  );
  
  static const warning = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.warning, Color(0xFFF39C12)],
  );
  
  static const danger = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.danger, Color(0xFFEE5A52)],
  );
  
  static const titleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
  );
}
