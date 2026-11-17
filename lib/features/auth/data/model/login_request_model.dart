class LoginRequestModel {
  const LoginRequestModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  // أسماء الحقول (keys) لازم تطابق اللي الباك مستنيه
  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}