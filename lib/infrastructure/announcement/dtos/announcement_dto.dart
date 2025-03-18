import 'dart:convert';

import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/announcement/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_dto.freezed.dart';
part 'announcement_dto.g.dart';

@Freezed(toJson: false)
class AnnouncementDto with _$AnnouncementDto {
  const AnnouncementDto._();

  const factory AnnouncementDto({
    @JsonKey(name: 'active', defaultValue: false) required bool active,
    @JsonKey(name: 'descriptionList', defaultValue: [])
        required List<AnnouncementMessageDto> descriptionList,
    @JsonKey(name: 'startTime', defaultValue: '') required String startTime,
    @JsonKey(name: 'endTime', defaultValue: '') required String endTime,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'day', defaultValue: '') required String day,
    @JsonKey(name: 'functionLabel', defaultValue: '')
        required String functionLabel,
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'isModuleSpecific', defaultValue: false)
        required bool isModuleSpecific,
    @_ModuleNameConverter()
    @JsonKey(name: 'moduleName', defaultValue: [])
        required List<String> moduleName,
    @JsonKey(name: 'loginType', defaultValue: '') required String loginType,
    @JsonKey(name: 'isCrossButton', defaultValue: false)
        required bool isCrossButton,
  }) = _AnnouncementDto;

  Announcement get toDomain {
    return Announcement(
      active: active,
      descriptionList: descriptionList.map((e) => e.toDomain).toList(),
      startTime: DateTimeStringValue(startTime),
      endTime: DateTimeStringValue(endTime),
      type: AnnouncementType(type),
      day: day,
      functionLabel: functionLabel,
      id: id,
      isModuleSpecific: isModuleSpecific,
      moduleName: moduleName.map((e) => AnnouncementDislayModule(e)).toList(),
      loginType: AnnouncementDislayTime(loginType),
      isCrossButton: isCrossButton,
    );
  }

  factory AnnouncementDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementDtoFromJson(json);
}

@freezed
class AnnouncementMessageDto with _$AnnouncementMessageDto {
  const AnnouncementMessageDto._();

  const factory AnnouncementMessageDto({
    @JsonKey(name: 'languageCode', defaultValue: '')
        required String languageCode,
    @JsonKey(name: 'language', defaultValue: '') required String language,
    @JsonKey(name: 'announcement', defaultValue: '')
        required String announcement,
  }) = _AnnouncementMessageDto;

  factory AnnouncementMessageDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementMessageDtoFromJson(json);

  AnnouncementMessage get toDomain => AnnouncementMessage(
        languageCode: languageCode,
        language: language,
        announcement: announcement,
      );
}

class _ModuleNameConverter extends JsonConverter<List<String>, String> {
  const _ModuleNameConverter();

  @override
  List<String> fromJson(String json) {
    if (json.isEmpty) return [];
    final list = jsonDecode(
      json.replaceAll('\\"', '"'),
    );

    return List.from(list);
  }

  @override
  String toJson(List<String> object) {
    return jsonEncode(object).toString();
  }
}
