import 'package:flutter/material.dart';
import 'package:frutes_app/Features/check_out/presentation/widgets/animated_step_item.dart';

class CheckoutSteops extends StatelessWidget {
  const CheckoutSteops({
    super.key,
    required this.currentStep,
    required this.onStepTapped,
  });

  final int currentStep;
  final Function(int) onStepTapped;

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
              onTap: () => onStepTapped(index),
            ),
          ),
        ],
      ),
    );
  }

  List<String> getSteps() {
    return ['الشحن', 'العنوان', 'المدفوع', 'التوصيل'];
  }
}
