import 'package:flutter/material.dart';
import 'package:frutes_app/core/functions/get_user.dart';
import 'package:frutes_app/core/widgets/notification_widget.dart';
import 'package:gap/gap.dart';
import '../theme/text_theme.dart';
import '../utils/app_images.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.imageProfileImgage,
          width: 55,
          height: 55,
        ),
        const Gap(11),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'صباح الخير !..',
              textAlign: TextAlign.right,
              style: AppTextStyles.bodyBaseRegular16.copyWith(
                color: const Color(0xFF949D9E),
              ),
            ),
            Text(
              getUser().name,
              textAlign: TextAlign.right,
              style: AppTextStyles.bodyBaseBold16,
            ),
          ],
        ),
        const Spacer(),
        const NotificationWidget()
      ],
    );
    // ListTile(
    //   trailing: const NotificationWidget(),
    //   leading: Image.asset(Assets.imageProfileImgage),
    // title: Text(
    //   'صباح الخير !..',
    //   textAlign: TextAlign.right,
    //   style: AppTextStyles.bodyBaseRegular16.copyWith(
    //     color: const Color(0xFF949D9E),
    //   ),
    // ),
    // subtitle: const Text(
    //   'Mohamed Elmelegy',
    //   textAlign: TextAlign.right,
    //   style: AppTextStyles.bodyBaseSemiBold16,
    // ),
    // );
  }
}
