// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competitor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompetatiorModelAdapter extends TypeAdapter<CompetatiorModel> {
  @override
  final int typeId = 4;

  @override
  CompetatiorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompetatiorModel(
      productName: fields[0] as String?,
      productCode: fields[1] as String?,
      compProductCode: fields[2] as String?,
      compProductName: fields[3] as String?,
      comapnyName: fields[4] as String?,
      companyCode: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CompetatiorModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.productName)
      ..writeByte(1)
      ..write(obj.productCode)
      ..writeByte(2)
      ..write(obj.compProductCode)
      ..writeByte(3)
      ..write(obj.compProductName)
      ..writeByte(4)
      ..write(obj.comapnyName)
      ..writeByte(5)
      ..write(obj.companyCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompetatiorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
