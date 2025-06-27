import '../entity/order_entity.dart';

abstract class OrderRepository {
  Future<String> saveOrder(OrderEntity order);
  Future<List<OrderEntity>> getUserOrders(String userId);
  Future<Map<String, dynamic>?> getOrderByTrackingNumber(String trackingNumber);
  Future<void> deleteOrder(String orderId);
}
