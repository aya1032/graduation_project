import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.parentFirstName,
    required this.parentLastName,
    required this.email,
    this.role = 'parent',
  });

  final String id;
  final String parentFirstName;
  final String parentLastName;
  final String email;
  final String role;

  // الاسم الكامل للعرض في الشاشات
  String get fullName => '$parentFirstName $parentLastName'.trim();

  // أسماء الحقول (keys) هنا لازم تطابق اللي الباك بيرجّعه
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      parentFirstName: json['parentFirstName'] as String? ?? '',
      parentLastName: json['parentLastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      role: json['role'] as String? ?? 'parent',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'parentFirstName': parentFirstName,
        'parentLastName': parentLastName,
        'email': email,
        'role': role,
      };

  @override
  List<Object?> get props =>
      [id, parentFirstName, parentLastName, email, role];
}