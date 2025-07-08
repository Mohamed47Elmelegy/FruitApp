import 'package:cloud_firestore/cloud_firestore.dart';

class AppSettings {
  final double deliveryFee;
  final double minOrderAmount;
  final double maxOrderAmount;
  final String currency;

  AppSettings({
    required this.deliveryFee,
    required this.minOrderAmount,
    required this.maxOrderAmount,
    required this.currency,
  });

  factory AppSettings.fromMap(Map<String, dynamic> map) => AppSettings(
        deliveryFee: (map['deliveryFee'] ?? 0).toDouble(),
        minOrderAmount: (map['minOrderAmount'] ?? 0).toDouble(),
        maxOrderAmount: (map['maxOrderAmount'] ?? 0).toDouble(),
        currency: map['currency'] ?? 'جنيه',
      );
}

class AppSettingsService {
  static Future<AppSettings> fetchAppSettings() async {
    final doc = await FirebaseFirestore.instance
        .collection('appSettings')
        .doc('general')
        .get();
    if (doc.exists) {
      return AppSettings.fromMap(doc.data()!);
    }
    // القيم الافتراضية إذا لم يوجد مستند
    return AppSettings(
        deliveryFee: 0, minOrderAmount: 1, maxOrderAmount: 0, currency: 'جنيه');
  }
}
