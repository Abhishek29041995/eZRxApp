// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cred_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CredDtoAdapter extends TypeAdapter<CredDto> {
  @override
  final int typeId = 1;

  @override
  CredDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CredDto(
      username: fields[0] as String,
      password: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CredDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CredDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
