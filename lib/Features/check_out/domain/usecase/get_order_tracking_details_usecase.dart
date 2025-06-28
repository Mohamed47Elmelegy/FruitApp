import '../Repositories/order_tracking_repository.dart';
import '../entity/order_tracking_entity.dart';

class GetOrderTrackingDetailsUseCase {
  final OrderTrackingRepository repository;

  GetOrderTrackingDetailsUseCase(this.repository);

  Future<OrderTrackingEntity?> call(String trackingNumber) async {
    return await repository.getOrderTrackingDetails(trackingNumber);
  }
}
