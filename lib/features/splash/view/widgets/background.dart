import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/splash-background.png',
      fit: BoxFit.cover,
      // لو الصورة مش لاقيها، يظهر تدرج بدل شاشة حمرا
      errorBuilder: (_, __, ___) => const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF8E8FE8), Color(0xFFF3E9FA)],
          ),
        ),
      ),
    );
  }
}
