import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';

part 'return_item_details_dto.freezed.dart';
part 'return_item_details_dto.g.dart';

@freezed
class ReturnItemDetailsDto with _$ReturnItemDetailsDto {
  const ReturnItemDetailsDto._();

  const factory ReturnItemDetailsDto({
    @JsonKey(name: 'returnQuantity', defaultValue: 0)
    required int returnQuantity,
    @JsonKey(
      name: 'materialNumber',
      defaultValue: '',
    )
    required String materialNumber,
    @JsonKey(name: 'lineNumber', defaultValue: '') required String lineNumber,
    @JsonKey(
      name: 'batch',
      defaultValue: '',
    )
    required String batch,
    @JsonKey(
      name: 'returnReason',
      defaultValue: '',
    )
    required String returnReason,
    @JsonKey(
      name: 'url',
      defaultValue: [],
    )
    required List<String> url,
    @JsonKey(
      name: 'returnType',
      defaultValue: '',
    )
    required String returnType,
    @JsonKey(
      name: 'remarks',
      defaultValue: '',
    )
    required String remarks,
    @JsonKey(
      name: 'outsidePolicy',
      defaultValue: false,
    )
    required bool outsidePolicy,
    @JsonKey(
      name: 'priceOverride',
      defaultValue: '',
    )
    required String priceOverride,
  }) = _ReturnItemDetailsDto;

  factory ReturnItemDetailsDto.fromDomain(ReturnItemDetails returnItemDetail) {
    return ReturnItemDetailsDto(
      batch: returnItemDetail.batch,
      lineNumber: returnItemDetail.itemNumber,
      materialNumber: returnItemDetail.materialNumber.getOrCrash(),
      returnQuantity: returnItemDetail.returnQuantity.getIntValue,
      returnReason: returnItemDetail.returnReason,
      url: returnItemDetail.uploadedFiles.map((e) => e.url).toList(),
      returnType: returnItemDetail.returnType.getOrDefaultValue('500'),
      remarks: returnItemDetail.remarks.getOrDefaultValue(''),
      outsidePolicy: returnItemDetail.outsidePolicy,
      priceOverride: returnItemDetail.returnType.isCounterOfferElegible
          ? returnItemDetail.priceOverride.getOrDefaultValue('')
          : '',
    );
  }

  factory ReturnItemDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnItemDetailsDtoFromJson(json);
}
