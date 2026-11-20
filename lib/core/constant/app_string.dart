
class AppStrings {
  AppStrings._(); // يمنع إنشاء نسخة من الكلاس

  // عام
  static const appName = 'اسم التطبيق';

  // Splash
  static const splashSlogan = 'كل طفل يستحق أن يشعر بالأمان';
  static const splashDescription =
      'قصص وفيديوهات وإرشادات تساعد طفلك على مواجهة مخاوفه';

  // Login
  static const loginTitle = 'أهلًا بعودتك!';
  static const loginSubtitle = 'هل أنت مستعد لمواصلة رحلة الشجاعة؟';
  static const emailHint = 'البريد الإلكتروني';
  static const passwordHint = 'كلمة المرور';
  static const forgotPassword = 'هل نسيت كلمة المرور؟';
  static const loginButton = 'تسجيل الدخول';
  static const noAccount = 'ليس لديك حساب؟ ';
  static const createAccount = 'إنشاء حساب جديد';

  // Register
  static const registerTitle = 'لنبدأ رحلتنا!';
  static const registerSubtitle =
      'أنشئ حسابك وابدأ رحلة الأمان مع طفلك';

  // Parent Information
  static const parentSectionTitle = 'بيانات ولي الأمر';
  static const parentNameLabel = 'اسم ولي الأمر';
  static const parentNameHint = 'أدخل اسمك';

  // Child Information
  static const childSectionTitle = 'بيانات الطفل';
  static const childNameLabel = 'اسم الطفل';
  static const childNameHint = 'أدخل اسم الطفل';
  static const childAgeLabel = 'عمر الطفل';
  static const childAgeHint =
      'اختر عمر طفلك لنقدم له المحتوى المناسب';
  static const childAgeRequired = 'يرجى اختيار عمر الطفل';

  // Email & Password
  static const emailLabel = 'البريد الإلكتروني';
  static const passwordLabel = 'كلمة المرور';
  static const passwordCreateHint = 'أدخل كلمة مرور قوية';
  static const confirmPasswordLabel = 'تأكيد كلمة المرور';
  static const confirmPasswordHint = 'أعد إدخال كلمة المرور';

  // Terms & Conditions
  static const acceptTerms =
      'أوافق على سياسة الخصوصية وشروط الاستخدام';

  // Buttons & Links
  static const registerButton = 'إنشاء حساب';
  static const haveAccount = 'لديك حساب بالفعل؟ ';
  static const loginLink = 'تسجيل الدخول';

  // Age
  static String yearsLabel(int age) => '$age سنوات';
}
