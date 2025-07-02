import '../../domain/Repositories/order_repository.dart';
import '../../domain/entity/order_entity.dart';
import '../model/order_model.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/core/services/database_service.dart';
import 'package:uuid/uuid.dart';

class OrderRepositoryImpl implements OrderRepository {
  final DatabaseService databaseService;
  OrderRepositoryImpl({DatabaseService? databaseService})
      : databaseService = databaseService ?? getIt<DatabaseService>();

  @override
  Future<String> saveOrder(OrderEntity order) async {
    try {
      // إنشاء رقم تتبع فريد
      final trackingNumber = _generateTrackingNumber();

      // إنشاء document ID فريد للطلب
      final orderId = const Uuid().v4();

      // إنشاء order entity مع رقم التتبع و orderId
      final orderWithTracking = OrderEntity(
        uid: order.uid,
        products: order.products,
        subtotal: order.subtotal,
        delivery: order.delivery,
        total: order.total,
        createdAt: order.createdAt,
        address: order.address,
        status: order.status,
        trackingNumber: trackingNumber,
        orderId: orderId,
      );

      final orderModel = OrderModel(
        uid: orderWithTracking.uid,
        products: orderWithTracking.products,
        subtotal: orderWithTracking.subtotal,
        delivery: orderWithTracking.delivery,
        total: orderWithTracking.total,
        createdAt: orderWithTracking.createdAt,
        address: orderWithTracking.address,
        status: orderWithTracking.status,
        trackingNumber: orderWithTracking.trackingNumber,
        orderId: orderWithTracking.orderId,
      );

      // إضافة metadata إضافية للطلب
      final orderData = {
        ...orderModel.toJson(),
        'createdAtTimestamp': DateTime.now().millisecondsSinceEpoch,
        'updatedAt': DateTime.now().toIso8601String(),
      };

      await databaseService.addData(
        path: 'orders',
        data: orderData,
        documentId: orderId,
      );
      return trackingNumber;
    } catch (e) {
      throw Exception('Failed to save order: $e');
    }
  }

  @override
  Future<List<OrderEntity>> getUserOrders(String userId) async {
    try {
      final data = await databaseService.getData(
        path: 'orders',
        query: {
          'where': 'uid',
          'isEqualTo': userId,
          'orderBy': 'createdAtTimestamp',
          'descending': true,
        },
      ) as List<Map<String, dynamic>>;

      return data.map((orderData) => OrderModel.fromJson(orderData)).toList();
    } catch (e) {
      throw Exception('Failed to get user orders: $e');
    }
  }

  @override
  Future<Map<String, dynamic>?> getOrderByTrackingNumber(
      String trackingNumber) async {
    final data = await databaseService.getData(
      path: 'orders',
      query: {
        'where': 'trackingNumber',
        'isEqualTo': trackingNumber,
        'limit': 1,
      },
    );
    if (data is List && data.isNotEmpty) {
      return data.first;
    }
    return null;
  }

  @override
  Future<void> deleteOrder(String orderId) async {
    try {
      await databaseService.deleteData(
        path: 'orders',
        documentId: orderId,
      );
    } catch (e) {
      throw Exception('Failed to delete order: $e');
    }
  }

  @override

  /// Cancel order and remove tracking number
  Future<void> cancelOrder(String orderId, {String? notes}) async {
    try {
      // Get current order data
      final orderData = await databaseService.getData(
        path: 'orders',
        documentId: orderId,
      ) as Map<String, dynamic>?;

      if (orderData == null) {
        throw Exception('Order not found');
      }

      // Create status history entry
      final statusHistory = orderData['statusHistory'] ?? [];
      statusHistory.add({
        'status': 'cancelled',
        'updatedBy': orderData['uid'],
        'updatedAt': DateTime.now().toIso8601String(),
        'notes': notes ?? 'Order cancelled by customer',
      });

      // Update order - remove tracking number when cancelled
      await databaseService.updateData(
        path: 'orders',
        documentId: orderId,
        data: {
          'status': 'cancelled',
          'trackingNumber': null, // Remove tracking number
          'lastUpdated': DateTime.now().toIso8601String(),
          'statusHistory': statusHistory,
          'cancelledAt': DateTime.now().toIso8601String(),
          'cancelledBy': orderData['uid'],
        },
      );
    } catch (e) {
      throw Exception('Failed to cancel order: $e');
    }
  }

  // إنشاء رقم تتبع فريد
  String _generateTrackingNumber() {
    final now = DateTime.now();
    final year = now.year.toString().substring(2); // آخر رقمين من السنة
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    final random =
        (1000 + (DateTime.now().millisecondsSinceEpoch % 9000)).toString();

    return 'TRK$year$month$day$random';
  }
}
