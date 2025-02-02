import 'package:flutter/material.dart';
import 'package:frutes_app/Features/Home/Cart/presentation/widget/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      backgroundColor: Colors.white,
      body: CartViewBody(),
    );
  }
}
