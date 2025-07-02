import '../Repositories/order_repository.dart';

class CancelOrderUseCase {
  final OrderRepository orderRepository;

  CancelOrderUseCase(this.orderRepository);

  Future<void> call(String orderId, {String? notes}) async {
    await orderRepository.cancelOrder(orderId, notes: notes);
  }
}
