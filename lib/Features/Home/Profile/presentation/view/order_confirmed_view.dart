import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/routes/page_routes_name.dart';
import '../../../../../core/theme/colors_theme.dart';

class OrderConfirmedView extends StatelessWidget {
  final String trackingNumber;
  const OrderConfirmedView({super.key, required this.trackingNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تم تأكيد الطلب'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 24),
            const Text(
              'تم تأكيد طلبك بنجاح!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Gap(150.h),
            // Delivery truck icon for tracking

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        PageRoutesName.orderTracking,
                        arguments: {
                          'trackingNumber': trackingNumber,
                          'source': 'checkout',
                        },
                      );
                    },
                    icon: const Icon(Icons.local_shipping),
                    label: const Text('تتبع الطلب'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green1_500,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        PageRoutesName.home,
                        (route) => false,
                      );
                    },
                    icon: const Icon(Icons.home),
                    label: const Text('الرئيسية'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
