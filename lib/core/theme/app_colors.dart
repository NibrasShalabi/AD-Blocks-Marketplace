import 'package:flutter/material.dart';

/// ألوان التطبيق: خلفية داكنة + ذهبي مميز للـVIP.
class AppColors {
  // الخلفيات
  static const Color background = Color(0xFF0A0E1A);
  static const Color surface = Color(0xFF141A2E);
  static const Color surfaceLight = Color(0xFF1E2740);

  // النصوص
  static const Color textPrimary = Color(0xFFF5F7FA);
  static const Color textSecondary = Color(0xFF8A94AD);

  // اللون الأساسي (للأزرار والروابط)
  static const Color primary = Color(0xFF2E7DF6);

  // ألوان البلوكات
  static const Color blockEmpty = Color(0xFF1A2138);
  static const Color blockBorder = Color(0xFF2A3454);

  // الذهبي للـVIP
  // الذهبي للـVIP
  static const Color vipGold = Color(0xFFE8B339);
  static const Color vipGoldLight = Color(0xFFF5D27A);
  static const Color vipGoldText = Color(0xFF3A2A05); // نص على خلفية ذهبية
  static const Color vipGlow = Color(0x33E8B339);

  // تدرّج خلفية البطاقة (يظهر لو الصورة ما حمّلت)
  static const Color cardGradTop = Color(0xFF1E2740);
  static const Color cardGradBottom = Color(0xFF0A0E1A);
  // حالات
  static const Color success = Color(0xFF2BBF7E);
  static const Color danger = Color(0xFFE2574C);
}