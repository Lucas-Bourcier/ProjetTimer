// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Timer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimerAdapter extends TypeAdapter<Timer> {
  @override
  final int typeId = 3;

  @override
  Timer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Timer(
      duree: fields[0] as int,
      description: fields[1] as String,
      statut: fields[2] as String,
      visible: fields[3] as Bool,
      ordre: fields[4] as int,
      dateActivation: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Timer obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.duree)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.statut)
      ..writeByte(3)
      ..write(obj.visible)
      ..writeByte(4)
      ..write(obj.ordre)
      ..writeByte(5)
      ..write(obj.dateActivation);
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
