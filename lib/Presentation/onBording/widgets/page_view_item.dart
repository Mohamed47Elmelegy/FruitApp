import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frutes_app/core/config/constants.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:frutes_app/core/theme/text_theme.dart';
import 'package:frutes_app/main.dart';
import 'package:gap/gap.dart';
import '../../../core/routes/page_routes_name.dart';
import '../../../core/services/shared_preferences_sengltion.dart';
import '../../../core/theme/colors_theme.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.description,
    required this.isVisable,
  });

  final String image, backgroundImage;
  final Widget title;
  final String description;
  final bool isVisable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Constants.mediaQuery.width,
          height: Constants.mediaQuery.height * 0.4,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              GestureDetector(
                onTap: () {
                  Prefs.setBool(Constants.hasSeenOnboarding, true);
                  navigatorKey.currentState?.pushNamed(PageRoutesName.login);
                },
                child: Visibility(
                  visible: isVisable,
                  child: Text(
                    'تخط',
                    style: AppTextStyles.bodySmallRegular13
                        .copyWith(color: AppColors.grayscale400),
                  ),
                ),
              ).setAllPadding(context, 16, enableMediaQuery: false),
            ],
          ),
        ),
        const Gap(30),
        title,
        const Gap(24),
        Text(
          description,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodySmallSemiBold13,
        ).setHorizontalPadding(
          context,
          37,
          enableMediaQuery: false,
        ),
        const Gap(64), // Add gap between description and dots
      ],
    );
  }
}
