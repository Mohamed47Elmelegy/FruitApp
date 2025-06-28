import 'package:flutter/material.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import 'package:frutes_app/core/routes/page_routes_name.dart';
import 'package:frutes_app/Features/check_out/domain/entity/order_tracking_entity.dart';
import 'package:frutes_app/Features/check_out/domain/entity/order_entity.dart';
import 'order_tracking_section.dart';

class ActiveOrdersViewBody extends StatelessWidget {
  final List<OrderTrackingEntity> orders;
  final VoidCallback onRefresh;

  const ActiveOrdersViewBody({
    super.key,
    required this.orders,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      color: AppColors.green1_500,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildOrderCard(context, order),
          );
        },
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context, OrderTrackingEntity order) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header with order info
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: order.statusInfo.statusColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: order.statusInfo.statusColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    order.statusInfo.statusIcon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'طلب رقم #${order.orderId}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        order.statusInfo.displayName,
                        style: TextStyle(
                          color: order.statusInfo.statusColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      order.trackingNumber,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      order.createdAt,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Tracking section
          OrderTrackingSection(
            order: _convertToOrderEntity(order),
          ),
          // Action buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        PageRoutesName.orderTracking,
                        arguments: {
                          'trackingNumber': order.trackingNumber,
                          'source': 'active_orders',
                        },
                      );
                    },
                    icon: const Icon(Icons.track_changes),
                    label: const Text('تتبع الطلب'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.green1_500,
                      side: const BorderSide(color: AppColors.green1_500),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implement order details view
                    },
                    icon: const Icon(Icons.info_outline),
                    label: const Text('التفاصيل'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green1_500,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to convert OrderTrackingEntity to OrderEntity for compatibility
  OrderEntity _convertToOrderEntity(OrderTrackingEntity trackingEntity) {
    return OrderEntity(
      uid: '', // This will be filled from the original order data
      products: [], // This will be filled from the original order data
      subtotal: 0.0, // This will be filled from the original order data
      delivery: 0.0, // This will be filled from the original order data
      total: 0.0, // This will be filled from the original order data
      createdAt: trackingEntity.createdAt,
      address: null, // This will be filled from the original order data
      status: trackingEntity.status,
      trackingNumber: trackingEntity.trackingNumber,
      orderId: trackingEntity.orderId,
    );
  }
}
