import 'package:flutter/material.dart';

import '../theme/colors_theme.dart';
import '../theme/text_theme.dart';

class AccountCreationPrompt extends StatelessWidget {
  const AccountCreationPrompt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تمتلك حساب؟',
          style: AppTextStyles.bodyBaseSemiBold16.copyWith(
            color: AppColors.grayscale600.withOpacity(0.5),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'قم بانشاء حساب',
            style: AppTextStyles.bodyBaseSemiBold16
                .copyWith(color: AppColors.green1_500),
          ),
        ),
      ],
    );
  }
}
