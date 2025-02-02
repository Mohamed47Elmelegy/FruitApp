import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/Home/Profile/presentation/manager/cubit/sign_out_cubit.dart';
import 'package:frutes_app/core/widgets/butn.dart';
import 'package:frutes_app/main.dart';

import '../../../../../core/routes/page_routes_name.dart';
import '../../../../../core/theme/colors_theme.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Butn(
          text: "تسجيل خروج",
          color: AppColors.green1_500,
          onPressed: () {
            {
              context.read<SignOutCubit>().signOut();
              navigatorKey.currentState
                  ?.pushReplacementNamed(PageRoutesName.signin);
            }
          }),
    );
  }
}
