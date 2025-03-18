// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_selector_storage_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountSelectorStorageDtoAdapter
    extends TypeAdapter<AccountSelectorStorageDto> {
  @override
  final int typeId = 4;

  @override
  AccountSelectorStorageDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountSelectorStorageDto(
      salesOrg: fields[0] as String,
      customerCode: fields[1] as String,
      shippingAddress: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AccountSelectorStorageDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.salesOrg)
      ..writeByte(1)
      ..write(obj.customerCode)
      ..writeByte(2)
      ..write(obj.shippingAddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountSelectorStorageDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
