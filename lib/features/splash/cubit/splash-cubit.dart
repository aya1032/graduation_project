import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial());

  static const _splashDuration = Duration(seconds: 3);

  Future<void> start() async {
    await Future.delayed(_splashDuration);

    // مؤقتاً: لحد ما نربط الـ Auth ونقرا التوكن الحقيقي
    const bool hasToken = false;

    if (isClosed) return;
    emit(hasToken ? const SplashGoHome() : const SplashGoLogin());
  }
}