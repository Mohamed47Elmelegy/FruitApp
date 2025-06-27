import '../Repositories/order_repository.dart';

class DeleteOrderUseCase {
  final OrderRepository orderRepository;

  DeleteOrderUseCase(this.orderRepository);

  Future<void> call(String orderId) async {
    await orderRepository.deleteOrder(orderId);
  }
}
