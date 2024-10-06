import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/widgets/model_progress_hud.dart';
import '../../../../../core/constants/prefs.dart';
import '../../../../../core/routes/page_routes_name.dart';
import '../../../../../core/services/shared_preferences_sengltion.dart';
import '../../../../../main.dart';
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
          Prefs.setBool(SharedPrefs.isLoggedIn, true); // حفظ حالة تسجيل الدخول
          navigatorKey.currentState
              ?.pushReplacementNamed(PageRoutesName.home); // الانتقال إلى Home
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
