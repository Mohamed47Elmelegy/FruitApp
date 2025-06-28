import 'package:flutter/material.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import 'package:frutes_app/Features/check_out/domain/entity/order_tracking_entity.dart';

class OrderTrackingTimeline extends StatelessWidget {
  final List<OrderTrackingStep> steps;

  const OrderTrackingTimeline({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: List.generate(steps.length, (index) {
          final step = steps[index];
          final isLast = index == steps.length - 1;
          return _buildStep(step, !isLast);
        }),
      ),
    );
  }

  Widget _buildStep(OrderTrackingStep step, bool showLine) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: step.isActive
                    ? step.activeColor.withOpacity(0.2)
                    : Colors.grey[200],
                shape: BoxShape.circle,
                border: step.isActive
                    ? Border.all(color: step.activeColor, width: 2)
                    : null,
              ),
              child: Icon(
                step.icon,
                color: step.isActive ? step.activeColor : Colors.grey,
                size: 24,
              ),
            ),
            if (showLine)
              Container(
                width: 2,
                height: 40,
                color: step.isActive
                    ? step.activeColor.withOpacity(0.3)
                    : Colors.grey[300],
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: step.isActive ? Colors.black : Colors.grey,
                  ),
                ),
                if (step.subtitle.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      step.subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                if (step.completedAt != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      'تم في: ${step.completedAt}',
                      style: TextStyle(
                        fontSize: 12,
                        color: step.activeColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
