// import 'package:equatable/equatable.dart';

// abstract class Failure extends Equatable {
//   const Failure(this.message);

//   final String message; // الرسالة اللي هتظهر للأم

//   @override
//   List<Object?> get props => [message];
// }

// // خطأ جاي من الباك إند (بيانات غلط، إيميل مستخدم...)
// class ServerFailure extends Failure {
//   const ServerFailure(super.message);
// }

// // مفيش إنترنت أو الاتصال فشل
// class NetworkFailure extends Failure {
//   const NetworkFailure([super.message = 'تأكدي من اتصالك بالإنترنت']);
// }

// // بيانات الدخول غلط (401)
// class UnauthorizedFailure extends Failure {
//   const UnauthorizedFailure(
//       [super.message = 'البريد الإلكتروني أو كلمة المرور غير صحيحة']);
// }

// // أي خطأ غير متوقع
// class UnknownFailure extends Failure {
//   const UnknownFailure([super.message = 'حدث خطأ غير متوقع، حاولي مرة أخرى']);
// }
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message; // الرسالة اللي هتظهر للأم

  @override
  List<Object?> get props => [message];

  /// بيحوّل خطأ Dio لـ Failure مفهوم
  factory Failure.fromDio(DioException e) {
    // 1) مفيش اتصال أو السيرفر مش شغال
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      return const NetworkFailure();
    }

    final statusCode = e.response?.statusCode;
    final message = _extractMessage(e.response?.data);

    // 2) إيميل أو باسورد غلط
    if (statusCode == 401) {
      return message != null
          ? UnauthorizedFailure(message)
          : const UnauthorizedFailure();
    }

    // 3) باقي أخطاء الباك (400 / 409 / 500...)
    if (message != null) return ServerFailure(message);

    return const UnknownFailure();
  }

  // بيقرا الرسالة من رد الباك
  static String? _extractMessage(dynamic data) {
    if (data is! Map) return null;

    // لو فيه أخطاء لكل حقل (validation)، ناخد أول رسالة
    final errors = data['errors'];
    if (errors is List && errors.isNotEmpty) {
      final first = errors.first;
      if (first is Map && first['msg'] is String) {
        return first['msg'] as String;
      }
    }

    // الباك كاتب "messsage" بـ 3 s في رد الـ validation
    final msg = data['message'] ?? data['messsage'];
    return msg is String && msg.isNotEmpty ? msg : null;
  }
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