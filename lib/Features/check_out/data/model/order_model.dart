import 'package:frutes_app/Features/check_out/domain/entity/order_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel extends OrderEntity {
  final String? adminNotes;
  final String? assignedAdminId;
  final DateTime? lastUpdated;
  final List<OrderStatusHistory> statusHistory;

  OrderModel({
    required super.uid,
    required super.products,
    required super.subtotal,
    required super.delivery,
    required super.total,
    required super.createdAt,
    required super.address,
    required super.status,
    super.trackingNumber,
    super.orderId,
    this.adminNotes,
    this.assignedAdminId,
    this.lastUpdated,
    this.statusHistory = const [],
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    DateTime? lastUpdatedDateTime;
    if (json['lastUpdated'] is Timestamp) {
      lastUpdatedDateTime = (json['lastUpdated'] as Timestamp).toDate();
    } else if (json['lastUpdated'] is String) {
      lastUpdatedDateTime = DateTime.tryParse(json['lastUpdated']);
    } else if (json['updatedAt'] is String) {
      lastUpdatedDateTime = DateTime.tryParse(json['updatedAt']);
    }
    return OrderModel(
      uid: json['uid'],
      products: List<Map<String, dynamic>>.from(json['products']),
      subtotal: json['subtotal'].toDouble(),
      delivery: json['delivery'].toDouble(),
      total: json['total'].toDouble(),
      createdAt: json['createdAt'],
      address: json['address'],
      status: json['status'],
      trackingNumber: json['trackingNumber'],
      orderId: json['orderId'],
      adminNotes: json['adminNotes'],
      assignedAdminId: json['assignedAdminId'],
      lastUpdated: lastUpdatedDateTime,
      statusHistory: json['statusHistory'] != null
          ? List<OrderStatusHistory>.from(
              json['statusHistory'].map((x) => OrderStatusHistory.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'products': products,
      'subtotal': subtotal,
      'delivery': delivery,
      'total': total,
      'createdAt': createdAt,
      'address': address,
      'status': status,
      'trackingNumber': trackingNumber,
      'orderId': orderId,
      'adminNotes': adminNotes,
      'assignedAdminId': assignedAdminId,
      'lastUpdated': lastUpdated?.toIso8601String(),
      'statusHistory': statusHistory.map((x) => x.toJson()).toList(),
    };
  }

  OrderModel copyWith({
    String? uid,
    List<Map<String, dynamic>>? products,
    double? subtotal,
    double? delivery,
    double? total,
    String? createdAt,
    Map<String, dynamic>? address,
    String? status,
    String? trackingNumber,
    String? orderId,
    String? adminNotes,
    String? assignedAdminId,
    DateTime? lastUpdated,
    List<OrderStatusHistory>? statusHistory,
  }) {
    return OrderModel(
      uid: uid ?? this.uid,
      products: products ?? this.products,
      subtotal: subtotal ?? this.subtotal,
      delivery: delivery ?? this.delivery,
      total: total ?? this.total,
      createdAt: createdAt ?? this.createdAt,
      address: address ?? this.address,
      status: status ?? this.status,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      orderId: orderId ?? this.orderId,
      adminNotes: adminNotes ?? this.adminNotes,
      assignedAdminId: assignedAdminId ?? this.assignedAdminId,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      statusHistory: statusHistory ?? this.statusHistory,
    );
  }
}

class OrderStatusHistory {
  final String status;
  final String updatedBy;
  final DateTime updatedAt;
  final String? notes;

  OrderStatusHistory({
    required this.status,
    required this.updatedBy,
    required this.updatedAt,
    this.notes,
  });

  factory OrderStatusHistory.fromJson(Map<String, dynamic> json) {
    final updatedAt = json['updatedAt'];
    DateTime updatedAtDateTime;
    if (updatedAt is Timestamp) {
      updatedAtDateTime = updatedAt.toDate();
    } else if (updatedAt is String) {
      updatedAtDateTime = DateTime.parse(updatedAt);
    } else {
      updatedAtDateTime = DateTime.now();
    }
    return OrderStatusHistory(
      status: json['status'],
      updatedBy: json['updatedBy'],
      updatedAt: updatedAtDateTime,
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt.toIso8601String(),
      'notes': notes,
    };
  }
}
