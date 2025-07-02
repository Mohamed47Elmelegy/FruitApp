import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/Home/Profile/presentation/manager/cubit/orders_cubit.dart';
import 'package:frutes_app/core/functions/get_user.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/Features/check_out/domain/usecase/get_user_orders_usecase.dart';
import 'package:frutes_app/Features/check_out/domain/usecase/delete_order_usecase.dart';
import 'package:frutes_app/Features/check_out/domain/usecase/cancel_order_usecase.dart';
import '../widget/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(
        getIt.get<GetUserOrdersUseCase>(),
        getIt.get<DeleteOrderUseCase>(),
        getIt.get<CancelOrderUseCase>(),
      )..loadUserOrders(getUser().uId),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: OrdersViewBody(),
      ),
    );
  }
}
