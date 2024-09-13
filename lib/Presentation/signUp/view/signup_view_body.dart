import 'package:flutter/material.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:frutes_app/core/routes/page_routes_name.dart';
import 'package:frutes_app/main.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../widgets/signup_view.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context,
          title: 'حساب جديد',
          onTap: () => navigatorKey.currentState
              ?.pushReplacementNamed(PageRoutesName.login)),
      body: const SignupView().setHorizontalPadding(
        context,
        16,
        enableMediaQuery: false,
      ),
    );
  }
}
