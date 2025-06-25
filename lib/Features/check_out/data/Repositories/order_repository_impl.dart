import '../../domain/Repositories/order_repository.dart';
import '../../domain/entity/order_entity.dart';
import '../model/order_model.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/core/services/database_service.dart';

class OrderRepositoryImpl implements OrderRepository {
  final DatabaseService databaseService;
  OrderRepositoryImpl({DatabaseService? databaseService})
      : databaseService = databaseService ?? getIt<DatabaseService>();

  @override
  Future<void> saveOrder(OrderEntity order) async {
    final orderModel = OrderModel.fromEntity(order);
    await databaseService.addData(path: 'orders', data: orderModel.toMap());
  }
}
