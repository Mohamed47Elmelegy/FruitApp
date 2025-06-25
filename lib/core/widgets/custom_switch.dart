import 'package:flutter/material.dart';

import '../theme/colors_theme.dart';

class CustomSwitch extends StatefulWidget {
  final bool isSwitchOn;
  final Function(bool) onChanged;
  const CustomSwitch(
      {super.key, required this.isSwitchOn, required this.onChanged});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(useMaterial3: true),
        child: Switch(
          value: widget.isSwitchOn,
          activeColor: AppColors.green500,
          onChanged: widget.onChanged,
        ));
  }
}
