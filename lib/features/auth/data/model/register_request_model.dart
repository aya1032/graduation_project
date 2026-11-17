class RegisterRequestModel {
  const RegisterRequestModel({
    required this.parentFirstName,
    required this.parentLastName,
    required this.email,
    required this.password,
    required this.childName,
  });

  final String parentFirstName;
  final String parentLastName;
  final String email;
  final String password;
  final String childName;

  // أسماء الحقول (keys) إنجليزي زي ما الباك باعتها
  Map<String, dynamic> toJson() => {
        'parentFirstName': parentFirstName,
        'parentLastName': parentLastName,
        'email': email,
        'password': password,
        'childName': childName,
      };
}