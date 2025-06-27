import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frutes_app/core/services/snack_bar_service.dart';

class OrderTrackingDialog extends StatelessWidget {
  final String trackingNumber;

  const OrderTrackingDialog({super.key, required this.trackingNumber});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('متابعة الشحن'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'رقم التتبع الخاص بك:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    trackingNumber,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: trackingNumber));
                    SnackBarService.showSuccessMessage('تم نسخ رقم التتبع');
                  },
                  icon: const Icon(Icons.copy, size: 16),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'يمكنك استخدام هذا الرقم لمتابعة شحنتك عبر:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 12),
          _buildTrackingOption(
            context,
            'موقع البريد المصري',
            'https://www.egyptpost.org/tracking',
            Icons.language,
          ),
          const SizedBox(height: 8),
          _buildTrackingOption(
            context,
            'تطبيق البريد المصري',
            'egyptpost://tracking',
            Icons.phone_android,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('إغلاق'),
        ),
      ],
    );
  }

  Widget _buildTrackingOption(
    BuildContext context,
    String title,
    String url,
    IconData icon,
  ) {
    return InkWell(
      onTap: () {
        // يمكن إضافة logic لفتح الرابط أو التطبيق
        SnackBarService.showSuccessMessage('سيتم فتح $title قريباً');
        Navigator.of(context).pop();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.blue[600],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
