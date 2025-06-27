import '../entity/order_entity.dart';
import '../Repositories/order_repository.dart';

class SaveOrderUseCase {
  final OrderRepository repository;
  SaveOrderUseCase(this.repository);

  Future<String> call(OrderEntity order) async {
    return await repository.saveOrder(order);
  }
}
