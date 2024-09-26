import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomModelProgressHud extends StatelessWidget {
  const CustomModelProgressHud(
      {super.key, required this.isLoding, required this.child});
  final bool isLoding;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: child,
    );
  }
}
