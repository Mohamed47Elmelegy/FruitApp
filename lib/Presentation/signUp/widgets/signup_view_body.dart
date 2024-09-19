import 'package:flutter/material.dart';
import 'package:frutes_app/core/errors/validators_erros.dart';
import 'package:frutes_app/core/routes/page_routes_name.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import 'package:frutes_app/core/widgets/account_creation_prompt.dart';
import 'package:frutes_app/core/widgets/custom_text_field.dart';
import 'package:frutes_app/main.dart';
import 'package:gap/gap.dart';

import '../../../core/widgets/butn.dart';
import '../../../core/widgets/terms_and_conditions_checkbox.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  bool agreeToTerms = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
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
              controller: nameController,
              hint: 'الاسم كامل',
              keyboardType: TextInputType.name,
              onValidate: (value) {
                return ValidatorsErrors.validateFullName(value!);
              },
            ),
            const Gap(16),
            CustomTextField(
              controller: emailController,
              hint: 'البريد الإلكتروني',
              keyboardType: TextInputType.name,
              onValidate: (value) {
                return ValidatorsErrors.validateEmail(value!);
              },
            ),
            const Gap(16),
            CustomTextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              hint: "كلمة المرور",
              isPassword: true,
              onValidate: (value) {
                return ValidatorsErrors.validatePassword(value!);
              },
            ),
            const Gap(16),
            const TermsAndConditionsCheckbox(),
            const Gap(30),
            Butn(
              text: 'إنشاء حساب جديد',
              color: AppColors.green1_500,
              onPressed: () {
                if (formKey.currentState!.validate()) {}
              },
            ),
            const Gap(26),
            AccountCreationPrompt(
              onPressed: () {
                navigatorKey.currentState
                    ?.pushReplacementNamed(PageRoutesName.login);
              },
              text: 'تمتلك حساب بالفعل؟',
              buttonText: 'تسجيل دخول',
            ),
          ],
        ),
      ),
    );
  }
}
