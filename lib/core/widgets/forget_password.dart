import 'package:flutter/material.dart';

import '../theme/colors_theme.dart';
import '../theme/text_theme.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            'نسيت كلمة المرور؟',
            style: AppTextStyles.bodySmallSemiBold13
                .copyWith(color: AppColors.green1_600),
          ),
        ),
      ],
    );
  }
}
