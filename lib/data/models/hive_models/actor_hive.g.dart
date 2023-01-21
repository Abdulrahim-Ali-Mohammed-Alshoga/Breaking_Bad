// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActorsHiveAdapter extends TypeAdapter<ActorsHive> {
  @override
  final int typeId = 0;

  @override
  ActorsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActorsHive(
      fields[0] as String,
      fields[1] as String,
      fields[5] as String,
      (fields[6] as List).cast<dynamic>(),
      fields[4] as String,
      (fields[3] as List).cast<dynamic>(),
      fields[2] as int,
      fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ActorsHive obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.numbersSeasonsAppeared)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.realNameActor)
      ..writeByte(6)
      ..write(obj.occupation)
      ..writeByte(7)
      ..write(obj.occupationDeadOrLive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActorsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
