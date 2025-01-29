import 'package:flutter/material.dart';

import '../../../../../../core/entities/proudcuts_entity.dart';
import '../../../../../../core/theme/text_theme.dart';

class ProductDescription extends StatefulWidget {
  final ProductsEntity product;
  const ProductDescription({
    super.key,
    required this.product,
  });
  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool _isExpanded = false;
  int maxline = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: Text(
            widget.product.productDescription,
            maxLines: maxline,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodySmallRegular13,
          ),
          secondChild: Text(
            widget.product.productDescription,
            style: AppTextStyles.bodySmallRegular13,
          ),
        ),
        Visibility(
          visible: widget.product.productDescription.length > maxline,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? 'عرض أقل' : 'عرض المزيد',
              style: AppTextStyles.bodySmallRegular13.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
