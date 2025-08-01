// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReviewsModelAdapter extends TypeAdapter<ReviewsModel> {
  @override
  final int typeId = 1;

  @override
  ReviewsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewsModel(
      name: fields[0] as String,
      image: fields[1] as String,
      rating: fields[2] as num,
      date: fields[3] as String,
      description: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReviewsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
