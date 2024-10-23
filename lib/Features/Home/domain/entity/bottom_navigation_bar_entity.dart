import '../../../../core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, notActiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.notActiveImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
          activeImage: Assets.imagesBoldHome,
          notActiveImage: Assets.imagesOutlineHome,
          name: 'الرئيسية'),
      BottomNavigationBarEntity(
          activeImage: Assets.imagesBoldProducts,
          notActiveImage: Assets.imagesOutlineProducts,
          name: 'المنتجات'),
      BottomNavigationBarEntity(
          activeImage: Assets.imagesBoldShoppingCart,
          notActiveImage: Assets.imagesOutlineShoppingCart,
          name: 'سلة التسوق'),
      BottomNavigationBarEntity(
          activeImage: Assets.imagesBoldUser,
          notActiveImage: Assets.imagesOutlineUser,
          name: 'حسابي'),
    ];
