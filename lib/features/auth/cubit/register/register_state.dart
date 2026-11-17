import 'package:aman_graduation_broject/features/auth/data/model/user_model.dart';
import 'package:equatable/equatable.dart';



abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

// البداية: مفيش حاجة حصلت
class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

// بيتصل بالباك: الزر يعرض دايرة التحميل
class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

// نجح إنشاء الحساب
class RegisterSuccess extends RegisterState {
  const RegisterSuccess(this.user);

  final UserModel user;

  @override
  List<Object?> get props => [user];
}

// فشل إنشاء الحساب: بنحمل رسالة الخطأ
class RegisterError extends RegisterState {
  const RegisterError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}