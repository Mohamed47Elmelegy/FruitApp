import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/check_out/domain/entity/order_entity.dart';
import 'package:frutes_app/Features/Home/Profile/presentation/manager/cubit/orders_cubit.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/Features/check_out/domain/usecase/get_user_orders_usecase.dart';
import 'package:frutes_app/Features/check_out/domain/usecase/delete_order_usecase.dart';
import '../widget/order_item_view_body.dart';

class OrderItemView extends StatelessWidget {
  final OrderEntity order;

  const OrderItemView({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(
        getIt.get<GetUserOrdersUseCase>(),
        getIt.get<DeleteOrderUseCase>(),
      ),
      child: OrderItemViewBody(order: order),
    );
  }
}
