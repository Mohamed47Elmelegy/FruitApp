import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/main.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/custom_header.dart';
import 'checkout_steops.dart';
import 'checkout_steps_page_view.dart';

export 'package:frutes_app/Features/check_out/presentation/widgets/active_pageview_items.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Gap(130.h),
                  CheckoutSteps(
                    currentStep: currentStep,
                    onStepTapped: (index) {
                      setState(() {
                        currentStep = index;
                      });
                    },
                  ),
                  const Gap(32),
                  CheckoutStepsPageView(
                    currentStep: currentStep,
                    onPageChanged: (index) {
                      setState(() {
                        currentStep = index;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            child: headerAppBar(
              context,
              title: 'الشحن',
              arrowOnTap: () {
                navigatorKey.currentState?.pop();
              },
              notificationVisible: false,
              arrowVisible: true,
            ),
          ),
        ),
      ],
    );
  }
}
