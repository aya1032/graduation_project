import 'package:aman_graduation_broject/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(seconds: 3), // نفس مدة الـ Cubit
        curve: Curves.easeInOut,
        builder: (_, value, __) => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 6,
            backgroundColor: AppColors.progressTrack,
            color: AppColors.progressFill,
          ),
        ),
      ),
    );
  }
}