import 'package:flutter/material.dart';
import 'package:frutes_app/Features/check_out/presentation/widgets/checkout_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/check_out/presentation/manager/order_cubit.dart';
import 'package:frutes_app/Features/check_out/presentation/manager/address_cubit.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/Features/check_out/domain/usecase/save_order_usecase.dart';
import 'package:frutes_app/Features/check_out/domain/Repositories/address_repository.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderCubit>(
          create: (_) => OrderCubit(getIt<SaveOrderUseCase>()),
        ),
        BlocProvider<AddressCubit>(
          create: (_) => AddressCubit(getIt<AddressRepository>()),
        ),
      ],
      child: const Scaffold(body: CheckoutViewBody()),
    );
  }
}
