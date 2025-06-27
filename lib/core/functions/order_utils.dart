import 'package:frutes_app/Features/check_out/domain/entity/order_entity.dart';

/// وظائف مساعدة للتعامل مع الطلبات
class OrderUtils {
  /// الحصول على معرف الطلب المنسق للعرض
  /// يستخدم orderId إذا كان متوفراً، وإلا يستخدم uid
  static String getOrderId(OrderEntity order) {
    // استخدام orderId إذا كان متوفراً، وإلا استخدام uid
    if (order.orderId != null && order.orderId!.isNotEmpty) {
      return order.orderId!.substring(0, 8).toUpperCase();
    }

    // محاولة استخراج orderId من البيانات أو استخدام uid
    try {
      // إذا كان هناك orderId في البيانات
      if (order.uid.length > 8) {
        return order.uid.substring(0, 8).toUpperCase();
      }
      return order.uid.toUpperCase();
    } catch (e) {
      return order.uid.substring(0, 8).toUpperCase();
    }
  }

  /// تنسيق التاريخ للعرض
  static String formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year} - ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateString;
    }
  }
}
