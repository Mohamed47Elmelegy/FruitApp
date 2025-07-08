class AppSettings {
  String appName;
  String currency;
  double deliveryFee;
  bool maintenanceMode;
  double minOrderAmount;
  String supportEmail;
  String supportPhone;
  String version;

  AppSettings({
    required this.appName,
    required this.currency,
    required this.deliveryFee,
    required this.maintenanceMode,
    required this.minOrderAmount,
    required this.supportEmail,
    required this.supportPhone,
    required this.version,
  });

  factory AppSettings.fromMap(Map<String, dynamic> map) => AppSettings(
        appName: map['appName'] ?? '',
        currency: map['currency'] ?? '',
        deliveryFee: (map['deliveryFee'] ?? 0).toDouble(),
        maintenanceMode: map['maintenanceMode'] ?? false,
        minOrderAmount: (map['minOrderAmount'] ?? 0).toDouble(),
        supportEmail: map['supportEmail'] ?? '',
        supportPhone: map['supportPhone'] ?? '',
        version: map['version'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'appName': appName,
        'currency': currency,
        'deliveryFee': deliveryFee,
        'maintenanceMode': maintenanceMode,
        'minOrderAmount': minOrderAmount,
        'supportEmail': supportEmail,
        'supportPhone': supportPhone,
        'version': version,
      };
}
