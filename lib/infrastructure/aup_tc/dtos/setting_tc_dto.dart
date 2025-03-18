import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_tc_dto.freezed.dart';
part 'setting_tc_dto.g.dart';

@Freezed(toJson: false)
class SettingTcDto with _$SettingTcDto {
  const SettingTcDto._();

  const factory SettingTcDto({
    @JsonKey(name: 'updateAcceptanceStatus', defaultValue: false)
        required bool acceptTC,
  }) = _SettingTcDto;

  SettingTc toDomain() {
    return SettingTc(
      acceptTC: acceptTC,
    );
  }

  factory SettingTcDto.fromJson(Map<String, dynamic> json) =>
      _$SettingTcDtoFromJson(json);
}
