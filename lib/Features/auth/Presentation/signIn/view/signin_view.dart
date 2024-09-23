import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/core/widgets/custom_app_bar.dart';
import 'package:frutes_app/core/widgets/signin_view_body_consumer.dart';
import '../../../domin/repositories/auth_repo.dart';
import '../manager/cubit/signin_cubit.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(context, title: 'تسجيل الدخول', onTap: () {
          SystemNavigator.pop();
        }),
        body: const SigninViewBodyConsumer().setHorizontalPadding(
          context,
          16,
          enableMediaQuery: false,
        ),
      ),
    );
  }
}
