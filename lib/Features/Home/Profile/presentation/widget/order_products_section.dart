import 'package:flutter/material.dart';
import 'package:frutes_app/Features/check_out/domain/entity/order_entity.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';

class OrderProductsSection extends StatelessWidget {
  final OrderEntity order;

  const OrderProductsSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Row(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                size: 16,
                color: AppColors.green1_500,
              ),
               SizedBox(width: 8),
               Text(
                'المنتجات:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...order.products
              .map((product) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '${product['name']} (${product['count']})',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '${product['price']} ج.م',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.green1_500,
                          ),
                        ),
                      ],
                    ),
                  ))
             
        ],
      ),
    );
  }
}
