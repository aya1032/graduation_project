import 'package:aman_graduation_broject/features/auth/data/model/login_request_model.dart';
import 'package:aman_graduation_broject/features/auth/data/model/register_request_model.dart';
import 'package:aman_graduation_broject/features/auth/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

import 'auth_repository.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<Either<Failure, Unit>> login(LoginRequestModel request) async {
    // نحاكي وقت الاتصال بالباك
    await Future.delayed(const Duration(seconds: 1));

    // حالة فشل للتجربة: أي إيميل غير الإيميل ده يرجّع خطأ
    if (request.email != 'test@mail.com') {
      return const Left(UnauthorizedFailure());
    }

    // حالة نجاح
    return const Right(unit);
    
  }

  @override
  Future<Either<Failure, UserModel>> register(
      RegisterRequestModel request) async {
    await Future.delayed(const Duration(seconds: 1));

    // حالة فشل للتجربة: الإيميل ده "مستخدم بالفعل" (زي 409 من الباك)
    if (request.email == 'used@mail.com') {
      return const Left(ServerFailure('البريد الإلكتروني مستخدم بالفعل'));
    }

    // حالة نجاح: بنرجّع المستخدم بنفس البيانات اللي اتبعتت
    return Right(
      UserModel(
        id: '2',
        parentName: request.parentName,
        email: request.email,
        childName: request.childName,
        childAge: request.childAge,
      ),
    );
  }

  @override
  Future<Either<Failure, Unit>> forgotPassword(String email) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email == 'unknown@mail.com') {
      return const Left(ServerFailure('لا يوجد حساب بهذا البريد الإلكتروني'));
    }

    return const Right(unit);
  }
}