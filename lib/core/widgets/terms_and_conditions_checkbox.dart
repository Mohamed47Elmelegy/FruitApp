import 'package:flutter/material.dart';
import 'package:frutes_app/core/config/constants.dart';
import 'package:frutes_app/core/widgets/custom_checkbox.dart';

import '../theme/colors_theme.dart';
import '../theme/text_theme.dart';

class TermsAndConditionsCheckbox extends StatelessWidget {
  const TermsAndConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //  const CustomCheckbox(),
        SizedBox(
          width: Constants.mediaQuery.width * 0.7,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppTextStyles.bodySmallSemiBold13
                      .copyWith(color: AppColors.grayscale400),
                ),
                const TextSpan(
                  text: ' ',
                  style: AppTextStyles.bodySmallSemiBold13,
                ),
                TextSpan(
                  text: 'الشروط',
                  style: AppTextStyles.bodySmallSemiBold13
                      .copyWith(color: AppColors.green1_600),
                ),
                const TextSpan(
                  text: ' ',
                  style: AppTextStyles.bodySmallSemiBold13,
                ),
                TextSpan(
                  text: ' والأحكام',
                  style: AppTextStyles.bodySmallSemiBold13
                      .copyWith(color: AppColors.green1_600),
                ),
                const TextSpan(
                  text: ' ',
                  style: AppTextStyles.bodySmallSemiBold13,
                ),
                TextSpan(
                  text: ' الخاصة بنا',
                  style: AppTextStyles.bodySmallSemiBold13
                      .copyWith(color: AppColors.green1_600),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
