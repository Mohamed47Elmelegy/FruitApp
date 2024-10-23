import 'package:flutter/material.dart';
import '../theme/colors_theme.dart';
import '../theme/text_theme.dart';
import '../utils/app_images.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                )),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(Assets.imagesStrawberryPng),
                const SizedBox(
                  height: 24,
                ),
                ListTile(
                  title: const Text(
                    'Strawberry',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.bodyBaseSemiBold16,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'جنية',
                          style: AppTextStyles.bodySmallBold13.copyWith(
                            color: AppColors.orange500,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: AppTextStyles.bodySmallBold13.copyWith(
                            color: AppColors.orange300,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: AppTextStyles.bodySmallBold13.copyWith(
                            color: AppColors.orange500,
                          ),
                        ),
                        TextSpan(
                          text: 'كيلو',
                          style: AppTextStyles.bodySmallBold13.copyWith(
                            color: AppColors.orange300,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: AppColors.green1_500,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
