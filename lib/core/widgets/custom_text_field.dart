import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import 'package:frutes_app/core/theme/text_theme.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPassword;
  final String? hint;
  final bool? enabled;
  final int? maxLines, minLines, maxLength;
  final String? obscuringCharacter, value;
  final String? Function(String?)? onValidate;
  final void Function(String?)? onChanged, onFieldSubmitted, onSaved;
  final void Function()? onEditingComplete, onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixWidget, prefixIcon;
  final IconData? icon;
  final TextInputAction? action;
  final FocusNode? focusNode;
  final Color? hintColor;
  final Color? fillColor;
  final bool? filled;

  const CustomTextField({
    Key? key,
    this.controller,
    this.isPassword,
    this.hint,
    this.enabled,
    this.obscuringCharacter,
    this.value,
    this.onValidate,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onSaved,
    this.onTap,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.suffixWidget,
    this.icon,
    this.prefixIcon,
    this.action,
    this.focusNode,
    this.hintColor = AppColors.grayscale400,
    this.fillColor,
    this.filled,
    String? initialValue,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.value,
      validator: widget.onValidate,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      maxLines: widget.isPassword ?? false ? 1 : widget.maxLines, // تعديل هنا
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      obscureText: widget.isPassword ?? false ? obscureText : false,
      obscuringCharacter: '*',
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      style: AppTextStyles.bodyBaseSemiBold16
          .copyWith(color: AppColors.grayscale950),
      textInputAction: widget.action ?? TextInputAction.done,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword ?? false
            ? InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.grayscale400,
                ),
              )
            : widget.suffixWidget,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hint,
        fillColor: const Color(
          0xffF9FAFA,
        ),
        filled: true,
        hintStyle: AppTextStyles.bodySmallBold13
            .copyWith(color: AppColors.grayscale400),
        counterText: "",
        // border: OutlineInputBorder(
        //   borderSide: const BorderSide(
        //     width: 1,
        //     color: Color(0xffF9FAFA),
        //   ),
        //   borderRadius: BorderRadius.circular(4),
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffE6E9EA),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xffE6E9EA),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        errorStyle: const TextStyle(
          color: Colors.deepOrangeAccent,
          fontWeight: FontWeight.w400,
        ),
        errorMaxLines: 6,
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.deepOrangeAccent,
            width: 1,
          ),
        ),
      ),
    );
  }
}
