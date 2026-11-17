import 'package:aman_graduation_broject/features/auth/data/model/login_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../data/repositories/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repository) : super(const LoginInitial());

  final AuthRepository _repository;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const LoginLoading());

    final request = LoginRequestModel(
      email: email.trim(), // نشيل المسافات من الإيميل بس
      password: password,
    );

    final result = await _repository.login(request);

    if (isClosed) return;

    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }
}