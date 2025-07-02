import 'package:flutter/material.dart';

class OrderStatusChip extends StatelessWidget {
  final String status;

  const OrderStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
    IconData icon;

    switch (status) {
      case 'pending':
        color = Colors.orange;
        text = 'قيد المراجعة';
        icon = Icons.schedule;
        break;
      case 'confirmed':
        color = Colors.blue;
        text = 'تم التأكيد';
        icon = Icons.check_circle_outline;
        break;
      case 'processing':
        color = Colors.purple;
        text = 'قيد المعالجة';
        icon = Icons.inventory_2_outlined;
        break;
      case 'shipping':
        color = Colors.blue;
        text = 'قيد الشحن';
        icon = Icons.local_shipping;
        break;
      case 'delivered':
        color = Colors.green;
        text = 'تم التوصيل';
        icon = Icons.check_circle;
        break;
      case 'cancelled':
        color = Colors.red;
        text = 'ملغي';
        icon = Icons.cancel;
        break;
      case 'refunded':
        color = Colors.grey;
        text = 'تم الاسترداد';
        icon = Icons.money_off_outlined;
        break;
      default:
        color = Colors.grey;
        text = 'غير محدد';
        icon = Icons.help;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
