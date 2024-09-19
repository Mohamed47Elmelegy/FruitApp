import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Presentation/signUp/manager/signup_cubit.dart';
import '../../Presentation/signUp/widgets/signup_view_body.dart';
import '../services/snack_bar_service.dart';

class SignupViewBodyConsumer extends StatelessWidget {
  const SignupViewBodyConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
        } else if (state is SignupFailure) {
          SnackBarService.showErrorMessage(state.exception);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignupLoading ? true : false,
            child: const SignupViewBody());
      },
    );
  }
}
