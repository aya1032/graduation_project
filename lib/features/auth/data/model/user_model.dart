import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.parentName,
    required this.email,
    required this.childName,
    required this.childAge,
  });

  final String id;
  final String parentName;
  final String email;
  final String childName;
  final int childAge;

  // أسماء الحقول (keys) لازم تطابق اللي الباك بيرجّعه
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'].toString(),
      parentName: json['parentName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      childName: json['childName'] as String? ?? '',
      childAge: (json['childAge'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'parentName': parentName,
        'email': email,
        'childName': childName,
        'childAge': childAge,
      };

  @override
  List<Object?> get props => [id, parentName, email, childName, childAge];
}