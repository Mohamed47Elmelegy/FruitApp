import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../Features/auth/Presentation/signIn/manager/cubit/signin_cubit.dart';
import '../../Features/auth/Presentation/signIn/widgets/signin_view_body.dart';
import '../services/snack_bar_service.dart';

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
        return ModalProgressHUD(
            inAsyncCall: state is SigninLoading ? true : false,
            child: const SigninViewBody());
      },
    );
  }
}
