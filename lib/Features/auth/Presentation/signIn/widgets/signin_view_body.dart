import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/errors/validators_erros.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:frutes_app/core/routes/page_routes_name.dart';
import 'package:frutes_app/core/widgets/butn.dart';
import 'package:frutes_app/core/widgets/custom_text_field.dart';
import 'package:frutes_app/main.dart';
import 'package:gap/gap.dart';
import '../../../../../../../core/theme/colors_theme.dart';
import '../../../../../../../core/widgets/account_creation_prompt.dart';
import '../../../../../../../core/widgets/custom_divider.dart';
import '../../../../../../../core/widgets/forget_password.dart';
import '../manager/cubit/signin_cubit.dart';
import 'apple_signin.dart';
import 'facebook_signin.dart';
import 'google_signin.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
              onSaved: (data) {
                email = data;
              },
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              hint: 'البريد الإلكتروني',
              onValidate: (value) {
                return ValidatorsErrors.validateEmail(value!);
              },
            ),
            const Gap(16),
            CustomTextField(
              onSaved: (data) {
                password = data;
              },
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              hint: 'كلمة المرور',
              isPassword: true,
              onValidate: (value) {
                return ValidatorsErrors.validatePassword(value!);
              },
            ),
            const Gap(16),
            const ForgetPassword(),
            const Gap(33),
            Butn(
              text: 'تسجيل الدخول',
              color: AppColors.green1_500,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<SigninCubit>().signInWithEmailAndPassword(
                        email!,
                        password!,
                      );
                }
              },
            ),
            const Gap(33),
            AccountCreationPrompt(
              onPressed: () {
                navigatorKey.currentState
                    ?.pushReplacementNamed(PageRoutesName.signup);
              },
              text: 'لا تمتلك حساب؟',
              buttonText: 'قم بانشاء حساب',
            ),
            const Gap(37),
            const CustomDivider(),
            const Gap(16),
            const GoogleSignin(),
            const Gap(16),
            const AppleSignin(),
            const Gap(16),
            const FacebookSignin(),
          ],
        ),
      ),
    ).setHorizontalPadding(context, 17, enableMediaQuery: false);
  }
}
