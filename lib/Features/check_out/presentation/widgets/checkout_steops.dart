import 'package:flutter/material.dart';
import 'package:frutes_app/Features/check_out/presentation/widgets/animated_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentStep,
  });

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            getSteps().length,
            (index) => AnimatedStepItem(
              text: getSteps()[index],
              index: index,
              isActive: index == currentStep,
              isCompleted: index < currentStep,
            ),
          ),
        ],
      ),
    );
  }

  List<String> getSteps() {
    return ['الشحن', 'العنوان', 'التفاصيل'];
  }
}
