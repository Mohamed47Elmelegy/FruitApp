import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/check_out/domain/entity/order_entity.dart';
import 'package:frutes_app/Features/Home/Profile/presentation/manager/cubit/orders_cubit.dart';
import 'package:frutes_app/core/functions/get_user.dart';
import 'package:frutes_app/core/services/snack_bar_service.dart';

class OrderDeleteButton extends StatelessWidget {
  final OrderEntity order;

  const OrderDeleteButton({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => _showDeleteConfirmation(context),
        icon: const Icon(Icons.delete, size: 16),
        label: const Text('حذف الطلب'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: context.read<OrdersCubit>(),
          child: AlertDialog(
            title: const Text('حذف الطلب'),
            content: const Text('هل أنت متأكد من حذف الطلب؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('إلغاء'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  _deleteOrder(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: const Text('حذف'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _deleteOrder(BuildContext context) {
    if (order.orderId != null) {
      context.read<OrdersCubit>().deleteOrder(order.orderId!, getUser().uId);
      SnackBarService.showSuccessMessage('تم حذف الطلب بنجاح');
    } else {
      SnackBarService.showErrorMessage(
          'لا يمكن حذف الطلب - معرف الطلب غير متوفر');
    }
  }
}
