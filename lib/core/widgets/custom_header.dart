import 'package:flutter/material.dart';
import 'package:frutes_app/core/theme/text_theme.dart';
import 'package:frutes_app/core/widgets/notification_widget.dart';

AppBar headerAppBar(BuildContext context,
    {required String title,
    required VoidCallback arrowOnTap,
    required bool arrowVisible,
    required bool notificationVisible
    }) {
  return AppBar(
    actions: [
      notificationVisible == false ? const SizedBox.shrink() : const NotificationWidget(),
    ],
    leading:arrowVisible == false ? const SizedBox.shrink() : GestureDetector(
      child: GestureDetector(
        onTap: arrowOnTap,
        child: const Icon(
          Icons.arrow_back_ios_new,
        ),
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
