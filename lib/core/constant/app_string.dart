class AppStrings {
  AppStrings._(); // يمنع إنشاء نسخة من الكلاس

  // عام
  static const appName = 'اسم التطبيق'; // غيّريه لما الاسم يتحسم

  // Splash
  static const splashSlogan = 'كل طفل يستحق أن يشعر بالأمان';
  static const splashDescription =
      'قصص، فيديوهات، وإرشادات تساعد طفلك يواجه مخاوفه';
      // Login
static const loginTitle = 'أهلاً بعودتك!';
static const loginSubtitle = 'مستعدين نكمل رحلة الشجاعة؟';
static const emailHint = 'البريد الإلكتروني';
static const passwordHint = 'كلمة المرور';
static const forgotPassword = 'نسيت كلمة المرور؟';
static const loginButton = 'تسجيل الدخول';
static const noAccount = 'معندكيش حساب؟ ';
static const createAccount = 'إنشاء حساب جديد';
// Register
static const registerTitle = 'يلا نبدأ رحلتنا!';
static const registerSubtitle = 'اعملي حساب وابدأي رحلة الأمان مع طفلك.';
static const parentSectionTitle = 'بيانات ولي الأمر';
static const childSectionTitle = 'بيانات الطفل الصغير';
static const parentNameLabel = 'اسم ولي الأمر';
static const parentNameHint = 'اكتبي اسمك بالكامل';
static const childAgeLabel = 'عمر الطفل';
static const childAgeHint = 'اختاري عمر طفلك لنقدّم له المحتوى المناسب';
static const childAgeRequired = 'من فضلك اختاري عمر الطفل';
static String yearsLabel(int age) => '$age سنوات';

static const emailLabel = 'البريد الإلكتروني';
static const passwordLabel = 'كلمة المرور';
static const passwordCreateHint = 'اكتبي كلمة مرور قوية';
static const confirmPasswordLabel = 'تأكيد كلمة المرور';
static const confirmPasswordHint = 'أعيدي كتابة كلمة المرور';
static const childNameLabel = 'اسم الطفل';
static const childNameHint = 'اسم طفلك';
static const acceptTerms = 'أوافق على سياسة الخصوصية وشروط الاستخدام';
static const registerButton = 'إنشاء حساب';
static const haveAccount = 'عندك حساب بالفعل؟ ';
static const loginLink = 'تسجيل الدخول';
}