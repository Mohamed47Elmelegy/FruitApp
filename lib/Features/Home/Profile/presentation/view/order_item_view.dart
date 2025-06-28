import 'package:flutter/material.dart';
import 'package:frutes_app/Features/check_out/domain/entity/order_entity.dart';
import '../widget/order_item_view_body.dart';

class OrderItemView extends StatelessWidget {
  final OrderEntity order;

  const OrderItemView({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return OrderItemViewBody(order: order);
  }
}
