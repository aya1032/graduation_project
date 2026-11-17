class Validators {
  Validators._();

  // الاسم (ولي الأمر أو الطفل)
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'من فضلك اكتبي الاسم';
    }
    if (value.trim().length < 2) {
      return 'الاسم قصير جداً';
    }
    return null;
  }

  // البريد الإلكتروني
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'من فضلك اكتبي البريد الإلكتروني';
    }
    final emailRegex = RegExp(r'^[\w\.\-+]+@([\w\-]+\.)+[\w\-]{2,}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'البريد الإلكتروني غير صحيح';
    }
    return null;
  }

  // كلمة المرور
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك اكتبي كلمة المرور';
    }
    if (value.length < 8) {
      return 'كلمة المرور لازم تكون 8 أحرف على الأقل';
    }
    return null;
  }

  // تأكيد كلمة المرور: بنمرر الباسورد الأصلي للمقارنة
  static String? Function(String?) confirmPassword(String original) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return 'من فضلك أعيدي كتابة كلمة المرور';
      }
      if (value != original) {
        return 'كلمتا المرور غير متطابقتين';
      }
      return null;
    };
  }
}