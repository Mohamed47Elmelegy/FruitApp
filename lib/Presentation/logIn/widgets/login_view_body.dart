import 'package:flutter/material.dart';
import 'package:frutes_app/core/widgets/custom_app_bar.dart';
import '../view/login_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context, title: 'تسجيل الدخول'),
      body: const LoginView(),
    );
  }
}
