import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/errors/validators_erros.dart';
import 'package:frutes_app/core/routes/page_routes_name.dart';
import 'package:frutes_app/core/services/snack_bar_service.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import 'package:frutes_app/core/widgets/account_creation_prompt.dart';
import 'package:frutes_app/core/widgets/custom_text_field.dart';
import 'package:frutes_app/main.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/widgets/butn.dart';
import 'terms_and_conditions_checkbox.dart';
import '../manager/signup_cubit.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({
    super.key,
  });

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late bool isTermsAccept = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, password, email;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Column(
          children: [
            const Gap(24),
            CustomTextField(
              onSaved: (value) {
                name = value!;
              },
              controller: nameController,
              hint: 'الاسم كامل',
              keyboardType: TextInputType.name,
              onValidate: (value) {
                return ValidatorsErrors.validateFullName(value!);
              },
            ),
            const Gap(16),
            CustomTextField(
              onSaved: (value) {
                email = value!;
              },
              controller: emailController,
              hint: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
              onValidate: (value) {
                return ValidatorsErrors.validateEmail(value!);
              },
            ),
            const Gap(16),
            CustomTextField(
              onSaved: (value) {
                password = value!;
              },
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              hint: "كلمة المرور",
              isPassword: true,
              onValidate: (value) {
                return ValidatorsErrors.validatePassword(value!);
              },
            ),
            const Gap(16),
            TermsAndConditionsCheckbox(
              onChanged: (value) {
                isTermsAccept = value;
                setState(() {});
              },
            ),
            const Gap(30),
            Butn(
              text: 'إنشاء حساب جديد',
              color: AppColors.green1_500,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  if (isTermsAccept) {
                    context.read<SignupCubit>().createUserWithEmailAndPassword(
                          name,
                          email,
                          password,
                        );
                  } else {
                    SnackBarService.showErrorMessage(
                        'يجب عليك الموافقة علي الشروط');
                  }
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
            const Gap(26),
            AccountCreationPrompt(
              onPressed: () {
                navigatorKey.currentState
                    ?.pushReplacementNamed(PageRoutesName.signin);
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
