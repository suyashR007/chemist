// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chemist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChemistModelAdapter extends TypeAdapter<ChemistModel> {
  @override
  final int typeId = 0;

  @override
  ChemistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChemistModel(
      chemistCode: fields[0] as String?,
      name: fields[1] as String?,
      location: fields[2] as String?,
      mobile: fields[3] as String?,
      email: fields[4] as String?,
      mcrNo: fields[5] as String?,
      lastMonthrcpa: fields[6] as String?,
      lastrcpaDate: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ChemistModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.chemistCode)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.mobile)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.mcrNo)
      ..writeByte(6)
      ..write(obj.lastMonthrcpa)
      ..writeByte(7)
      ..write(obj.lastrcpaDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChemistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
