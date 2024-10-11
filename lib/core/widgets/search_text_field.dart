import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frutes_app/core/widgets/custom_text_field.dart';

import '../utils/app_images.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: CustomTextField(
        keyboardType: TextInputType.text,
        hint: 'ابحث عن.......',
        prefixIcon: SizedBox(
          width: 20,
          child: Center(
            child: SvgPicture.asset(Assets.imagesSearchNormal),
          ),
        ),
        suffixWidget: SizedBox(
          width: 20,
          child: Center(
            child: SvgPicture.asset(
              Assets.imagesFilter,
            ),
          ),
        ),
        filled: true,
        fillColor: const Color(0xffFFFFFF),
        onValidate: (value) {
          return null;
        },
        hintColor: const Color(0xFF949D9E),
        enabled: true,
      ),
    );
  }
}
