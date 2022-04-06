// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Timer_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimerAdapter extends TypeAdapter<Timer> {
  @override
  final int typeId = 6;

  @override
  Timer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Timer()
      ..name = fields[0] as String
      ..duree = fields[1] as int
      ..description = fields[2] as String
      ..statut = fields[3] as bool
      ..visible = fields[4] as bool
      ..ordre = fields[5] as int
      ..activationDate = fields[6] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Timer obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.duree)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.statut)
      ..writeByte(4)
      ..write(obj.visible)
      ..writeByte(5)
      ..write(obj.ordre)
      ..writeByte(6)
      ..write(obj.activationDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
