import 'package:flutter/material.dart';

/// Entity لتتبع حالة الطلب
class OrderTrackingEntity {
  final String orderId;
  final String trackingNumber;
  final String status;
  final String createdAt;
  final String? updatedAt;
  final List<OrderTrackingStep> steps;
  final OrderStatusInfo statusInfo;

  OrderTrackingEntity({
    required this.orderId,
    required this.trackingNumber,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    required this.steps,
    required this.statusInfo,
  });
}

/// Entity لخطوة تتبع الطلب
class OrderTrackingStep {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isActive;
  final bool isCompleted;
  final String? completedAt;
  final Color activeColor;
  final Color inactiveColor;

  OrderTrackingStep({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isActive,
    required this.isCompleted,
    this.completedAt,
    this.activeColor = const Color(0xFF4CAF50),
    this.inactiveColor = const Color(0xFF9E9E9E),
  });
}

/// Entity لمعلومات حالة الطلب
class OrderStatusInfo {
  final String status;
  final String displayName;
  final Color statusColor;
  final IconData statusIcon;
  final String description;

  OrderStatusInfo({
    required this.status,
    required this.displayName,
    required this.statusColor,
    required this.statusIcon,
    required this.description,
  });

  /// الحصول على معلومات الحالة بناءً على status string
  factory OrderStatusInfo.fromStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return OrderStatusInfo(
          status: status,
          displayName: 'قيد المراجعة',
          statusColor: const Color(0xFFFF9800),
          statusIcon: Icons.inventory_2_outlined,
          description: 'طلبك قيد المراجعة من قبل فريقنا',
        );
      case 'approved':
        return OrderStatusInfo(
          status: status,
          displayName: 'تم قبول الطلب',
          statusColor: const Color(0xFF2196F3),
          statusIcon: Icons.check_circle_outline,
          description: 'تم قبول طلبك وسيتم تجهيزه قريباً',
        );
      case 'preparing':
        return OrderStatusInfo(
          status: status,
          displayName: 'قيد التجهيز',
          statusColor: const Color(0xFF9C27B0),
          statusIcon: Icons.inventory_2_outlined,
          description: 'طلبك قيد التجهيز والتعبئة',
        );
      case 'shipping':
        return OrderStatusInfo(
          status: status,
          displayName: 'خرج للتوصيل',
          statusColor: const Color(0xFF4CAF50),
          statusIcon: Icons.local_shipping_outlined,
          description: 'طلبك في الطريق إليك',
        );
      case 'delivered':
        return OrderStatusInfo(
          status: status,
          displayName: 'تم التسليم',
          statusColor: const Color(0xFF4CAF50),
          statusIcon: Icons.shopping_cart_outlined,
          description: 'تم تسليم طلبك بنجاح',
        );
      case 'cancelled':
        return OrderStatusInfo(
          status: status,
          displayName: 'تم الإلغاء',
          statusColor: const Color(0xFFF44336),
          statusIcon: Icons.cancel_outlined,
          description: 'تم إلغاء الطلب',
        );
      default:
        return OrderStatusInfo(
          status: status,
          displayName: 'غير محدد',
          statusColor: const Color(0xFF9E9E9E),
          statusIcon: Icons.help_outline,
          description: 'حالة غير محددة',
        );
    }
  }
}

/// Enum لحالات الطلب
enum OrderStatus {
  pending('pending'),
  approved('approved'),
  preparing('preparing'),
  shipping('shipping'),
  delivered('delivered'),
  cancelled('cancelled');

  const OrderStatus(this.value);
  final String value;

  static OrderStatus fromString(String value) {
    return OrderStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => OrderStatus.pending,
    );
  }
}
