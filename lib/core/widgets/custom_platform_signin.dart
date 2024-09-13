import 'package:flutter/material.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:frutes_app/core/theme/text_theme.dart';
import 'package:gap/gap.dart';

class PlatformSignin extends StatelessWidget {
  final Widget icon; // أيقونة كودجت يمكن أن تكون Icon أو Image
  final String label; // النص
  final VoidCallback onPressed; // الإجراء عند الضغط
  final Color color; // لون الزر
  final Color textColor; // لون النص
  final Color borderColor; // لون الإطار
  final double borderRadius; // الزوايا المستديرة
  final double height; // ارتفاع الزر
  final double width;
  const PlatformSignin({
    super.key,
    required this.icon, // الأيقونة إلزامية
    required this.label, // النص إلزامي
    required this.onPressed, // الإجراء إلزامي
    required this.color, // اللون إلزامي
    required this.textColor, // لون النص إلزامي
    required this.borderColor, // لون الإطار إلزامي
    required this.borderRadius, // الزوايا إلزامية
    required this.height,
    required this.width, // ارتفاع الزر إلزامي
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      iconAlignment: IconAlignment.start,
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: color, // لون الخلفية
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), // زوايا مستديرة
        ),
        side: BorderSide(color: borderColor), // لون الإطار
        padding: EdgeInsets.zero, // إزالة الحشو الافتراضي
        minimumSize: Size.fromHeight(height), // تعيين الارتفاع
      ),
      child: Container(
        height: height, // تعيين الارتفاع للزر
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon, // استخدام الأيقونة كمتغير Widget
            const Gap(53),
            Text(
              label,
              style:
                  AppTextStyles.bodyBaseSemiBold16.copyWith(color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
