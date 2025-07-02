import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/check_out/domain/entity/order_entity.dart';
import 'package:frutes_app/Features/Home/Profile/presentation/manager/cubit/orders_cubit.dart';
import 'package:frutes_app/core/functions/get_user.dart';
import 'package:frutes_app/core/services/snack_bar_service.dart';

class OrderCancelButton extends StatelessWidget {
  final OrderEntity order;

  const OrderCancelButton({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () => _showCancelConfirmation(context),
        icon: const Icon(
          Icons.cancel_outlined,
          color: Colors.orange,
          size: 24,
        ),
        tooltip: 'إلغاء الطلب',
        style: IconButton.styleFrom(
          backgroundColor: Colors.orange.withValues(alpha: 0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  void _showCancelConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: context.read<OrdersCubit>(),
          child: AlertDialog(
            title: const Text('إلغاء الطلب'),
            content: const Text(
                'هل أنت متأكد من إلغاء الطلب؟\nسيتم إزالة رقم التتبع.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('إلغاء'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  _cancelOrder(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.orange,
                ),
                child: const Text('إلغاء الطلب'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _cancelOrder(BuildContext context) {
    if (order.orderId != null) {
      context.read<OrdersCubit>().cancelOrder(
            order.orderId!,
            getUser().uId,
            notes: 'تم إلغاء الطلب من قبل العميل',
          );
      SnackBarService.showSuccessMessage('تم إلغاء الطلب بنجاح');
    } else {
      SnackBarService.showErrorMessage(
          'لا يمكن إلغاء الطلب - معرف الطلب غير متوفر');
    }
  }
}
