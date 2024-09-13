// import 'package:flutter/material.dart';

// import '../theme/colors_theme.dart';
// import '../theme/text_theme.dart';

// class AccountCreationPrompt extends StatelessWidget {
//   const AccountCreationPrompt({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           'لا تمتلك حساب؟',
//           style: AppTextStyles.bodyBaseSemiBold16.copyWith(
//             color: AppColors.grayscale600.withOpacity(0.5),
//           ),
//         ),
//         TextButton(
//           onPressed: () {},
//           child: Text(
//             'قم بانشاء حساب',
//             style: AppTextStyles.bodyBaseSemiBold16
//                 .copyWith(color: AppColors.green1_500),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../theme/colors_theme.dart';
import '../theme/text_theme.dart';

class AccountCreationPrompt extends StatelessWidget {
  const AccountCreationPrompt({
    super.key,
    required this.onPressed,
    required this.text,
    required this.buttonText,
  });
  final VoidCallback onPressed;
  final String text;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyles.bodyBaseSemiBold16.copyWith(
            color: AppColors.grayscale600.withOpacity(0.5),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: AppTextStyles.bodyBaseSemiBold16
                .copyWith(color: AppColors.green1_500),
          ),
        ),
      ],
    );
  }
}
