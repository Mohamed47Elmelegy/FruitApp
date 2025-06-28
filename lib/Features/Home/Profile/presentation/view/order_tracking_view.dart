import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_header.dart';
import '../widget/order_tracking_view_body.dart';

class OrderTrackingView extends StatelessWidget {
  final String trackingNumber;
  final String source;

  const OrderTrackingView({
    super.key,
    required this.trackingNumber,
    this.source = 'orders_list',
  });

  @override
  Widget build(BuildContext context) {
    // Validate tracking number
    if (trackingNumber.isEmpty) {
      // Redirect to home if tracking number is empty
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (route) => false,
        );
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        _handleBackNavigation(context);
        return false; // منع السلوك الافتراضي
      },
      child: Scaffold(
        appBar: headerAppBar(context, title: 'تتبع الطلب', arrowOnTap: () {
          _handleBackNavigation(context);
        }, arrowVisible: true, notificationVisible: false, color: Colors.white),
        body: OrderTrackingViewBody(
          trackingNumber: trackingNumber,
          source: source,
        ),
      ),
    );
  }

  void _handleBackNavigation(BuildContext context) {
    if (source == 'checkout') {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        (route) => false,
      );
    } else {
      Navigator.pop(context);
    }
  }
}
