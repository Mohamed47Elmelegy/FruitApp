import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/widgets/model_progress_hud.dart';
import '../../../../../core/routes/page_routes_name.dart';
import '../../../../../main.dart';
import '../manager/signup_cubit.dart';
import 'signup_view_body.dart';
import '../../../../../core/services/snack_bar_service.dart';

class SignupViewBodyConsumer extends StatelessWidget {
  const SignupViewBodyConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          SnackBarService.showSuccessMessage('تم انشاء حسابك بنجاح');
          navigatorKey.currentState
              ?.pushReplacementNamed(PageRoutesName.signin);
        } else if (state is SignupFailure) {
          SnackBarService.showErrorMessage(state.exception);
        }
      },
      builder: (context, state) {
        return CustomModelProgressHud(
            isLoding: state is SignupLoading ? true : false,
            child: const SignupViewBody());
      },
    );
  }
}
