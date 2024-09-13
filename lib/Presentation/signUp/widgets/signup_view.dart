import 'package:flutter/material.dart';
import 'package:frutes_app/core/routes/page_routes_name.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import 'package:frutes_app/core/widgets/account_creation_prompt.dart';
import 'package:frutes_app/core/widgets/custom_text_field.dart';
import 'package:frutes_app/main.dart';
import 'package:gap/gap.dart';

import '../../../core/widgets/butn.dart';
import '../../../core/widgets/terms_and_conditions_checkbox.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
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
                if (value == null || value.trim().isEmpty) {
                  return 'برجاء ادخال الاسم كامل';
                }
                if (value.split(' ').length < 3) {
                  return 'الاسم كامل يجب ان يحتوي على الاسم واللقب';
                }
                if (!RegExp(
                  r'^[a-zA-Z\u0621-\u064A\u0660-\u0669\s]+$',
                ).hasMatch(value)) {
                  return 'الاسم كامل يجب ان يحتوي على الاسم واللقب فقط';
                }
                return null;
              },
            ),
            const Gap(16),
            CustomTextField(
              controller: emailController,
              hint: 'البريد الإلكتروني',
              keyboardType: TextInputType.name,
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'برجاء ادخال البريد الالكتروني';
                }

                if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+(\.[a-zA-Z]+)*$",
                ).hasMatch(value)) {
                  return 'البريد الالكتروني يجب ان يكون صحيح';
                }
                return null;
              },
            ),
            const Gap(16),
            CustomTextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              hint: "كلمة المرور",
              isPassword: true,
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "برجاء ادخال كلمة المرور";
                }

                var regex = RegExp(
                    r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.//n])(?=.*[A-Z])(?=.*[a-z]).*$");
                if (!regex.hasMatch(value)) {
                  return "كلمة المرور يجب ان تكون على الاقل 8 احرف و تحوي حروف كبيرة و صغيرة و ارقام و رموز خاصة.";
                }

                return null;
              },
            ),
            const Gap(16),
            // const TermsAndConditionsCheckbox(),
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
