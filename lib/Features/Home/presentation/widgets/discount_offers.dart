import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frutes_app/Features/Home/presentation/widgets/disount_offers_build_page.dart';
import 'package:frutes_app/core/utils/app_images.dart';

class DiscountOffersSection extends StatelessWidget {
  const DiscountOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeOutQuad,
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
        aspectRatio: 342 / 158,
        viewportFraction: 1.0,
        scrollPhysics: const BouncingScrollPhysics(),
      ),
      items: [
        buildOfferPage(Assets.imagesDiscountOffers),
        buildOfferPage(Assets.imagesDiscountOffers),
      ],
    );
  }
}
