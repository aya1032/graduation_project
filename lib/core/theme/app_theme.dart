import 'package:aman_graduation_broject/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
class AppTheme{
  AppTheme._();
  static const fontFamily='Cairo';
  static ThemeData get light{
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.progressFill,
        primary: AppColors.progressFill,
        ),

        textTheme: ThemeData.light().textTheme.apply(
          fontFamily:fontFamily,
           bodyColor: AppColors.textBody,
            displayColor: AppColors.textPrimary,
          )
    );
  }


}