import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/widgets/model_progress_hud.dart';
import '../manager/cubit/signin_cubit.dart';
import 'signin_view_body.dart';
import '../../../../../core/services/snack_bar_service.dart';

class SigninViewBodyConsumer extends StatelessWidget {
  const SigninViewBodyConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          SnackBarService.showSuccessMessage('تم تسجيل الدخول بنجاح');
        } else if (state is SigninFailure) {
          SnackBarService.showErrorMessage(state.exception);
        }
      },
      builder: (context, state) {
        return CustomModelProgressHud(
            isLoding: state is SigninLoading ? true : false,
            child: const SigninViewBody());
      },
    );
  }
}
