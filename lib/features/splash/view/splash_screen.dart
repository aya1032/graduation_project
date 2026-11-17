import 'package:aman_graduation_broject/features/splash/cubit/splash-cubit.dart';
import 'package:aman_graduation_broject/features/splash/cubit/splash_state.dart';
import 'package:aman_graduation_broject/features/splash/view/widgets/background.dart';
import 'package:aman_graduation_broject/features/splash/view/widgets/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashGoLogin) context.go('/login');
        if (state is SplashGoHome) context.go('/fear-selection');
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            const Background(),
            SafeArea(child: const Content()),
          ],
        ),
      ),
    );
  }
}