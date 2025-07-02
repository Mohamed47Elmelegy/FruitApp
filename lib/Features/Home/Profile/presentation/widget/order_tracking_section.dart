import 'package:flutter/material.dart';
import 'package:frutes_app/Features/check_out/domain/entity/order_entity.dart';
import 'package:frutes_app/core/routes/page_routes_name.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';

class OrderTrackingSection extends StatelessWidget {
  final OrderEntity order;

  const OrderTrackingSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.green1_100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.green1_500.withValues(alpha: 0.3),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            PageRoutesName.orderTracking,
            arguments: {
              'trackingNumber': order.trackingNumber,
              'source': 'orders_list',
            },
          );
        },
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.green1_500,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.local_shipping,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'تتبع الطلب',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.green1_500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'اضغط لمتابعة شحنتك',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.green1_500.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.green1_500,
            ),
          ],
        ),
      ),
    );
  }
}
