import 'package:flutter/material.dart';

import '../../../../../core/functions/get_dummy_products.dart';
import '../widget/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: CartViewBody( products: getDummyProduct() ),
    );
  }
}
