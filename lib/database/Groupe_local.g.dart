// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Groupe_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupeAdapter extends TypeAdapter<Groupe> {
  @override
  final int typeId = 5;

  @override
  Groupe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Groupe(
      libelle: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Groupe obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.libelle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
