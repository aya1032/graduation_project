class RegisterRequestModel {
  const RegisterRequestModel({
    required this.parentName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.childName,
    required this.childAge,
  });

  final String parentName;
  final String email;
  final String password;
  final String confirmPassword;
  final String childName;
  final int childAge;

  Map<String, dynamic> toJson() => {
        'parentName': parentName,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'childName': childName,
        'childAge': childAge,
      };
}