import 'package:flutter/material.dart';

import '../../../../core/theme/colors_theme.dart';
import '../../../../core/theme/text_theme.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Best Selling View',
            style: AppTextStyles.bodyLargeBold19
                .copyWith(color: AppColors.green1_500)));
  }
}
