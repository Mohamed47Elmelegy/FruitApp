import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';

class CusomtNetwarkImage extends StatelessWidget {
  const CusomtNetwarkImage({
    super.key,
  
    required this.products,
  });

  final ProductsEntity products;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: products.imageUrl!,
      errorWidget: (context, url, error) => const Icon(Icons.error),
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
