import '../entity/order_entity.dart';
import '../Repositories/order_repository.dart';

class GetUserOrdersUseCase {
  final OrderRepository repository;
  GetUserOrdersUseCase(this.repository);

  Future<List<OrderEntity>> call(String userId) async {
    return await repository.getUserOrders(userId);
  }
}
