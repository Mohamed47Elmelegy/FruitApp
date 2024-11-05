import 'package:flutter/material.dart';
import 'package:frutes_app/main.dart';

import '../../../../core/routes/page_routes_name.dart';
import '../../../../core/theme/text_theme.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorKey.currentState?.pushNamed(PageRoutesName.bestSellingView);
      },
      child: Row(
        children: [
          const Text(
            'الأكثر مبيعًا',
            textAlign: TextAlign.right,
            style: AppTextStyles.bodyBaseBold16,
          ),
          const Spacer(),
          Text(
            'المزيد',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmallRegular13.copyWith(
              color: const Color(0xFF949D9E),
            ),
          )
        ],
      ),
    );
  }
}
