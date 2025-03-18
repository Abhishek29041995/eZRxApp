// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_suggestion_history_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductSuggestionHistoryDtoAdapter
    extends TypeAdapter<_$ProductSuggestionHistoryDtoImpl> {
  @override
  final int typeId = 38;

  @override
  _$ProductSuggestionHistoryDtoImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ProductSuggestionHistoryDtoImpl(
      searchKeyList:
          fields[0] == null ? [] : (fields[0] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$ProductSuggestionHistoryDtoImpl obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.searchKeyList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductSuggestionHistoryDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductSuggestionHistoryDtoImpl _$$ProductSuggestionHistoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductSuggestionHistoryDtoImpl(
      searchKeyList: (json['searchKeyList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ProductSuggestionHistoryDtoImplToJson(
        _$ProductSuggestionHistoryDtoImpl instance) =>
    <String, dynamic>{
      'searchKeyList': instance.searchKeyList,
    };
