import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message; // الرسالة اللي هتظهر للأم

  @override
  List<Object?> get props => [message];
}

// خطأ جاي من الباك إند (بيانات غلط، إيميل مستخدم...)
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

// مفيش إنترنت أو الاتصال فشل
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'تأكدي من اتصالك بالإنترنت']);
}

// بيانات الدخول غلط (401)
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(
      [super.message = 'البريد الإلكتروني أو كلمة المرور غير صحيحة']);
}

// أي خطأ غير متوقع
class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'حدث خطأ غير متوقع، حاولي مرة أخرى']);
}