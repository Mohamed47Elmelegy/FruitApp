import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/Home/Profile/presentation/manager/cubit/orders_cubit.dart';
import 'package:frutes_app/Features/check_out/domain/entity/order_entity.dart';
import 'package:frutes_app/core/functions/get_user.dart';
import '../view/order_item_view.dart';

class OrdersTabView extends StatelessWidget {
  final List<OrderEntity> orders;

  const OrdersTabView({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: const TabBar(
              labelColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.green,
              tabs: [
                Tab(text: 'قيد المراجعة'),
                Tab(text: 'قيد الشحن'),
                Tab(text: 'تم التوصيل'),
                Tab(text: 'ملغي'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildOrdersList(context, 'pending'),
                _buildOrdersList(context, 'shipping'),
                _buildOrdersList(context, 'delivered'),
                _buildOrdersList(context, 'cancelled'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList(BuildContext context, String status) {
    var filteredOrders =
        context.read<OrdersCubit>().getOrdersByStatus(orders, status);

    if (filteredOrders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getStatusIcon(status),
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'لا توجد طلبات ${_getStatusText(status)}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        // إعادة تحميل الطلبات
        context.read<OrdersCubit>().loadUserOrders(getUser().uId);
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filteredOrders.length,
        itemBuilder: (context, index) {
          return BlocProvider.value(
            value: context.read<OrdersCubit>(),
            child: OrderItemView(order: filteredOrders[index]),
          );
        },
      ),
    );
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'pending':
        return Icons.schedule;
      case 'shipping':
        return Icons.local_shipping;
      case 'delivered':
        return Icons.check_circle;
      case 'cancelled':
        return Icons.cancel;
      default:
        return Icons.shopping_bag_outlined;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'pending':
        return 'قيد المراجعة';
      case 'shipping':
        return 'قيد الشحن';
      case 'delivered':
        return 'تم التوصيل';
      case 'cancelled':
        return 'ملغي';
      default:
        return '';
    }
  }
}
