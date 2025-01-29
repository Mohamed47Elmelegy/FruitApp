import 'package:flutter/material.dart';
import 'package:frutes_app/core/theme/text_theme.dart';
import 'package:frutes_app/core/widgets/notification_widget.dart';

AppBar headerAppBar(BuildContext context,
    {required String title,
    required VoidCallback arrowOnTap,
    required bool arrowVisible,
    required bool notificationVisible,
    Color? color}) {
  return AppBar(
    backgroundColor: color,
    actions: [
      notificationVisible == false
          ? const SizedBox.shrink()
          : const NotificationWidget(),
    ],
    leading: arrowVisible == false
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: arrowOnTap,
            child: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
    centerTitle: true,
    title: title.isNotEmpty
        ? Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLargeBold19,
          )
        : const SizedBox.shrink(),
  );
}
