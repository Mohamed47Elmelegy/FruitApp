import '../entity/order_entity.dart';
import '../Repositories/order_repository.dart';

class SaveOrderUseCase {
  final OrderRepository repository;
  SaveOrderUseCase(this.repository);

  Future<void> call(OrderEntity order) async {
    await repository.saveOrder(order);
  }
}
