import 'package:frutes_app/core/entities/proudcuts_entity.dart';

import '../entities/reviews_entity.dart';

ProductsEntity getDummyProduct() {
  return ProductsEntity(
    productName: 'برتقال',
    productCode: '123',
    productDescription:
        '''This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details.
 The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.
 I've made the descriptions as detailed as possible, while also withholding as many details as possible. This may sound odd, but I've done it by mostly describing how a character looks, rather than his or her personality. I've tried to make the character's looks and some vague personality traits dictate what kind of person he or she could be.
 For example, a character with a scar could've received it during battle, but in this generator it could also have been due to an ex-lover, an epic adventure, or a tale of regaining ones honor.
 I hope by doing this you will be able to let your imagination loose and fill in the blanks. One description could create hundreds of characters which all look the same, but are entirely different people.
 To start, simply click on the button to generate a random description. Don't like the description? Simply click again to get a new one.''',
    //   'ينتمي إلى الفصيلة القرعية ولثمرته لُب حلو المذاق وقابل للأكل، وبحسب علم النبات فهي تعتبر ثمار لبيّة، تستعمل لفظة البطيخ للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً',
    productPrice: 2.5,
    reviews: [
      ReviewsEntity(
          name: 'محمد',
          image:
              'https://jhkvhvqdwhvcyssralfz.supabase.co/storage/v1/object/public/fruits_images/images/orange-white-white-b.png',
          rating: 4.5,
          date: DateTime.now().timeZoneName,
          description: 'منتج رائع ')
    ],
    productRating: 4.5,
    ratingCount: 10,
    expiryDateMonths: 6,
    calorieDensity: 75,
    caloriesReferenceWeight: 100,
    isOrganic: true,
    isFeatured: true,
    imageUrl:
        'https://jhkvhvqdwhvcyssralfz.supabase.co/storage/v1/object/public/fruits_images/images/orange-white-white-b.png',
  );
}

List<ProductsEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
