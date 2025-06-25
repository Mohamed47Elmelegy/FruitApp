import '../entity/order_entity.dart';

abstract class OrderRepository {
  Future<void> saveOrder(OrderEntity order);
}
