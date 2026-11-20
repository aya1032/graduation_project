import 'package:aman_graduation_broject/features/auth/data/data%20sources/auth_local_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._local) : super(const SplashInitial());
  final AuthLocalDataSource _local;

  static const _splashDuration = Duration(seconds: 3);

  Future<void> start() async {
    // ننتظر المدة والتوكن مع بعض
    final results = await Future.wait([
      Future.delayed(_splashDuration),
      _local.hasToken(),
    ]);

    final hasToken = results[1] as bool;

    if (isClosed) return;
    emit(hasToken ? const SplashGoHome() : const SplashGoLogin());
  }
}