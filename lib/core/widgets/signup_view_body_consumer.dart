import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Presentation/signUp/manager/signup_cubit.dart';
import '../../Presentation/signUp/widgets/signup_view_body.dart';

class SignupViewBodyConsumer extends StatelessWidget {
  const SignupViewBodyConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {},
      builder: (context, state) {
        return const SignupViewBody();
      },
    );
  }
}
