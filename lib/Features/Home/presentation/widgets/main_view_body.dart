import 'package:flutter/material.dart';

import '../../Cart/presentation/view/cart_view.dart';
import '../../Products/presentation/view/products_view.dart';
import '../../Profile/presentation/view/profile_view.dart';
import '../view/home_view.dart';


class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeView(),
        ProductsView(),
        CartView(),
        ProfileView(),
      ],
    );
  }
}
