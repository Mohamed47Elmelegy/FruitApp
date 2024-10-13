import 'package:flutter/material.dart';

Widget buildOfferPage(String assetPath) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    decoration: const BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    ),
    child: Image.asset(
      assetPath,
      fit: BoxFit.fill,
    ),
  );
}
