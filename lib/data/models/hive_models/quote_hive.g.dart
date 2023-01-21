// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuoteHiveAdapter extends TypeAdapter<QuoteHive> {
  @override
  final int typeId = 0;

  @override
  QuoteHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuoteHive(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QuoteHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.quote);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuoteHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
