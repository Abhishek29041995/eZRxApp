// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JWTDtoAdapter extends TypeAdapter<JWTDto> {
  @override
  final int typeId = 0;

  @override
  JWTDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JWTDto(
      access: fields[0] as String,
      refresh: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JWTDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.access)
      ..writeByte(1)
      ..write(obj.refresh);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JWTDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
