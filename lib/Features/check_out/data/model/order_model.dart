import '../../domain/entity/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.uid,
    required super.products,
    required super.subtotal,
    required super.delivery,
    required super.total,
    required super.createdAt,
    required super.address,
    required super.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'products': products,
      'subtotal': subtotal,
      'delivery': delivery,
      'total': total,
      'createdAt': createdAt,
      'address': address,
      'status': status,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      uid: map['uid'],
      products: List<Map<String, dynamic>>.from(map['products'] ?? []),
      subtotal: (map['subtotal'] as num).toDouble(),
      delivery: (map['delivery'] as num).toDouble(),
      total: (map['total'] as num).toDouble(),
      createdAt: map['createdAt'],
      address: map['address'],
      status: map['status'],
    );
  }

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      uid: entity.uid,
      products: entity.products,
      subtotal: entity.subtotal,
      delivery: entity.delivery,
      total: entity.total,
      createdAt: entity.createdAt,
      address: entity.address,
      status: entity.status,
    );
  }
}
