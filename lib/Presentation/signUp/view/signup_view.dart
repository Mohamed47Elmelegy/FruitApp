import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:frutes_app/core/routes/page_routes_name.dart';
import 'package:frutes_app/main.dart';
import '../../../core/services/get_it_services.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/signup_view_body_consumer.dart';
import '../../../domin/auth/repositories/auth_repo.dart';
import '../manager/signup_cubit.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(context,
            title: 'حساب جديد',
            onTap: () => navigatorKey.currentState
                ?.pushReplacementNamed(PageRoutesName.login)),
        body: const SignupViewBodyConsumer().setHorizontalPadding(
          context,
          16,
          enableMediaQuery: false,
        ),
      ),
    );
  }
}
