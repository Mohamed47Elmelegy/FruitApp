import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/Home/Cart/presentation/manager/cubits/Cart_cubit/cart_cubit.dart';

import '../../../../core/services/snack_bar_service.dart';
import 'main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddItemToCart) {
          SnackBarService.showSuccessMessage('تم اضافة المنتج بنجاح');
        }
        if (state is RemoveItemFromCart) {
          SnackBarService.showSuccessMessage('تم حذف المنتج بنجاح');
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
