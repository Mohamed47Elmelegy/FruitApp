import '../entity/order_tracking_entity.dart';

abstract class OrderTrackingRepository {
  /// الحصول على جميع الطلبات النشطة للمستخدم
  Future<List<OrderTrackingEntity>> getActiveOrders(String userId);

  /// الحصول على جميع الطلبات غير النشطة (المكتملة/الملغاة) للمستخدم
  Future<List<OrderTrackingEntity>> getInactiveOrders(String userId);

  /// الحصول على تفاصيل تتبع طلب معين
  Future<OrderTrackingEntity?> getOrderTrackingDetails(String trackingNumber);

  /// تحديث حالة الطلب
  Future<void> updateOrderStatus(String orderId, String newStatus);

  /// الحصول على إحصائيات الطلبات للمستخدم
  Future<Map<String, int>> getOrderStatistics(String userId);
}
