import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:frutes_app/Presentation/onBording/widgets/onbording_page_view.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:gap/gap.dart';
import '../../../core/config/constants.dart';
import '../../../core/routes/page_routes_name.dart';
import '../../../core/services/shared_preferences_sengltion.dart';
import '../../../core/theme/colors_theme.dart';
import '../../../core/widgets/butn.dart';
import '../../../main.dart';

class OnBordingViewBody extends StatefulWidget {
  const OnBordingViewBody({super.key});

  @override
  State<OnBordingViewBody> createState() => _OnBordingViewBodyState();
}

class _OnBordingViewBodyState extends State<OnBordingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(
      () {
        currentPage = pageController.page!.round();
        setState(
          () {},
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: OnboardingPageView(
              pageController: pageController,
            ),
          ),
          DotsIndicator(
            dotsCount: 2,
            decorator: DotsDecorator(
              activeColor: AppColors.green1_500,
              color: currentPage == 1
                  ? AppColors.green1_500
                  : AppColors.green1_500.withOpacity(
                      0.5,
                    ),
              spacing: const EdgeInsets.all(
                10.0,
              ),
            ),
          ),
          const Gap(29),
          Visibility(
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            visible: currentPage == 1 ? true : false,
            child: Butn(
              color: AppColors.green1_500,
              text: 'أبداء الأن',
              onPressed: () {
                Prefs.setBool(Constants.hasSeenOnboarding, true);
                navigatorKey.currentState?.pushNamed(
                  PageRoutesName.login,
                );
              },
            ).setHorizontalPadding(
              context,
              16,
              enableMediaQuery: false,
            ),
          ),
          const Gap(43),
        ],
      ),
    );
  }
}
