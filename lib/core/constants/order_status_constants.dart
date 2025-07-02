/// ثوابت حالات الطلب المشتركة بين تطبيق المستخدم ولوحة التحكم
class OrderStatusConstants {
  // حالات الطلب الأساسية
  static const String pending = 'pending';
  static const String confirmed = 'confirmed';
  static const String processing = 'processing';
  static const String shipping = 'shipping';
  static const String delivered = 'delivered';
  static const String cancelled = 'cancelled';
  static const String refunded = 'refunded';

  /// الحصول على جميع الحالات
  static List<String> getAllStatuses() {
    return [
      pending,
      confirmed,
      processing,
      shipping,
      delivered,
      cancelled,
      refunded,
    ];
  }

  /// الحصول على اسم العرض للحالة
  static String getDisplayName(String status) {
    switch (status.toLowerCase()) {
      case pending:
        return 'قيد المراجعة';
      case confirmed:
        return 'تم التأكيد';
      case processing:
        return 'قيد المعالجة';
      case shipping:
        return 'قيد الشحن';
      case delivered:
        return 'تم التسليم';
      case cancelled:
        return 'ملغي';
      case refunded:
        return 'تم الاسترداد';
      default:
        return 'غير محدد';
    }
  }

  /// التحقق من أن الحالة صحيحة
  static bool isValidStatus(String status) {
    return getAllStatuses().contains(status.toLowerCase());
  }

  /// الحصول على ترتيب الحالة (للعرض في الخط الزمني)
  static int getStatusOrder(String status) {
    switch (status.toLowerCase()) {
      case pending:
        return 0;
      case confirmed:
        return 1;
      case processing:
        return 2;
      case shipping:
        return 3;
      case delivered:
        return 4;
      case cancelled:
        return -1; // حالة نهائية
      case refunded:
        return -1; // حالة نهائية
      default:
        return 0;
    }
  }
}
