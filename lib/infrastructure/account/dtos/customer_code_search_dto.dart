import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_code_search_dto.freezed.dart';
part 'customer_code_search_dto.g.dart';

@freezed
class CustomerCodeSearchDto with _$CustomerCodeSearchDto {
  const CustomerCodeSearchDto._();
  const factory CustomerCodeSearchDto({
    @JsonKey(name: 'salesOrganisation', defaultValue: '')
        required String salesOrg,
    @JsonKey(name: 'first', defaultValue: 24) required int first,
    @JsonKey(name: 'filterBlockCustomer', defaultValue: false)
        required bool filterBlockCustomer,
    @JsonKey(name: 'after', defaultValue: 0) required int after,
    @JsonKey(name: 'searchKey', defaultValue: '') required String searchKey,
  }) = _CustomerCodeSearchDto;

  factory CustomerCodeSearchDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerCodeSearchDtoFromJson(json);

  Map<String, dynamic> toMap() =>
      toJson()..removeWhere((key, value) => value is String && value.isEmpty);
}
