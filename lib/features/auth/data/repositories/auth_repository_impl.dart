import 'package:aman_graduation_broject/features/auth/data/data%20sources/auth_local_data_source.dart';
import 'package:aman_graduation_broject/features/auth/data/data%20sources/auth_remote_data_source.dart';
import 'package:aman_graduation_broject/features/auth/data/model/login_request_model.dart';
import 'package:aman_graduation_broject/features/auth/data/model/register_request_model.dart';
import 'package:aman_graduation_broject/features/auth/data/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote, this._local);

  final AuthRemoteDataSource _remote;
  final AuthLocalDataSource _local;

  @override
  Future<Either<Failure, Unit>> login(LoginRequestModel request) async {
    try {
      final token = await _remote.login(request);
      await _local.saveToken(token); // التوكن بيتحفظ هنا، والـ Cubit مش بيشوفه
      return const Right(unit);
    } on DioException catch (e) {
      return Left(Failure.fromDio(e));
    } catch (_) {
      // رد غير متوقع (مثلاً data ناقصة)
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
      RegisterRequestModel request) async {
    try {
      final user = await _remote.register(request);
      return Right(user);
    } on DioException catch (e) {
      return Left(Failure.fromDio(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> forgotPassword(String email) async {
    // مؤقتاً: الباك لسه ما حددش الـ endpoint
    return const Left(
      UnknownFailure('استعادة كلمة المرور غير متاحة حالياً'),
    );
  }
}