import '../Repositories/order_tracking_repository.dart';
import '../entity/order_tracking_entity.dart';

class GetActiveOrdersUseCase {
  final OrderTrackingRepository repository;

  GetActiveOrdersUseCase(this.repository);

  Future<List<OrderTrackingEntity>> call(String userId) async {
    return await repository.getActiveOrders(userId);
  }
}
