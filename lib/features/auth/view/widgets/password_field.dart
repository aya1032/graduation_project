import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.hint,
    this.label,
    this.validator,
    this.textInputAction,
  });

  final TextEditingController controller;
  final String hint;
  final String? label;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true; // مخفي في البداية

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      hint: widget.hint,
      label: widget.label,
      icon: Icons.lock_outline,
      obscureText: _obscure,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.visiblePassword,
      suffix: IconButton(
        icon: Icon(
          _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: AppColors.fieldIcon,
          size: 22,
        ),
        onPressed: () => setState(() => _obscure = !_obscure),
      ),
    );
  }
}