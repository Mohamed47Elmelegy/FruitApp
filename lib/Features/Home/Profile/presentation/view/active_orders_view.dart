import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import 'package:frutes_app/core/widgets/custom_app_bar.dart';
import 'package:frutes_app/Features/check_out/presentation/manager/active_orders_cubit.dart';
import '../widget/active_orders_view_body.dart';

class ActiveOrdersView extends StatelessWidget {
  final String userId;

  const ActiveOrdersView({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ActiveOrdersCubit>()..loadActiveOrders(userId),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(context,
            title: 'الطلبات النشطة', onTap: () => Navigator.pop(context)),
        body: BlocBuilder<ActiveOrdersCubit, ActiveOrdersState>(
          builder: (context, state) {
            if (state is ActiveOrdersLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.green1_500,
                ),
              );
            } else if (state is ActiveOrdersLoaded) {
              if (state.orders.isEmpty) {
                return _buildEmptyState();
              }
              return ActiveOrdersViewBody(
                orders: state.orders,
                onRefresh: () =>
                    context.read<ActiveOrdersCubit>().refreshOrders(userId),
              );
            } else if (state is ActiveOrdersError) {
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
            Icons.inventory_2_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'لا توجد طلبات نشطة',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'الطلبات النشطة ستظهر هنا',
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
                context.read<ActiveOrdersCubit>().refreshOrders(userId),
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
