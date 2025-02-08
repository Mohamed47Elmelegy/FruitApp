import 'package:flutter/material.dart';
import 'package:frutes_app/Features/Home/Cart/domain/cart_item_entity.dart';
import 'package:gap/gap.dart';
import 'cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        separatorBuilder: (context, index) => const Gap(14),
        itemBuilder: (context, index) => CartItem(
              cartItem: cartItems[index],
            ),
        itemCount: cartItems.length);
  }
}
