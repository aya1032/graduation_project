import 'package:aman_graduation_broject/features/auth/data/model/login_request_model.dart';
import 'package:aman_graduation_broject/features/auth/data/model/register_request_model.dart';
import 'package:aman_graduation_broject/features/auth/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';


abstract class AuthRepository {
  /// تسجيل الدخول: بيرجّع المستخدم لو نجح، أو Failure لو فشل
  Future<Either<Failure, Unit>> login(LoginRequestModel request);
  Future<Either<Failure, Unit>> forgotPassword (String email);
  Future<Either<Failure, UserModel>> register(RegisterRequestModel request);
}