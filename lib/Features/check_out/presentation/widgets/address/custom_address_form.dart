import 'package:flutter/material.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import '../../../../../core/widgets/custom_switch.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class CustomAddressForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController detailsController;
  final VoidCallback onSaved;
  final VoidCallback? onCancel;
  final bool saveAddress;
  final ValueChanged<bool> onSaveAddressChanged;

  const CustomAddressForm({
    super.key,
    required this.formKey,
    required this.fullNameController,
    required this.emailController,
    required this.addressController,
    required this.cityController,
    required this.detailsController,
    required this.onSaved,
    this.onCancel,
    required this.saveAddress,
    required this.onSaveAddressChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: fullNameController,
              hint: 'الاسم كامل',
              onValidate: (v) => v == null || v.isEmpty ? 'مطلوب' : null,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: emailController,
              hint: 'البريد الإلكتروني',
              onValidate: (v) => v == null || v.isEmpty ? 'مطلوب' : null,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: addressController,
              hint: 'العنوان',
              onValidate: (v) => v == null || v.isEmpty ? 'مطلوب' : null,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: cityController,
              hint: 'المدينة',
              onValidate: (v) => v == null || v.isEmpty ? 'مطلوب' : null,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: detailsController,
              hint: 'رقم الطابق , رقم الشقة ..',
              onValidate: (v) => v == null || v.isEmpty ? 'مطلوب' : null,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('حفظ العنوان  '),
                const SizedBox(width: 10),
                CustomSwitch(
                  isSwitchOn: saveAddress,
                  onChanged: (val) {
                    onSaveAddressChanged(val);
                    if (val) {
                      if (formKey.currentState!.validate()) {
                        onSaved();
                      }
                    }
                  },
                ),
              ],
            ),
            if (onCancel != null)
              TextButton(
                onPressed: onCancel,
                child: const Text('إلغاء'),
              ),
          ],
        ).setHorizontalPadding(context, 16, enableMediaQuery: false),
      ),
    );
  }
}
