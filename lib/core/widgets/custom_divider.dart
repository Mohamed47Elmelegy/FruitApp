import 'package:flutter/material.dart';

import '../theme/text_theme.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        SizedBox(
            width: 55.59,
            height: 31,
            child: Text(
              'أو',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyBaseSemiBold16,
            )),
        Expanded(child: Divider()),
      ],
    );
  }
}
