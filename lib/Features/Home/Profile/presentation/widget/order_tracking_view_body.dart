import 'package:flutter/material.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/Features/check_out/domain/Repositories/order_repository.dart';
import '../../../../../core/theme/colors_theme.dart';

class OrderTrackingViewBody extends StatelessWidget {
  final String trackingNumber;
  final String source;

  const OrderTrackingViewBody({
    super.key,
    required this.trackingNumber,
    this.source = 'orders_list',
  });

  Future<Map<String, dynamic>?> fetchOrderByTrackingNumber() async {
    if (trackingNumber.isEmpty) {
      return null;
    }

    try {
      final repo = getIt<OrderRepository>();
      return await repo.getOrderByTrackingNumber(trackingNumber);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Validate tracking number
    if (trackingNumber.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red),
            SizedBox(height: 16),
            Text(
              'رقم التتبع غير صحيح',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    return FutureBuilder<Map<String, dynamic>?>(
      future: fetchOrderByTrackingNumber(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search_off, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'لم يتم العثور على الطلب',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'تأكد من صحة رقم التتبع',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          );
        }

        final order = snapshot.data!;
        final orderId = '#${order['orderId'] ?? order['uid'] ?? ''}';
        final orderDate = order['createdAt'] ?? '';
        final total = order['total']?.toString() ?? '';
        final count = (order['products'] as List?)?.length.toString() ?? '';
        final status = order['status'] ?? 'pending';

        // بناء الخط الزمني بناءً على status
        final steps = [
          _TrackingStep(
              'قيد المراجعة', orderDate, Icons.inventory_2_outlined, true),
          _TrackingStep('تم التأكيد', orderDate, Icons.check_circle_outline,
              status != 'pending'),
          _TrackingStep(
              'قيد المعالجة',
              orderDate,
              Icons.inventory_2_outlined,
              status == 'processing' ||
                  status == 'shipping' ||
                  status == 'delivered'),
          _TrackingStep('تم شحن الطلب', orderDate, Icons.location_on_outlined,
              status == 'shipping' || status == 'delivered'),
          _TrackingStep(
              'خرج للتوصيل',
              status == 'shipping' ? 'قيد الانتظار' : '',
              Icons.local_shipping_outlined,
              status == 'shipping' || status == 'delivered'),
          _TrackingStep('تم تسليم', '', Icons.shopping_cart_outlined,
              status == 'delivered'),
        ];

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Card بيانات الطلب
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('$orderId :طلب رقم',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 4),
                            Text('تاريخ الطلب: $orderDate',
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.black54)),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text('عدد الطلبات: $count',
                                    style: const TextStyle(fontSize: 13)),
                                const SizedBox(width: 16),
                                Text('جنيه $total',
                                    style: const TextStyle(fontSize: 13)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.green1_100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.inventory_2_outlined,
                            color: AppColors.green1_500, size: 32),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // الخط الزمني
                Container(
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStep(_TrackingStep step, bool showLine) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: step.active ? AppColors.green1_100 : Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Icon(step.icon,
                  color: step.active ? AppColors.green1_500 : Colors.grey,
                  size: 24),
            ),
            if (showLine)
              Container(
                width: 2,
                height: 40,
                color: Colors.grey[300],
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
                Text(step.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: step.active ? Colors.black : Colors.grey)),
                if (step.subtitle.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(step.subtitle,
                        style: const TextStyle(
                            fontSize: 13, color: Colors.black54)),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TrackingStep {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool active;
  _TrackingStep(this.title, this.subtitle, this.icon, this.active);
}
