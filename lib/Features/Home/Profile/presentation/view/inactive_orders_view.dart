import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import 'package:frutes_app/core/widgets/custom_app_bar.dart';
import 'package:frutes_app/Features/check_out/presentation/manager/inactive_orders_cubit.dart';
import 'package:frutes_app/Features/check_out/domain/entity/order_tracking_entity.dart';
import 'package:frutes_app/core/routes/page_routes_name.dart';
import '../widget/inactive_orders_view_body.dart';

class InactiveOrdersView extends StatelessWidget {
  final String userId;

  const InactiveOrdersView({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<InactiveOrdersCubit>()..loadInactiveOrders(userId),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(context,
            title: 'الطلبات المكتملة', onTap: () => Navigator.pop(context)),
        body: BlocBuilder<InactiveOrdersCubit, InactiveOrdersState>(
          builder: (context, state) {
            if (state is InactiveOrdersLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.green1_500,
                ),
              );
            } else if (state is InactiveOrdersLoaded) {
              if (state.orders.isEmpty) {
                return _buildEmptyState();
              }
              return InactiveOrdersViewBody(
                orders: state.orders,
                onRefresh: () =>
                    context.read<InactiveOrdersCubit>().refreshOrders(userId),
              );
            } else if (state is InactiveOrdersError) {
              return _buildErrorState(context, state.message);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'لا توجد طلبات مكتملة',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'الطلبات المكتملة والملغاة ستظهر هنا',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.red[400],
          ),
          const SizedBox(height: 16),
          Text(
            'حدث خطأ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () =>
                context.read<InactiveOrdersCubit>().refreshOrders(userId),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green1_500,
              foregroundColor: Colors.white,
            ),
            child: const Text('إعادة المحاولة'),
          ),
        ],
      ),
    );
  }
}
