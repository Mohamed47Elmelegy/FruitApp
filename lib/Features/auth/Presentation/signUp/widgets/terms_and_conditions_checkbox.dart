import 'package:flutter/material.dart';
import 'package:frutes_app/core/config/constants.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:frutes_app/Features/auth/Presentation/signUp/widgets/custom_checkbox.dart';

import '../../../../../core/theme/colors_theme.dart';
import '../../../../../core/theme/text_theme.dart';

class TermsAndConditionsCheckbox extends StatefulWidget {
  const TermsAndConditionsCheckbox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  TermsAndConditionsCheckboxState createState() =>
      TermsAndConditionsCheckboxState();
}

class TermsAndConditionsCheckboxState
    extends State<TermsAndConditionsCheckbox> {
  bool isTermsAccept = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          onChecked: (value) {
            isTermsAccept = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccept,
        ).setOnlyPadding(context, 0, 0, 0, 20, enableMediaQuery: false),
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
                TextSpan(
                  text: 'الشروط',
                  style: AppTextStyles.bodySmallSemiBold13
                      .copyWith(color: AppColors.green1_600),
                ),
                TextSpan(
                  text: ' والأحكام الخاصة بنا',
                  style: AppTextStyles.bodySmallSemiBold13
                      .copyWith(color: AppColors.green1_600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
