import 'package:aman_graduation_broject/features/auth/data/model/register_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/auth_repository.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._repository) : super(const RegisterInitial());

  final AuthRepository _repository;

  Future<void> register({
    required String parentFirstName,
    required String parentLastName,
    required String email,
    required String password,
    required String childName,
  }) async {
    emit(const RegisterLoading());

    final request = RegisterRequestModel(
      parentFirstName: parentFirstName.trim(),
      parentLastName: parentLastName.trim(),
      email: email.trim(),
      password: password, // الباسورد من غير trim
      childName: childName.trim(),
    );

    final result = await _repository.register(request);

    if (isClosed) return;

    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (user) => emit(RegisterSuccess(user)),
    );
  }
}