import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.products,
  });

  final ProductsEntity products;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: products.imageUrl!,
      errorWidget: (context, url, error) => const Center(
        child: Icon(Icons.image, color: Colors.grey),
      ),
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
