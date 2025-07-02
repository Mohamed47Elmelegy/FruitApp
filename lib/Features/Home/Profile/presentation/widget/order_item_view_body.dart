import 'package:flutter/material.dart';
import 'package:frutes_app/Features/check_out/domain/entity/order_entity.dart';
import 'order_header_section.dart';
import 'order_delete_button.dart';
import 'order_cancel_button.dart';
import 'order_tracking_section.dart';
import 'order_products_section.dart';
import 'order_financial_section.dart';
import 'order_address_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItemViewBody extends StatelessWidget {
  final OrderEntity order;

  const OrderItemViewBody({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section - رقم الطلب والحالة
            OrderHeaderSection(order: order),

            // Action Buttons Section - أزرار الحذف والإلغاء
            if (order.orderId != null) ...[
              Row(
                children: [
                  // Delete Button - زر حذف الطلب (للطلبات المعلقة فقط)
                  if (order.status == 'pending') ...[
                    OrderDeleteButton(order: order),
                    const SizedBox(width: 8),
                  ],
                  // Cancel Button - زر إلغاء الطلب (للطلبات غير المكتملة)
                  if (order.status != 'delivered' &&
                      order.status != 'cancelled' &&
                      order.status != 'refunded') ...[
                    OrderCancelButton(order: order),
                  ],
                ],
              ),
            ],

            // Tracking Section - رقم التتبع
            if (order.trackingNumber != null) ...[
              OrderTrackingSection(order: order),
            ],

            // Products Section - تفاصيل المنتجات
            OrderProductsSection(order: order),

            // Financial Section - التفاصيل المالية
            OrderFinancialSection(order: order),

            // Address Section - عنوان التوصيل
            if (order.address != null) ...[
              OrderAddressSection(order: order),
            ],
          ],
        ),
      ),
    );
  }
}
