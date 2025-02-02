import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/Home/Profile/presentation/manager/cubit/sign_out_cubit.dart';
import '../../../../../core/services/get_it_services.dart';
import '../../../../auth/domain/repositories/auth_repo.dart';
import '../widget/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit(getIt.get<AuthRepo>()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: ProfileViewBody(),
      ),
    );
  }
}
