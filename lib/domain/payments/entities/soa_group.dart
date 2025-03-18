import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soa_group.freezed.dart';

@freezed
class SoaGroup with _$SoaGroup {
  factory SoaGroup({
    required int createdDate,
    required List<Soa> soaList,
  }) = _SoaGroup;

  factory SoaGroup.empty() => SoaGroup(
        createdDate: 0,
        soaList: <Soa>[],
      );
}
