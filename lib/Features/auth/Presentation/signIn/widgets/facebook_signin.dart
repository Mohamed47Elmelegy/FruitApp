import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import '../../../../../core/utils/app_images.dart';
import 'custom_platform_signin.dart';
import '../manager/cubit/signin_cubit.dart';

class FacebookSignin extends StatelessWidget {
  const FacebookSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformSignin(
        width: 343,
        height: 56,
        icon: SvgPicture.asset(Assets.facebookIcons).setAllPadding(
          context,
          16,
          enableMediaQuery: false,
        ),
        label: 'تسجيل بواسطة فيسبوك',
        onPressed: () {
          context.read<SigninCubit>().signInWithFacebook();
        },
        color: Colors.transparent,
        textColor: Colors.black,
        borderColor: const Color(0xffDDDFDF),
        borderRadius: 16);
  }
}
