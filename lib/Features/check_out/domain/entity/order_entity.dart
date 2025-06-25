class OrderEntity {
  final String uid;
  final List<Map<String, dynamic>> products;
  final double subtotal;
  final double delivery;
  final double total;
  final String createdAt;
  final Map<String, dynamic>? address;
  final String status;

  OrderEntity({
    required this.uid,
    required this.products,
    required this.subtotal,
    required this.delivery,
    required this.total,
    required this.createdAt,
    required this.address,
    required this.status,
  });
}
