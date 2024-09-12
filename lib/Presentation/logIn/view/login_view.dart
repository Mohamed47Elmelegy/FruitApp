import 'package:flutter/material.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:frutes_app/core/theme/text_theme.dart';
import 'package:frutes_app/core/widgets/butn.dart';
import 'package:frutes_app/core/widgets/custom_text_field.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/colors_theme.dart';
import '../../../core/widgets/account_creation_prompt.dart';
import '../../../core/widgets/custom_divider.dart';
import '../../../core/widgets/forget_password.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const Gap(24),
            CustomTextField(
              onChanged: (data) {
                email = data;
              },
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              hint: 'البريد الإلكتروني',
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'برجاء ادخال البريد الالكتروني';
                }
                return null;
              },
            ),
            const Gap(16),
            CustomTextField(
              onChanged: (data) {
                email = data;
              },
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              hint: 'كلمة المرور',
              isPassword: true,
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'يرجي ادخال كلمة المرور';
                }
                return null;
              },
            ),
            const Gap(16),
            const ForgetPassword(),
            const Gap(33),
            Butn(
                text: 'تسجيل الدخول',
                color: AppColors.green1_500,
                onPressed: () {}),
            const Gap(33),
            const AccountCreationPrompt(),
            const Gap(37),
            const CustomDivider(),
          ],
        ),
      ),
    ).setHorizontalPadding(context, 17, enableMediaQuery: false);
  }
}
