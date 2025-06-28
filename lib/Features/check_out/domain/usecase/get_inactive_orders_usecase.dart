import '../Repositories/order_tracking_repository.dart';
import '../entity/order_tracking_entity.dart';

class GetInactiveOrdersUseCase {
  final OrderTrackingRepository repository;

  GetInactiveOrdersUseCase(this.repository);

  Future<List<OrderTrackingEntity>> call(String userId) async {
    return await repository.getInactiveOrders(userId);
  }
}
