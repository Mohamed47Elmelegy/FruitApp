import 'package:flutter/material.dart';
import '../../domain/entity/order_tracking_entity.dart';

class OrderTrackingModel extends OrderTrackingEntity {
  OrderTrackingModel({
    required super.orderId,
    required super.trackingNumber,
    required super.status,
    required super.createdAt,
    super.updatedAt,
    required super.steps,
    required super.statusInfo,
  });

  factory OrderTrackingModel.fromMap(Map<String, dynamic> map) {
    final status = map['status'] ?? 'pending';
    final statusInfo = OrderStatusInfo.fromStatus(status);
    final steps = _buildTrackingSteps(status, map['createdAt'] ?? '');

    return OrderTrackingModel(
      orderId: map['orderId'] ?? map['uid'] ?? '',
      trackingNumber: map['trackingNumber'] ?? '',
      status: status,
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'],
      steps: steps,
      statusInfo: statusInfo,
    );
  }

  factory OrderTrackingModel.fromEntity(OrderTrackingEntity entity) {
    return OrderTrackingModel(
      orderId: entity.orderId,
      trackingNumber: entity.trackingNumber,
      status: entity.status,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      steps: entity.steps,
      statusInfo: entity.statusInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'trackingNumber': trackingNumber,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  /// بناء خطوات التتبع بناءً على حالة الطلب
  static List<OrderTrackingStep> _buildTrackingSteps(
      String status, String orderDate) {
    final statusEnum = OrderStatus.fromString(status);

    return [
      OrderTrackingStep(
        title: 'قيد المراجعة',
        subtitle: orderDate,
        icon: Icons.inventory_2_outlined,
        isActive: true,
        isCompleted: statusEnum != OrderStatus.pending,
        activeColor: const Color(0xFFFF9800),
      ),
      OrderTrackingStep(
        title: 'تم قبول الطلب',
        subtitle: orderDate,
        icon: Icons.check_circle_outline,
        isActive: statusEnum != OrderStatus.pending,
        isCompleted: statusEnum.index > OrderStatus.pending.index,
        activeColor: const Color(0xFF2196F3),
      ),
      OrderTrackingStep(
        title: 'قيد التجهيز',
        subtitle: orderDate,
        icon: Icons.inventory_2_outlined,
        isActive: statusEnum == OrderStatus.preparing,
        isCompleted: statusEnum.index > OrderStatus.preparing.index,
        activeColor: const Color(0xFF9C27B0),
      ),
      OrderTrackingStep(
        title: 'خرج للتوصيل',
        subtitle: statusEnum == OrderStatus.shipping ? 'قيد الانتظار' : '',
        icon: Icons.local_shipping_outlined,
        isActive: statusEnum == OrderStatus.shipping ||
            statusEnum == OrderStatus.delivered,
        isCompleted: statusEnum == OrderStatus.delivered,
        activeColor: const Color(0xFF4CAF50),
      ),
      OrderTrackingStep(
        title: 'تم تسليم',
        subtitle: '',
        icon: Icons.shopping_cart_outlined,
        isActive: statusEnum == OrderStatus.delivered,
        isCompleted: statusEnum == OrderStatus.delivered,
        activeColor: const Color(0xFF4CAF50),
      ),
    ];
  }
}
