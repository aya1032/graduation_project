import 'package:aman_graduation_broject/core/constant/app_string.dart';
import 'package:aman_graduation_broject/features/auth/cubit/login/login_cubit.dart';
import 'package:aman_graduation_broject/features/auth/cubit/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import 'widgets/password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    // لو أي حقل غلط، هتظهر رسائل الخطأ وبنوقف هنا
    if (!_formKey.currentState!.validate()) return;

    // مؤقتاً: لحد ما نربط الـ LoginCubit
    //context.go('/fear-selection');
     context.read<LoginCubit>().login(
        email: _emailController.text,
        password: _passwordController.text,
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
        context.go('/fear-selection');
      }
      if (state is LoginError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      }
        // TODO: implement listener
      },
      child: Scaffold(
          backgroundColor: AppColors.screenBackground,
          resizeToAvoidBottomInset: false, // الخلفية تفضل ثابتة مع الكيبورد
          body: Stack(
            fit: StackFit.expand,
            children: [
              // 1) الخلفية
              Image.asset(
                'assets/images/auth_bg.png',
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter, // التلال والبيت تفضل ظاهرة
              ),
    
              // 2),
   
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const _HeaderPlaceholder(),
                    const SizedBox(height: 16),

                    const Text(
                      AppStrings.loginTitle,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      AppStrings.loginSubtitle,
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.textBody,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // كارت أبيض شبه شفاف حوالين الحقول
                   Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Column(
                        children: [
                          AppTextField(
                            controller: _emailController,
                            hint: AppStrings.emailHint,
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: Validators.email,
                          ),
                          const SizedBox(height: 14),
                          PasswordField(
                            controller: _passwordController,
                            hint: AppStrings.passwordHint,
                            textInputAction: TextInputAction.done,
                            validator: Validators.password,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),

                    // نسيت كلمة المرور
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: TextButton(
                        onPressed: () => context.push('/forgot-password'),
                        child: const Text(
                          AppStrings.forgotPassword,
                          style: TextStyle(
                            color: AppColors.link,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                   BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    return AppButton(
      text: AppStrings.loginButton,
      icon: Icons.arrow_back,
      isLoading: state is LoginLoading,
      onPressed: _onLogin,
    );
  },
),
                    const SizedBox(height: 20),

                    // إنشاء حساب جديد
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          AppStrings.noAccount,
                          style: TextStyle(color: AppColors.textBody),
                        ),
                        GestureDetector(
                          onTap: () => context.push('/register'),
                          child: const Text(
                            AppStrings.createAccount,
                            style: TextStyle(
                              color: AppColors.link,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
          ),
      )
    );
      
    
  }
}

// مؤقت: لحد ما صورة اللوجو والبنت مع الدبدوب توصل
class _HeaderPlaceholder extends StatelessWidget {
  const _HeaderPlaceholder();

  @override
  Widget build(BuildContext context) {
    // لما الصورة توصل:
    // return Image.asset('assets/images/login_header.png', height: 260);
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(28),
      ),
      alignment: Alignment.center,
      child: const Text(
        AppStrings.appName,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w900,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}