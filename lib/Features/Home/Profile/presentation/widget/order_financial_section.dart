import 'package:flutter/material.dart';
import 'package:frutes_app/Features/check_out/domain/entity/order_entity.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';

class OrderFinancialSection extends StatelessWidget {
  final OrderEntity order;

  const OrderFinancialSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.green1_500.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.green1_500.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('المجموع الفرعي:'),
              Text('${order.subtotal.toStringAsFixed(2)} ج.م'),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('الشحن:'),
              Text('${order.delivery.toStringAsFixed(2)} ج.م'),
            ],
          ),
          const Divider(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'الإجمالي:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '${order.total.toStringAsFixed(2)} ج.م',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.green1_500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
