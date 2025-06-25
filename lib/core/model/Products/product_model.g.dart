// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 2;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      productName: fields[0] as String,
      productPrice: fields[1] as num,
      productCode: fields[2] as String,
      productDescription: fields[3] as String,
      isFeatured: fields[4] as bool,
      imageUrl: fields[5] as String?,
      expiryDateMonths: fields[6] as int,
      calorieDensity: fields[7] as int,
      unitAmount: fields[8] as int,
      productRating: fields[9] as num,
      ratingCount: fields[10] as num,
      isOrganic: fields[11] as bool,
      reviews: (fields[12] as List).cast<ReviewsModel>(),
      sellingCount: fields[13] as num,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.productName)
      ..writeByte(1)
      ..write(obj.productPrice)
      ..writeByte(2)
      ..write(obj.productCode)
      ..writeByte(3)
      ..write(obj.productDescription)
      ..writeByte(4)
      ..write(obj.isFeatured)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.expiryDateMonths)
      ..writeByte(7)
      ..write(obj.calorieDensity)
      ..writeByte(8)
      ..write(obj.unitAmount)
      ..writeByte(9)
      ..write(obj.productRating)
      ..writeByte(10)
      ..write(obj.ratingCount)
      ..writeByte(11)
      ..write(obj.isOrganic)
      ..writeByte(12)
      ..write(obj.reviews)
      ..writeByte(13)
      ..write(obj.sellingCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
