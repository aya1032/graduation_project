import 'package:aman_graduation_broject/core/constant/app_string.dart';
import 'package:aman_graduation_broject/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LogoPlaceholder extends StatelessWidget {
  const LogoPlaceholder();

  @override
  Widget build(BuildContext context) {
    // لما اللوجو يوصل: return Image.asset('assets/images/logo.png', width: 220);
    return const Text(
      AppStrings.appName,
      style: TextStyle(
        fontSize: 56,
        fontWeight: FontWeight.w900,
        color: AppColors.textPrimary,
      ),
    );
  }
}

class ChildPlaceholder extends StatelessWidget {
  const ChildPlaceholder();

  @override
  Widget build(BuildContext context) {
    // لما الصورة توصل: return Image.asset('assets/images/splash_child.png', height: 260);
    return const SizedBox(height: 200);
  }
}