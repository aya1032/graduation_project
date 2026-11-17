import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // يمنع إنشاء نسخة من الكلاس

  // ألوان النصوص
  static const textPrimary = Color(0xFF4A3FB0);   // السلوجان والعناوين (بنفسجي غامق)
  static const textBody = Color(0xFF2E2A4A);      // الجمل التوضيحية
  static const textHint = Color(0xFFAAAAAA);      // نصوص الحقول (للـ Login بعدين)

  // شريط التحميل
  static const progressFill = Color(0xFF7B7FE0);  // الجزء المملوء
  static const progressTrack = Colors.white;  
  static const buttonPrimary = Color(0xFF7B7FE0);   // خلفية زر الدخول / إنشاء حساب
  static const buttonText = Colors.white;           // نص الزر
  static const buttonDisabled = Color(0xFFC9CAEF);  // الزر وهو معطّل (مثلاً قبل الموافقة على الخصوصية)

  // ===== جديد: الحقول =====
  static const fieldBackground = Color(0xFFF7F5FC); // خلفية الحقل
  static const fieldBorder = Color(0xFFE6E3F5);     // إطار الحقل العادي
  static const fieldBorderFocused = Color(0xFF7B7FE0); // إطار الحقل لما تضغطي عليه
  static const fieldIcon = Color(0xFF6E6A9E);       // أيقونات الحقول (إيميل، قفل، شخص)

  // ===== جديد: الروابط والأخطاء =====
  static const link = Color(0xFF5A57C9);            // "نسيت كلمة المرور؟" و"إنشاء حساب جديد"
  static const error = Color(0xFFE05A6D);   
  static const screenBackground = Color(0xFFFBF8F3); // الكريمي        // رسائل الخطأ وإطار الحقل الغلط    // الجزء الفاضي
}
