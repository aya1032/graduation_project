import 'package:aman_graduation_broject/core/constant/app_string.dart';
import 'package:aman_graduation_broject/features/auth/cubit/register/register_cubit.dart';
import 'package:aman_graduation_broject/features/auth/cubit/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import 'widgets/password_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _childNameController = TextEditingController();

  bool _acceptedTerms = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    _childNameController.dispose();
    super.dispose();
  }

  void _onRegister() {
    if (!_formKey.currentState!.validate()) return;

    // مؤقتاً: لحد ما نربط الـ RegisterCubit
    //context.go('/fear-selection');
    context.read<RegisterCubit>().register(
      parentFirstName: _firstNameController.text,
      parentLastName: _lastNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      childName: _childNameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
         if (state is RegisterSuccess) {
        context.go('/fear-selection');
      }
      if (state is RegisterError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      }
        // TODO: implement listener
      },
      child: Scaffold(
        backgroundColor: AppColors.screenBackground,
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/auth_bg.png',
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
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
                      // زر الرجوع
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const _HeaderPlaceholder(),
                      const SizedBox(height: 12),

                      const Text(
                        AppStrings.registerTitle,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        AppStrings.registerSubtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textBody,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // كارت بيانات ولي الأمر
                      _SectionCard(
                        title: AppStrings.parentSectionTitle,
                        icon: Icons.person_outline,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: AppTextField(
                                  controller: _firstNameController,
                                  label: AppStrings.parentFirstNameLabel,
                                  hint: AppStrings.parentFirstNameHint,
                                  icon: Icons.person_outline,
                                  textInputAction: TextInputAction.next,
                                  validator: Validators.name,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: AppTextField(
                                  controller: _lastNameController,
                                  label: AppStrings.parentLastNameLabel,
                                  hint: AppStrings.parentLastNameHint,
                                  icon: Icons.person_outline,
                                  textInputAction: TextInputAction.next,
                                  validator: Validators.name,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          AppTextField(
                            controller: _emailController,
                            label: AppStrings.emailLabel,
                            hint: 'name@example.com',
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: Validators.email,
                          ),
                          const SizedBox(height: 12),
                          PasswordField(
                            controller: _passwordController,
                            label: AppStrings.passwordLabel,
                            hint: AppStrings.passwordCreateHint,
                            textInputAction: TextInputAction.next,
                            validator: Validators.password,
                          ),
                          const SizedBox(height: 12),
                          PasswordField(
                            controller: _confirmController,
                            label: AppStrings.confirmPasswordLabel,
                            hint: AppStrings.confirmPasswordHint,
                            textInputAction: TextInputAction.next,
                            validator: (v) => Validators.confirmPassword(
                              _passwordController.text,
                            )(v),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // كارت بيانات الطفل
                      _SectionCard(
                        title: AppStrings.childSectionTitle,
                        icon: Icons.child_care,
                        children: [
                          AppTextField(
                            controller: _childNameController,
                            label: AppStrings.childNameLabel,
                            hint: AppStrings.childNameHint,
                            icon: Icons.person_outline,
                            textInputAction: TextInputAction.done,
                            validator: Validators.name,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // مربع الموافقة
                      Row(
                        children: [
                          Checkbox(
                            value: _acceptedTerms,
                            activeColor: AppColors.buttonPrimary,
                            onChanged: (v) =>
                                setState(() => _acceptedTerms = v ?? false),
                          ),
                          const Expanded(
                            child: Text(
                              AppStrings.acceptTerms,
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textBody,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // الزر معطّل (null) لحد ما الأم توافق
                      BlocBuilder<RegisterCubit, RegisterState>(
  builder: (context, state) {
    return AppButton(
      text: AppStrings.registerButton,
      icon: Icons.arrow_back,
      isLoading: state is RegisterLoading,
      onPressed: _acceptedTerms ? _onRegister : null,
    );
  },
),
                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            AppStrings.haveAccount,
                            style: TextStyle(color: AppColors.textBody),
                          ),
                          GestureDetector(
                            onTap: () => context.pop(),
                            child: const Text(
                              AppStrings.loginLink,
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
      ),
    );
  }
}

// كارت أبيض بعنوان فوقه (قسم ولي الأمر / قسم الطفل)
class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.textPrimary, size: 20),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }
}

// مؤقت: لحد ما صورة اللوجو والأم مع الطفل توصل
class _HeaderPlaceholder extends StatelessWidget {
  const _HeaderPlaceholder();

  @override
  Widget build(BuildContext context) {
    // لما الصورة توصل:
    // return Image.asset('assets/images/register_header.png', height: 180);
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(28),
      ),
      alignment: Alignment.center,
      child: const Text(
        AppStrings.appName,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
