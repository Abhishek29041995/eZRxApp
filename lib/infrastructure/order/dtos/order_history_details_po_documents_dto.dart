import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/entities/po_documents.dart';

part 'order_history_details_po_documents_dto.freezed.dart';
part 'order_history_details_po_documents_dto.g.dart';

@freezed
class PoDocumentsDto with _$PoDocumentsDto {
  const PoDocumentsDto._();
  const factory PoDocumentsDto({
    @JsonKey(
      name: 'url',
      defaultValue: '',
      readValue: JsonReadValueHelper.readUrl,
    )
    required String url,
    @JsonKey(
      name: 'name',
      defaultValue: '',
      readValue: JsonReadValueHelper.readFileName,
    )
    required String name,
    @JsonKey(
      name: 'path',
      defaultValue: '',
      readValue: JsonReadValueHelper.readUrl,
    )
    required String path,
    @Default(PoDocumentFlagsDto.empty)
    @JsonKey(name: 'flags')
    PoDocumentFlagsDto flags,
  }) = _PoDocumentsDto;
  factory PoDocumentsDto.fromDomain(
    PoDocuments orderHistoryDetailsPODocuments,
  ) {
    return PoDocumentsDto(
      url: orderHistoryDetailsPODocuments.url,
      name: orderHistoryDetailsPODocuments.name,
      path: orderHistoryDetailsPODocuments.url,
      flags:
          PoDocumentFlagsDto(isPoison: orderHistoryDetailsPODocuments.isPoison),
    );
  }

  PoDocuments toDomain() => PoDocuments(
        url: url,
        name: name,
        size: FileSize(0),
        isPoison: flags.isPoison,
      );

  factory PoDocumentsDto.fromJson(Map<String, dynamic> json) =>
      _$PoDocumentsDtoFromJson(json);
}

@freezed
class PoDocumentFlagsDto with _$PoDocumentFlagsDto {
  const PoDocumentFlagsDto._();
  const factory PoDocumentFlagsDto({
    @JsonKey(name: 'isPoison', defaultValue: false) required bool isPoison,
  }) = _PoDocumentFlagsDto;

  factory PoDocumentFlagsDto.fromJson(Map<String, dynamic> json) =>
      _$PoDocumentFlagsDtoFromJson(json);

  static const empty = PoDocumentFlagsDto(isPoison: false);
}
