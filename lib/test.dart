import 'package:flutter/material.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductsEntity product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  ProductDetailsPageState createState() => ProductDetailsPageState();
}

class ProductDetailsPageState extends State<ProductDetailsPage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل المنتج'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // الجزء الثابت (الصورة)
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Image.network(
              widget.product.imageUrl!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
            ),
          ),

          // الجزء القابل للتمرير
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.productName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${widget.product.productPrice} ريال',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _buildRatingStars(widget.product.productRating.toDouble()),
                  const SizedBox(height: 20),
                  const Text(
                    'الوصف',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  LayoutBuilder(
                    builder: (context, constraints) {
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
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16),
                            ),
                            secondChild: Text(
                              widget.product.productDescription,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                            child: Text(
                              _isExpanded ? 'عرض أقل' : 'عرض المزيد',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: MaterialButton(
                      height: 50,
                      minWidth: 200,
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'أضف إلى السلة',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      children: [
        ...List.generate(
            fullStars, (index) => const Icon(Icons.star, color: Colors.amber)),
        if (hasHalfStar) const Icon(Icons.star_half, color: Colors.amber),
        ...List.generate(5 - fullStars - (hasHalfStar ? 1 : 0),
            (index) => const Icon(Icons.star_border, color: Colors.amber)),
        const SizedBox(width: 8),
        Text(
          '(${rating.toStringAsFixed(1)})',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
