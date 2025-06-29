// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotemodelAdapter extends TypeAdapter<Notemodel> {
  @override
  final int typeId = 0;

  @override
  Notemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notemodel(
      Title: fields[0] as String,
      SubTitle: fields[1] as String,
      Date: fields[2] as String,
      color: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Notemodel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.Title)
      ..writeByte(1)
      ..write(obj.SubTitle)
      ..writeByte(2)
      ..write(obj.Date)
      ..writeByte(3)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
