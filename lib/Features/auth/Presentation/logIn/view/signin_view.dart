import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frutes_app/core/widgets/custom_app_bar.dart';
import '../widgets/signin_view_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context, title: 'تسجيل الدخول', onTap: () {
        SystemNavigator.pop();
      }),
      body: const SigninViewBody(),
    );
  }
}
