import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'bonus_sample_item_dto.freezed.dart';
part 'bonus_sample_item_dto.g.dart';

@freezed
class BonusSampleItemDto with _$BonusSampleItemDto {
  const BonusSampleItemDto._();
  const factory BonusSampleItemDto({
    @JsonKey(name: 'materialNumber', defaultValue: '')
    required String materialNumber,
    @JsonKey(name: 'productCount', defaultValue: 0) required int qty,
    @JsonKey(name: 'principalName', defaultValue: '')
    required String principalName,
    @JsonKey(name: 'materialDescription', defaultValue: '')
    required String materialDescription,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
    required String defaultMaterialDescription,
    @JsonKey(name: 'principalCode', defaultValue: '')
    required String principalCode,
    @JsonKey(name: 'itemId', defaultValue: '') required String itemId,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
    required String itemRegistrationNumber,
  }) = _BonusSampleItemDto;

  BonusSampleItem toDomain() {
    return BonusSampleItem(
      qty: MaterialQty(qty),
      materialDescription: defaultMaterialDescription,
      materialNumber: MaterialNumber(materialNumber),
      principalData: PrincipalData(
        principalCode: PrincipalCode(principalCode),
        principalName: PrincipalName(principalName),
      ),
      itemId: StringValue(itemId),
      type: MaterialInfoType(type),
      stockInfo: StockInfo.empty(),
      itemRegistrationNumber: ItemRegistrationNumber(itemRegistrationNumber),
      bonusOverrideFlag: false,
      isGimmick: false,
      isPoison: false,
      isSampleMaterial: false,
    );
  }

  factory BonusSampleItemDto.fromDomain(BonusSampleItem bonus) {
    return BonusSampleItemDto(
      materialDescription: bonus.materialDescription,
      materialNumber: bonus.materialNumber.getOrCrash(),
      qty: bonus.qty.getOrCrash(),
      principalCode: bonus.principalData.principalCode.getOrCrash(),
      principalName: bonus.principalData.principalName.getOrCrash(),
      itemId: bonus.itemId.getOrCrash(),
      type: bonus.type.getOrCrash(),
      defaultMaterialDescription: bonus.materialDescription,
      itemRegistrationNumber:
          bonus.itemRegistrationNumber.getOrDefaultValue(''),
    );
  }

  factory BonusSampleItemDto.fromJson(Map<String, dynamic> json) =>
      _$BonusSampleItemDtoFromJson(json);
}
