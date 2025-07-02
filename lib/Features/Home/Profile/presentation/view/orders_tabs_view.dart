import 'package:flutter/material.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import 'package:frutes_app/core/widgets/custom_app_bar.dart';
import 'active_orders_view.dart';
import 'inactive_orders_view.dart';

class OrdersTabsView extends StatefulWidget {
  final String userId;

  const OrdersTabsView({
    super.key,
    required this.userId,
  });

  @override
  State<OrdersTabsView> createState() => _OrdersTabsViewState();
}

class _OrdersTabsViewState extends State<OrdersTabsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _activeTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _activeTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          appBar(context, title: 'طلباتي', onTap: () => Navigator.pop(context)),
      body: Column(
        children: [
          // Custom Tab Bar
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.green1_500,
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[600],
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        size: 20,
                        color: _activeTabIndex == 0
                            ? Colors.white
                            : Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      const Text('النشطة'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 20,
                        color: _activeTabIndex == 1
                            ? Colors.white
                            : Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      const Text('المكتملة'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ActiveOrdersView(userId: widget.userId),
                InactiveOrdersView(userId: widget.userId),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
