import 'package:flutter/material.dart';
import 'package:frutes_app/core/theme/text_theme.dart';

AppBar appBar(BuildContext context,
    {required String title, required VoidCallback onTap}) {
  return AppBar(
    actions: const [],
    leading: GestureDetector(
      onTap: onTap,
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
