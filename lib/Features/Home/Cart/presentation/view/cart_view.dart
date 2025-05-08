import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/Home/Cart/presentation/manager/cubits/Cart_item_cubit/cart_item_cubit.dart';
import 'package:frutes_app/Features/Home/Cart/presentation/widget/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => CartItemCubit(),
        child:const CartViewBody(),
      ),
    );
  }
}
