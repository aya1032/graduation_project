import 'package:aman_graduation_broject/features/auth/data/model/register_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../data/repositories/auth_repository.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._repository) : super(const RegisterInitial());

  final AuthRepository _repository;

  Future<void> register({
    required String parentName,
    required String email,
    required String password,
    required String confirmPassword,
    required String childName,
    required int childAge,
  }) async {
    emit(const RegisterLoading());

    final request = RegisterRequestModel(
      parentName: parentName.trim(),
      email: email.trim(),
      password: password, // من غير trim
      confirmPassword: confirmPassword, // من غير trim
      childName: childName.trim(),
      childAge: childAge,
    );

    final result = await _repository.register(request);

    if (isClosed) return;

    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (user) => emit(RegisterSuccess(user)),
    );
  }
}