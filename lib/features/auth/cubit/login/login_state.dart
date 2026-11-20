import 'package:aman_graduation_broject/features/auth/data/model/user_model.dart';
import 'package:equatable/equatable.dart';



abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

// البداية: مفيش حاجة حصلت
class LoginInitial extends LoginState {
  const LoginInitial();
}

// بيتصل بالباك: الزر يعرض دايرة التحميل
class LoginLoading extends LoginState {
  const LoginLoading();
}

// نجح الدخول
class LoginSuccess extends LoginState {
  const LoginSuccess();

  
}

// فشل الدخول: بنحمل رسالة الخطأ
class LoginError extends LoginState {
  const LoginError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}