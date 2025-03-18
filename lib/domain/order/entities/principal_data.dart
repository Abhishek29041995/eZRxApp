import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'principal_data.freezed.dart';

@freezed
class PrincipalData with _$PrincipalData {
  const PrincipalData._();

  const factory PrincipalData({
    required PrincipalName principalName,
    required PrincipalCode principalCode,
  }) = _PrincipalData;

  factory PrincipalData.empty() => PrincipalData(
        principalName: PrincipalName(''),
        principalCode: PrincipalCode(''),
      );

  bool doesCodeOrNameContainText(String text) =>
      principalName.getOrDefaultValue('').toLowerCase().contains(text) ||
      principalCode.getOrDefaultValue('').toLowerCase().contains(text);

  String get searchItemText =>
      '${principalName.getOrDefaultValue('')} - ${principalCode.getOrDefaultValue('')}';

  bool get isEmpty => this == PrincipalData.empty();

  bool get isNotEmpty => this != PrincipalData.empty();
}

extension PrincipalDataExtension on List<PrincipalData> {
  List<PrincipalData> listContainText(String text) =>
      where((e) => e.doesCodeOrNameContainText(text)).toList();

  PrincipalData getByText(String text) => firstWhere(
        (e) => e.searchItemText == text,
        orElse: () => PrincipalData.empty(),
      );
}
