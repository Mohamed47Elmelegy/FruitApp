import 'package:frutes_app/core/services/database_service.dart';
import '../../domain/Repositories/order_tracking_repository.dart';
import '../../domain/entity/order_tracking_entity.dart';
import '../model/order_tracking_model.dart';

class OrderTrackingRepositoryImpl implements OrderTrackingRepository {
  final DatabaseService databaseService;

  OrderTrackingRepositoryImpl(this.databaseService);

  @override
  Future<List<OrderTrackingEntity>> getActiveOrders(String userId) async {
    try {
      final data = await databaseService.getData(
        path: 'orders',
        query: {
          'where': 'uid',
          'isEqualTo': userId,
          'where2': 'status',
          'isNotEqualTo': 'delivered',
          'where3': 'status',
          'isNotEqualTo2': 'cancelled',
          'orderBy': 'createdAtTimestamp',
          'descending': true,
        },
      ) as List<Map<String, dynamic>>;

      return data
          .map((orderData) => OrderTrackingModel.fromMap(orderData))
          .toList();
    } catch (e) {
      throw Exception('Failed to get active orders: $e');
    }
  }

  @override
  Future<List<OrderTrackingEntity>> getInactiveOrders(String userId) async {
    try {
      final data = await databaseService.getData(
        path: 'orders',
        query: {
          'where': 'uid',
          'isEqualTo': userId,
          'where2': 'status',
          'whereIn': ['delivered', 'cancelled'],
          'orderBy': 'createdAtTimestamp',
          'descending': true,
        },
      ) as List<Map<String, dynamic>>;

      return data
          .map((orderData) => OrderTrackingModel.fromMap(orderData))
          .toList();
    } catch (e) {
      throw Exception('Failed to get inactive orders: $e');
    }
  }

  @override
  Future<OrderTrackingEntity?> getOrderTrackingDetails(
      String trackingNumber) async {
    try {
      final data = await databaseService.getData(
        path: 'orders',
        query: {
          'where': 'trackingNumber',
          'isEqualTo': trackingNumber,
          'limit': 1,
        },
      );

      if (data is List && data.isNotEmpty) {
        return OrderTrackingModel.fromMap(data.first);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get order tracking details: $e');
    }
  }

  @override
  Future<void> updateOrderStatus(String orderId, String newStatus) async {
    try {
      await databaseService.updateData(
        path: 'orders',
        documentId: orderId,
        data: {
          'status': newStatus,
          'updatedAt': DateTime.now().toIso8601String(),
        },
      );
    } catch (e) {
      throw Exception('Failed to update order status: $e');
    }
  }

  @override
  Future<Map<String, int>> getOrderStatistics(String userId) async {
    try {
      final allOrders = await databaseService.getData(
        path: 'orders',
        query: {
          'where': 'uid',
          'isEqualTo': userId,
        },
      ) as List<Map<String, dynamic>>;

      final statistics = <String, int>{
        'total': allOrders.length,
        'pending': 0,
        'approved': 0,
        'preparing': 0,
        'shipping': 0,
        'delivered': 0,
        'cancelled': 0,
      };

      for (final order in allOrders) {
        final status = order['status'] ?? 'pending';
        statistics[status] = (statistics[status] ?? 0) + 1;
      }

      return statistics;
    } catch (e) {
      throw Exception('Failed to get order statistics: $e');
    }
  }
}
