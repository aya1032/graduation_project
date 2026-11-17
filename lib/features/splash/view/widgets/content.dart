import 'package:aman_graduation_broject/core/constant/app_string.dart';
import 'package:aman_graduation_broject/core/theme/app_colors.dart';
import 'package:aman_graduation_broject/features/splash/view/widgets/placeholders.dart';
import 'package:aman_graduation_broject/features/splash/view/widgets/progressBar.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content();

  @override
  Widget build(BuildContext context) {
    // ظهور تدريجي للمحتوى كله
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOut,
      builder: (_, opacity, child) => Opacity(opacity: opacity, child: child),
      child: Column(
        children: [
          const Spacer(flex: 2),
          const LogoPlaceholder(),
          const SizedBox(height: 20),

          // السلوجان
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              AppStrings.splashSlogan,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // الجملة التوضيحية
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              AppStrings.splashDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppColors.textBody,
              ),
            ),
          ),

          const Spacer(flex: 3),
          const ChildPlaceholder(),
          const SizedBox(height: 24),
          const ProgressBar(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}