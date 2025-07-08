import 'package:flutter/material.dart';
import 'package:frutes_app/Features/check_out/domain/entity/order_entity.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import 'package:frutes_app/core/services/app_settings_service.dart';

class OrderFinancialSection extends StatelessWidget {
  final OrderEntity order;

  const OrderFinancialSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppSettings>(
      future: AppSettingsService.fetchAppSettings(),
      builder: (context, snapshot) {
        final currency = snapshot.data?.currency ?? 'ج.م';
        final delivery = (order.delivery == 0 || order.delivery == null)
            ? (snapshot.data?.deliveryFee ?? 0)
            : order.delivery;
        final subtotal = order.subtotal;
        final total = subtotal + delivery;
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
                  Text('${subtotal.toStringAsFixed(2)} $currency'),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('الشحن:'),
                  Text('${delivery.toStringAsFixed(2)} $currency'),
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
                    '${total.toStringAsFixed(2)} $currency',
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
      },
    );
  }
}
