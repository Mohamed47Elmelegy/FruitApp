import 'package:flutter/material.dart';
import 'package:frutes_app/Presentation/onBording/widgets/page_view_item.dart';
import 'package:frutes_app/core/utils/app_images.dart';
import '../../../core/theme/colors_theme.dart';
import '../../../core/theme/text_theme.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        controller: pageController,
        children: [
          PageViewItem(
            isVisable: true,
            image: Assets.imagesFruitbasketSplash1,
            backgroundImage: Assets.imagesTopBackgroundSplash1,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'مرحبا بك في ',
                  style: AppTextStyles.heading5Bold23,
                ),
                Text(
                  'Hup',
                  style: AppTextStyles.heading5Bold23
                      .copyWith(color: AppColors.orange500),
                ),
                Text(
                  ' Fruit',
                  style: AppTextStyles.heading5Bold23
                      .copyWith(color: AppColors.green1_500),
                ),
              ],
            ),
            description:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          ),
          const PageViewItem(
            isVisable: false,
            image: Assets.imagesPineappleSplash2,
            backgroundImage: Assets.imagesTopBackgroundSplash2,
            title: Text(
              'ابحث وتسوق',
              style: AppTextStyles.heading5Bold23,
            ),
            description:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          ),
        ],
      ),
    );
  }
}
