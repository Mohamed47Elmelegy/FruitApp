import 'package:frutes_app/core/functions/order_utils.dart';

class OrderEntity {
  final String uid;
  final List<Map<String, dynamic>> products;
  final double subtotal;
  final double delivery;
  final double total;
  final String createdAt;
  final Map<String, dynamic>? address;
  final String status;
  final String? trackingNumber;
  final String? orderId;

  OrderEntity({
    required this.uid,
    required this.products,
    required this.subtotal,
    required this.delivery,
    required this.total,
    required this.createdAt,
    required this.address,
    required this.status,
    this.trackingNumber,
    this.orderId,
  });

  /// الحصول على معرف الطلب المنسق للعرض
  String get displayOrderId => OrderUtils.getOrderId(this);

  /// الحصول على التاريخ المنسق للعرض
  String get displayDate => OrderUtils.formatDate(createdAt);

  bool get isCancelled => status.toLowerCase() == 'cancelled';
  bool get isRefunded => status.toLowerCase() == 'refunded';

  /// احسب الإيرادات الكلية (تستثني الملغاة والمسترجعة)
  static double totalRevenue(List<OrderEntity> orders) => orders
      .where((order) => !order.isCancelled && !order.isRefunded)
      .fold(0, (sum, order) => sum + order.total);
}
