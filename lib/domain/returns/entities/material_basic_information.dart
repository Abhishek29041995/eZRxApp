import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_basic_information.freezed.dart';

@freezed
class MaterialBasicInformation with _$MaterialBasicInformation {
  const MaterialBasicInformation._();

  const factory MaterialBasicInformation({
    required SalesOrg salesOrg,
    required String partnerRole,
    required String partnerNumber,
  }) = _MaterialBasicInformation;

  factory MaterialBasicInformation.empty() => MaterialBasicInformation(
        salesOrg: SalesOrg(''),
        partnerRole: '',
        partnerNumber: '',
      );
}
