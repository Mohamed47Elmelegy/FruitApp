import 'package:flutter/material.dart';
import 'package:frutes_app/core/widgets/custom_header.dart';
import 'orders_view_body_bloc_consumer.dart';

class OrdersViewBody extends StatefulWidget {
  const OrdersViewBody({super.key});

  @override
  State<OrdersViewBody> createState() => _OrdersViewBodyState();
}

class _OrdersViewBodyState extends State<OrdersViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerAppBar(
        context,
        title: 'طلباتي',
        arrowOnTap: () => Navigator.pop(context),
        arrowVisible: true,
        notificationVisible: false,
      ),
      body: const OrdersViewBodyBlocConsumer(),
    );
  }
}
