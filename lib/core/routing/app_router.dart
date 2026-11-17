import 'package:aman_graduation_broject/features/auth/cubit/login/login_cubit.dart';
import 'package:aman_graduation_broject/features/auth/cubit/register/register_cubit.dart';
import 'package:aman_graduation_broject/features/auth/data/repositories/fake_auth_repositories.dart';
import 'package:aman_graduation_broject/features/auth/view/register_screen.dart';
import 'package:aman_graduation_broject/features/splash/cubit/splash-cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/view/login_screen.dart';

import '../../features/splash/view/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => BlocProvider(
        create: (_) => SplashCubit()..start(),
        child: const SplashScreen(),
      ),
    ),

    GoRoute(
      path: '/login',
      builder: (context, state) => BlocProvider(
        create: (_) => LoginCubit(FakeAuthRepository()),
        child: const LoginScreen(),
      )
    ),

    // شاشات مؤقتة لحد ما نبنيها
    GoRoute(
      path: '/register',
      builder: (context, state) => BlocProvider(
        create: (_) => RegisterCubit(FakeAuthRepository()),
        child: const RegisterScreen(),
      ),
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const _TempScreen('Forgot Password'),
    ),
    GoRoute(
      path: '/fear-selection',
      builder: (context, state) => const _TempScreen('Fear Selection'),
    ),
  ],
);

class _TempScreen extends StatelessWidget {
  const _TempScreen(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(title)));
  }
}