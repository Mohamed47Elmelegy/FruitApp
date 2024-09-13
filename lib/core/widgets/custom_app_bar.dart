import 'package:flutter/material.dart';
import 'package:frutes_app/core/theme/text_theme.dart';
import 'package:frutes_app/main.dart';

AppBar appBar(BuildContext context, {required title}) {
  return AppBar(
    actions: const [],
    leading: GestureDetector(
      onTap: () {
        navigatorKey.currentState!.pop();
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: AppTextStyles.bodyLargeBold19,
    ),
  );
}

@override
Size get preferredSize => const Size.fromHeight(kToolbarHeight);
