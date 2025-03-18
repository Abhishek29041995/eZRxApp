import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soa_dto.freezed.dart';
part 'soa_dto.g.dart';

@freezed
class SoaDto with _$SoaDto {
  const SoaDto._();
  factory SoaDto({
    @JsonKey(name: 'name', defaultValue: '') required String name,
  }) = _SoaDto;

  factory SoaDto.fromJson(Map<String, dynamic> json) => _$SoaDtoFromJson(json);

  Soa toDomain() => Soa(soaData: SoaData(name));
}
