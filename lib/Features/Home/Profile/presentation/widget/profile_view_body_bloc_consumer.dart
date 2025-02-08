import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/Home/Profile/presentation/manager/cubit/sign_out_cubit.dart';
import 'package:frutes_app/Features/auth/Presentation/signIn/widgets/signin_view_body.dart';
import '../../../../../core/constants/prefs.dart';
import '../../../../../core/routes/page_routes_name.dart';
import '../../../../../core/services/shared_preferences_sengltion.dart';
import '../../../../../core/services/snack_bar_service.dart';
import '../../../../../core/widgets/model_progress_hud.dart';
import '../../../../../main.dart';

class ProfileViewBodyBlocConsumer extends StatelessWidget {
  const ProfileViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          Prefs.remove(SharedPrefs.isLoggedIn);
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
              PageRoutesName.signin, (route) => false); // الانتقال إلى Home
          SnackBarService.showSuccessMessage('تم تسجيل الخروج بنجاح');
        } else if (state is SignOutFailure) {
          SnackBarService.showErrorMessage(state.exception);
        }
      },
      builder: (context, state) {
        return CustomModelProgressHud(
            isLoding: state is SignOutLoading ? true : false,
            child: const SigninViewBody());
      },
    );
  }
}
